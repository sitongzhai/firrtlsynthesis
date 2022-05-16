//******************************************************************************
//* Support bigInt and bigUnsigned in C++ for calculating bit width of a data in FIRRTL file,
//* Because the data can be so large that a 32-bit or 64-bit computer cannot be expressed in 'int' form.
//* The data type can be signed and unsigned, the form can be true value or literal form;
//* And the base can be binary, octal, decimal, and hex
//* 
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#include <algorithm>
#include "utility/big_int.h"

namespace firrtlsyn {
  Miracl precision = Miracl(5000, 16);
  miracl* BigInt::mip_ = &precision;
  const std::string RADIX_BIT = "b";
  const std::string RADIX_OCT = "o";
  const std::string RADIX_DEC = "d";
  const std::string RADIX_HEX = "h";

  bool BigInt::init() {
    if (isInited()) return true;
    fs_assert(big_ == NULL);
    //fs_assert(radix_ == 0);
    std::string origin = this->getOriginValue();
    // remove ' ' in front of number
    origin.erase(0, origin.find_first_not_of(" "));
    if (origin.size() == 0) {
      this->printValidFirrtlValue();
      return false;
    }
    size_t index = 0;
    // get radix
    char radix = origin[index];
    if (radix == 'b' || radix == 'B') {
      radix_ = 2;
      index++;
    } else if (radix == 'o' || radix == 'O') {
      radix_ = 8;
      index++;
    } else if (radix == 'd' || radix == 'D') {
      radix_ = 10;
      index++;
    } else if (radix == 'h' || radix == 'H') {
      radix_ = 16;
      index++;
    }
    // get sign
    char sign = origin[index];
    std::string big_value = origin.substr(index); 
    if (sign == '+') {
      index++;
      //big_value = "+" + origin.substr(index);
      big_value = origin.substr(index);
    } else if (sign == '-') {
      if (this->isUInt()) {
        fs_error("*ERROR*: Value '%s' was expected to an unsigned integer, but it is a signed integer with minus sign.\n", origin.c_str());
        return false;
      }
      big_value = origin.substr(index);
      index++;
      //big_value = "-" + origin.substr(index);
    }
    //std::string big_value = origin.substr(index);

    // for number value without radix and sign
    char number_char = origin[index];
    if (radix_ == 0 && number_char >= '0' && number_char <= '9') {
      radix_ = 10;
    }
    // check if number is legal
    for (size_t i = index; i < origin.size(); i++) {
      number_char = origin[i];
      bool good_value = true;
      if (radix_ == 2) {
        if (!(number_char == '0' || number_char == '1')) {
          good_value = false;
        }
      } else if (radix_ == 8) {
        if (!(number_char >= '0' && number_char <= '7')) {
          good_value = false;
        }
      } else if (radix_ == 10) {
        if (!(number_char >= '0' && number_char <= '9')) {
          good_value = false;
        }
      } else if (radix_ == 16) {
        if (!((number_char >= '0' && number_char <= '9') || (number_char >= 'a' && number_char <= 'f') || (number_char >= 'A' && number_char <= 'F'))) {
          good_value = false;
        }
      } else {
        good_value = false;
      }
      if (!good_value) {
        fs_error("*ERROR*: Illegal radix of value '%s'. Correct it and rerun.\n", origin.c_str());
        this->printValidFirrtlValue();
        return false;
      }
    }
    // initial big_
    mip_->ERCON = TRUE;
    int min_value_width = (int)origin.size() - (int)index;
    if (min_value_width > this->getMiraclIOBSIZ()) {
      this->setMiraclIOBufferSize(min_value_width);
    }
    this->setMiraclRadix(radix_);
    big_ = new Big(const_cast<char*>(big_value.c_str()));
    if (this->hasMiraclError()) {
      std::string error_msg = this->getMiraclErrorMsg();
      fs_error("*ERROR*: Miracl has error '%s' when initializing value of '%s'.\n", error_msg.c_str(), this->getOriginValue().c_str());
      if (big_ != NULL) delete big_;
      big_ = NULL;
      return false;
    }
    // calculate minimum width, for binary minimum width 
    int min_binary_width = min_value_width;
    if (radix_ == 2) {
      min_binary_width = min_binary_width;
    } else if (radix_ == 8) {
      min_binary_width = min_binary_width * 3;
    } else if (radix_ == 10) {
      //can not decide the origin can be transfered to int value, so log2 function can not be used.
      //min_binary_width = (int)std::log2(origin) + 1;
      //log2(10) = 3.3219, so decimal value may need 4 bit to represent one decimal number
      min_binary_width = min_binary_width * 4;
    } else if (radix_ == 16) {
      min_binary_width = min_binary_width * 4;
    } else {
      fs_assert(0);
    }
    std::string binary_value = this->getRadixValue(this->getBig(), 2, min_binary_width);
    if (binary_value[0] == '-') {
      fs_assert(sign == '-');
      fs_assert(this->isSInt());
      //min_width should be binary_value.size() - 1 then add 1 if first bit is 0, because of the first bit of signed minus number must be 1
      std::string binary_positive = "0" + binary_value.substr(1);
      std::string binary_complement = this->getBinaryComplement(binary_positive);
      fs_assert(binary_complement.size() >= 2);
      fs_assert(binary_complement[0] == '1'); // because each minus number is added a 0 infront before calculate complement
      if (binary_complement[1] == '1') { // for "-4" or "-8" "-16" "-32", first two bit are both '1', so the first '1' should be removed first;
        min_width_ = (int)binary_value.size() - 1;
        if (binary_complement.size() >= 3) {
          fs_assert(binary_complement[2] == '0'); // for miracl result, the result is most simplified, so "111" should not be happen in front of every minus binary number
        }
      } else {
        fs_assert(binary_complement[1] == '0');
        min_width_ = (int)binary_value.size();
      }
    } else {
      fs_assert(sign == '+' || (sign >= '0' && sign <= '9') || (sign >= 'a' && sign <= 'f') || (sign >= 'A' && sign <= 'F'));
      //for binary number starts with '1' like '11', this means the value is +11, so the minimum width should be add '0' first
      if (is_signed_ == true && binary_value[0] == '1') {
        binary_value = "0" + binary_value;
      }
      min_width_ = (int)binary_value.size();
    }
    if (this->hasMiraclError()) {
      std::string error_msg = this->getMiraclErrorMsg();
      fs_error("*ERROR*: Miracl has error '%s' when initializing value of '%s'.\n", error_msg.c_str(), this->getOriginValue().c_str());
      if (big_ != NULL) delete big_;
      big_ = NULL;
      return false;
    }
    return true;
  }
  void BigInt::printValidFirrtlValue() {
    fs_info("*INFO*: Use valid value sample in firrtl: b-1010, b0101, B+1010; o-1234, o2341, O3421; d+789, d678, D-459; H-ABC, HFA3, h+234D; -678, 478, +987.\n");
    return;
  }
  Big* BigInt::getBig() {
    if (!init()) return NULL;
    return big_;
  }
  int BigInt::getMinBinaryWidth() {
    if (!init()) return INT_MAX;
    return min_width_;
  }
  int BigInt::getRadix() {
    if (!init()) return 0;
    return radix_;
  }
  int BigInt::getSIntValue() {
    std::string origin_value = this->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the BigInt '%s' when getting it's SInt value. Correct it and return.\n", origin_value.c_str());
      return INT_MAX;
    }
    Big* big_value = this->getBig();
    if (big_value == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of BigInt '%s' when getting it's SInt value. Correct it and rerun.\n", origin_value.c_str());
      return INT_MAX;
    }
    if ((*big_value) > Big(INT_MAX)) {
      fs_warning("*WARNING*: This big value '%s' is too large to represented with an C++ 'int' value.\n", origin_value.c_str());
      return INT_MAX;
    }
    if ((*big_value) < Big(-INT_MAX)) {
      fs_warning("*WARNING*: This big value '%s' is too small to represented with an C++ 'int' value.\n", origin_value.c_str());
      return -INT_MAX;
    }
    int min_value_width = this->getMinBinaryWidth();
    int min_decimal_width = (int)(min_value_width / 3) + 1;
    std::string decimal_value = this->getRadixValue(big_value, 10, min_decimal_width);
    int result = std::stoi(decimal_value);
    return result;
  }
  unsigned int BigInt::getUIntValue() {
    std::string origin_value = this->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the BigInt '%s' when getting it's SInt value. Correct it and return.\n", origin_value.c_str());
      return INT_MAX;
    }
    Big* big_value = this->getBig();
    if (big_value == NULL) {
      fs_warning("*WARNING*: Failed to get the miracl big value of BigInt '%s' when getting it's SInt value. Correct it and rerun.\n", origin_value.c_str());
      return INT_MAX;
    }
    if ((*big_value) > Big(UINT_MAX)) {
      fs_warning("*WARNING*: This big value '%s' is too large to represented with an C++ 'unsigned int' value.\n", origin_value.c_str());
      return INT_MAX;
    }
    int min_value_width = this->getMinBinaryWidth();
    int min_decimal_width = (int)(min_value_width / 3) + 1;
    std::string decimal_value = this->getRadixValue(big_value, 10, min_decimal_width);
    int result = static_cast<int>(std::stoul(decimal_value));
    return result;
  }
  std::string BigInt::getBinaryValue() {
    std::string origin_value = this->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the BigInt '%s' when getting it's binary value. Correct it and return.\n", origin_value.c_str());
      return "";
    }
    Big* big_value = this->getBig();
    if (big_value == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of BigInt '%s' when getting it's binary value. Correct it and rerun.\n", origin_value.c_str());
      return "";
    }
    int min_value_width = this->getMinBinaryWidth();
    std::string bit_value = RADIX_BIT + this->getRadixValue(big_value, 2, min_value_width);
    return bit_value;
  }
  std::string BigInt::getOctalValue() {
    std::string origin_value = this->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the BigInt '%s' when getting it's octal value. Correct it and return.\n", origin_value.c_str());
      return "";
    }
    Big* big_value = this->getBig();
    if (big_value == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of BigInt '%s' when getting it's octal value. Correct it and rerun.\n", origin_value.c_str());
      return "";
    }
    int min_value_width = this->getMinBinaryWidth();
    int min_octal_width = (int)(min_value_width / 3) + 1;
    std::string oct_value = RADIX_OCT + this->getRadixValue(big_value, 8, min_octal_width);
    return oct_value;
  }
  std::string BigInt::getDecimalValue() {
    std::string origin_value = this->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the BigInt '%s' when getting it's decimal value. Correct it and return.\n", origin_value.c_str());
      return "";
    }
    Big* big_value = this->getBig();
    if (big_value == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of BigInt '%s' when getting it's decimal value. Correct it and rerun.\n", origin_value.c_str());
      return "";
    }
    int min_value_width = this->getMinBinaryWidth();
    int min_decimal_width = (int)(min_value_width / 4) + 1;
    std::string dec_value = RADIX_DEC + this->getRadixValue(big_value, 10, min_decimal_width);
    return dec_value;
  }
  std::string BigInt::getHexadecimalValue() {
    std::string origin_value = this->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the BigInt '%s' when getting it's hexadecimal value. Correct it and return.\n", origin_value.c_str());
      return "";
    }
    Big* big_value = this->getBig();
    if (big_value == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of BigInt '%s' when getting it's hexadecimal value. Correct it and rerun.\n", origin_value.c_str());
      return "";
    }
    int min_value_width = this->getMinBinaryWidth();
    int min_hexadecimal_width = (int)(min_value_width / 4) + 1;
    std::string hex_value = RADIX_HEX + this->getRadixValue(big_value, 16, min_hexadecimal_width);
    return hex_value;
  }
  std::string BigInt::getRadixValue(Big* big, int radix, int num_buffer_size) {
    // +1 for string end '\0'
    // another +1 for minus number with first char '-'
    int buffer_size = num_buffer_size + 2;
    char* op_bytes = new char[buffer_size];
    if (num_buffer_size > this->getMiraclIOBSIZ()) {
      this->setMiraclIOBufferSize(buffer_size);
    }
    this->setMiraclRadix(radix);
    op_bytes << (*big);
    std::string radix_value = op_bytes;
    delete op_bytes;
    op_bytes = NULL;
    if (this->hasMiraclError()) {
      std::string error_msg = this->getMiraclErrorMsg();
      fs_error("*ERROR*: Miracl has error '%s' when getting value of '%s' with radix '%d'.\n", error_msg.c_str(), this->getOriginValue().c_str(), radix);
      return "";
    } else {
      return radix_value;
    }
  }
  std::string BigInt::getBinaryComplement(const std::string& binary_value) {
    // calculate binary complement value of a legal binary value
    // for minus number, value + 1, and then change 1->0 , 0->1
    // equal with keep the last 1 value, and change others 1->0, 0->1;
    // for positive number, no change
    std::string result = binary_value;
    int pos = (int)result.size() - 1;
    for (; pos >= 0; pos--) {
      if (result[pos] == '1') {
        break;
      }
    }
    //// this means legal binary value
    //fs_assert(pos >= 1);
    if (pos <= 0) return result;
    // pos-- has not been execute after last when loop break
    for (pos = pos - 1; pos >= 0; pos--) {
      if (result[pos] == '1') {
        result[pos] = '0';
      } else if (result[pos] == '0') {
        result[pos] = '1';
      } else {
        fs_assert(0);
      }
    }
    return result;
  }
  std::string BigInt::getMiraclErrorMsg() {
    std::string error_msg = "";
    switch (mip_->ERNUM) {
    case 1:
      error_msg = "Number base too big for representation";
      break;
    case 2:
      error_msg = "Division by zero attempted";
      break;
    case 3:
      error_msg = "Overflow - Number too big";
      break;
    case 4:
      error_msg = "Internal result is negative";
      break;
    case 5:
      error_msg = "Input format error";
      break;
    case 6:
      error_msg = "Illegal number base";
      break;
    case 7:
      error_msg = "Illegal parameter usage";
      break;
    case 8:
      error_msg = "Out of space";
      break;
    case 9:
      error_msg = "Even root of a negative number";
      break;
    case 10:
      error_msg = "Raising integer to negative power";
      break;
    case 11:
      error_msg = "Attempt to take illegal root";
      break;
    case 12:
      error_msg = "Integer operation attempted on Flash number";
      break;
    case 13:
      error_msg = "Flash overflow";
      break;
    case 14:
      error_msg = "Numbers too big";
      break;
    case 15:
      error_msg = "Log of a non-positive number";
      break;
    case 16:
      error_msg = "Flash to double conversion failure";
      break;
    case 17:
      error_msg = "I/O buffer overflow";
      break;
    case 18:
      error_msg = "MIRACL not initialised - no call to mirsys()";
      break;
    case 19:
      error_msg = "Illegal modulus ";
      break;
    case 20:
      error_msg = "No modulus defined";
      break;
    case 21:
      error_msg = "Exponent too big";
      break;
    case 22:
      error_msg = "Unsupported Feature - check mirdef.h";
      break;
    case 23:
      error_msg = "Specified double length type isn't double length";
      break;
    case 24:
      error_msg = "Specified basis is NOT irreducible";
      break;
    case 25:
      error_msg = "Unable to control Floating-point rounding";
      break;
    case 26:
      error_msg = "Base must be binary (MR_ALWAYS_BINARY defined in mirdef.h ?)";
      break;
    case 27:
      error_msg = "No irreducible basis defined";
      break;
    case 28:
      error_msg = "Composite modulus";
      break;
    case 29:
      error_msg = "Input/output error when reading from RNG device node";
      break;
    default:
      error_msg = "Undefined error";
      break;
    }
    return error_msg;
  }
  std::string BigInt::add(BigInt* right) {
    std::string left_origin_value = this->getOriginValue();
    std::string right_origin_value = right->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the left BigInt '%s' in ADD operation. Correct it and return.\n", left_origin_value.c_str());
      return "";
    }
    if (!right->init()) {
      fs_error("*ERROR: Failed to initialize the right BigInt '%s' in ADD operation. Correct it and return.\n", right_origin_value.c_str());
      return "";
    }
    bool left_signed = this->getSigned();
    bool right_signed = right->getSigned();
    if (left_signed != right_signed) {
      //fs_error("*ERROR: The types of the two inputs '%s' and '%s' were different in ADD operation. Correct the two inputs and rerun.\n", left_origin_value.c_str(), right_origin_value.c_str());
      fs_error("*ERROR: The '%s' left BigInt '%s' is incompatible with '%s' right BigInt '%s' in ADD operation. Correct them and return.\n", left_signed ? "signed" : "unsigned", left_origin_value.c_str(), right_signed ? "signed" : "unsigned", right_origin_value.c_str());
      return "";
    }
    Big* left_big = this->getBig();
    Big* right_big = right->getBig();
    if (left_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of left BigInt '%s'. Correct it and rerun.\n", left_origin_value.c_str());
      return "";
    }
    if (right_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of right BigInt '%s'. Correct it and rerun.\n", right_origin_value.c_str());
      return "";
    }
    Big result = (*left_big) + (*right_big);
    int min_value_width = std::max(this->getMinBinaryWidth(), right->getMinBinaryWidth()) + 1;
    int min_hexadecimal_width = (int)(min_value_width / 4) + 1;
    std::string hex_result = RADIX_HEX + this->getRadixValue(&result, 16, min_hexadecimal_width);
    return hex_result;
  }
  std::string BigInt::sub(BigInt* right) {
    std::string left_origin_value = this->getOriginValue();
    std::string right_origin_value = right->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the left BigInt '%s' in SUB operation. Correct it and return.\n", left_origin_value.c_str());
      return "";
    }
    if (!right->init()) {
      fs_error("*ERROR: Failed to initialize the right BigInt '%s' in SUB operation. Correct it and return.\n", right_origin_value.c_str());
      return "";
    }
    bool left_signed = this->getSigned();
    bool right_signed = right->getSigned();
    if (left_signed != right_signed) {
      fs_error("*ERROR: The '%s' left BigInt '%s' is incompatible with '%s' right BigInt '%s' in SUB operation. Correct them and return.\n", left_signed ? "signed" : "unsigned", left_origin_value.c_str(), right_signed ? "signed" : "unsigned", right_origin_value.c_str());
      return "";
    }
    Big* left_big = this->getBig();
    Big* right_big = right->getBig();
    if (left_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of left BigInt '%s'. Correct it and rerun.\n", left_origin_value.c_str());
      return "";
    }
    if (right_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of right BigInt '%s'. Correct it and rerun.\n", right_origin_value.c_str());
      return "";
    }
    Big result = (*left_big) - (*right_big);
    int min_value_width = std::max(this->getMinBinaryWidth(), right->getMinBinaryWidth()) + 1;
    int min_hexadecimal_width = (int)(min_value_width / 4) + 1;
    std::string hex_result = RADIX_HEX + this->getRadixValue(&result, 16, min_hexadecimal_width);
    return hex_result;
  }
  std::string BigInt::mul(BigInt* right) {
    std::string left_origin_value = this->getOriginValue();
    std::string right_origin_value = right->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the left BigInt '%s' in MUL operation. Correct it and return.\n", left_origin_value.c_str());
      return "";
    }
    if (!right->init()) {
      fs_error("*ERROR: Failed to initialize the right BigInt '%s' in MUL operation. Correct it and return.\n", right_origin_value.c_str());
      return "";
    }
    bool left_signed = this->getSigned();
    bool right_signed = right->getSigned();
    if (left_signed != right_signed) {
      fs_error("*ERROR: The '%s' left BigInt '%s' is incompatible with '%s' right BigInt '%s' in MUL operation. Correct them and return.\n", left_signed ? "signed" : "unsigned", left_origin_value.c_str(), right_signed ? "signed" : "unsigned", right_origin_value.c_str());
      return "";
    }
    Big* left_big = this->getBig();
    Big* right_big = right->getBig();
    if (left_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of left BigInt '%s'. Correct it and rerun.\n", left_origin_value.c_str());
      return "";
    }
    if (right_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of right BigInt '%s'. Correct it and rerun.\n", right_origin_value.c_str());
      return "";
    }
    Big result = (*left_big) * (*right_big);
    int min_value_width = this->getMinBinaryWidth() + right->getMinBinaryWidth();
    int min_hexadecimal_width = (int)(min_value_width / 4) + 1;
    std::string hex_result = RADIX_HEX + this->getRadixValue(&result, 16, min_hexadecimal_width);
    return hex_result;
  }
  std::string BigInt::div(BigInt* right) {
    std::string left_origin_value = this->getOriginValue();
    std::string right_origin_value = right->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the left BigInt '%s' in DIV operation. Correct it and return.\n", left_origin_value.c_str());
      return "";
    }
    if (!right->init()) {
      fs_error("*ERROR: Failed to initialize the right BigInt '%s' in DIV operation. Correct it and return.\n", right_origin_value.c_str());
      return "";
    }
    bool left_signed = this->getSigned();
    bool right_signed = right->getSigned();
    if (left_signed != right_signed) {
      fs_error("*ERROR: The '%s' left BigInt '%s' is incompatible with '%s' right BigInt '%s' in DIV operation. Correct them and return.\n", left_signed ? "signed" : "unsigned", left_origin_value.c_str(), right_signed ? "signed" : "unsigned", right_origin_value.c_str());
      return "";
    }
    Big* left_big = this->getBig();
    Big* right_big = right->getBig();
    if (left_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of left BigInt '%s'. Correct it and rerun.\n", left_origin_value.c_str());
      return "";
    }
    if (right_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of right BigInt '%s'. Correct it and rerun.\n", right_origin_value.c_str());
      return "";
    }
    Big result = (*left_big) / (*right_big);
    int min_value_width = this->getMinBinaryWidth() + 1;
    if (this->isSInt()) {
      min_value_width = min_value_width + 1;
    }
    int min_hexadecimal_width = (int)(min_value_width / 4) + 1;
    std::string hex_result = RADIX_HEX + this->getRadixValue(&result, 16, min_hexadecimal_width);
    return hex_result;
  }
  std::string BigInt::mod(BigInt* right) {
    std::string left_origin_value = this->getOriginValue();
    std::string right_origin_value = right->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the left BigInt '%s' in MOD operation. Correct it and return.\n", left_origin_value.c_str());
      return "";
    }
    if (!right->init()) {
      fs_error("*ERROR: Failed to initialize the right BigInt '%s' in MOD operation. Correct it and return.\n", right_origin_value.c_str());
      return "";
    }
    bool left_signed = this->getSigned();
    bool right_signed = right->getSigned();
    if (left_signed != right_signed) {
      fs_error("*ERROR: The '%s' left BigInt '%s' is incompatible with '%s' right BigInt '%s' in MOD operation. Correct them and return.\n", left_signed ? "signed" : "unsigned", left_origin_value.c_str(), right_signed ? "signed" : "unsigned", right_origin_value.c_str());
      return "";
    }
    Big* left_big = this->getBig();
    Big* right_big = right->getBig();
    if (left_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of left BigInt '%s'. Correct it and rerun.\n", left_origin_value.c_str());
      return "";
    }
    if (right_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of right BigInt '%s'. Correct it and rerun.\n", right_origin_value.c_str());
      return "";
    }
    Big result = (*left_big) % (*right_big);
    int min_value_width = std::min(this->getMinBinaryWidth(), right->getMinBinaryWidth());
    int min_hexadecimal_width = (int)(min_value_width / 4) + 1;
    std::string hex_result = RADIX_HEX + this->getRadixValue(&result, 16, min_hexadecimal_width);
    return hex_result;
  }
  std::string BigInt::eq(BigInt* right) {
    std::string left_origin_value = this->getOriginValue();
    std::string right_origin_value = right->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the left BigInt '%s' in EQ operation. Correct it and return.\n", left_origin_value.c_str());
      return "";
    }
    if (!right->init()) {
      fs_error("*ERROR: Failed to initialize the right BigInt '%s' in EQ operation. Correct it and return.\n", right_origin_value.c_str());
      return "";
    }
    bool left_signed = this->getSigned();
    bool right_signed = right->getSigned();
    if (left_signed != right_signed) {
      fs_error("*ERROR: The '%s' left BigInt '%s' is incompatible with '%s' right BigInt '%s' in EQ operation. Correct them and return.\n", left_signed ? "signed" : "unsigned", left_origin_value.c_str(), right_signed ? "signed" : "unsigned", right_origin_value.c_str());
      //throw firrtlsyn::Exception("EQ operation sign compatible error.");
      //return false;
      return "";
    }
    Big* left_big = this->getBig();
    Big* right_big = right->getBig();
    if (left_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of left BigInt '%s' in EQ operation. Correct it and rerun.\n", left_origin_value.c_str());
      //throw firrtlsyn::Exception("EQ operation left big int error.");
      //return false;
      return "";
    }
    if (right_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of right BigInt '%s' in EQ operation. Correct it and rerun.\n", right_origin_value.c_str());
      //throw firrtlsyn::Exception("EQ operation right big int error.");
      //return false;
      return "";
    }
    if ((*left_big) == (*right_big)) {
      //return true;
      return RADIX_HEX + "1";
    } else {
      //return false;
      return RADIX_HEX + "0";
    }
  }
  bool BigInt::eq(int number) {
    std::string left_origin_value = this->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the left BigInt '%s' in EQ operation. Correct it and return.\n", left_origin_value.c_str());
      return "";
    }
    Big* left_big = this->getBig();
    if (left_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of left BigInt '%s' in EQ operation. Correct it and rerun.\n", left_origin_value.c_str());
      //throw firrtlsyn::Exception("EQ operation left big int error.");
      //return false;
      return "";
    }
    if ((*left_big) == Big(number)) {
      //return true;
      return true;
    } else {
      //return false;
      return false;
    }
  }
  std::string BigInt::neq(BigInt* right) {
    std::string left_origin_value = this->getOriginValue();
    std::string right_origin_value = right->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the left BigInt '%s' in NEQ operation. Correct it and return.\n", left_origin_value.c_str());
      return "";
    }
    if (!right->init()) {
      fs_error("*ERROR: Failed to initialize the right BigInt '%s' in NEQ operation. Correct it and return.\n", right_origin_value.c_str());
      return "";
    }
    bool left_signed = this->getSigned();
    bool right_signed = right->getSigned();
    if (left_signed != right_signed) {
      fs_error("*ERROR: The '%s' left BigInt '%s' is incompatible with '%s' right BigInt '%s' in NEQ operation. Correct them and return.\n", left_signed ? "signed" : "unsigned", left_origin_value.c_str(), right_signed ? "signed" : "unsigned", right_origin_value.c_str());
      //throw firrtlsyn::Exception("NEQ operation sign compatible error.");
      //return false;
      return "";
    }
    Big* left_big = this->getBig();
    Big* right_big = right->getBig();
    if (left_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of left BigInt '%s' in NEQ operation. Correct it and rerun.\n", left_origin_value.c_str());
      //throw firrtlsyn::Exception("NEQ operation left big int error.");
      //return false;
      return "";
    }
    if (right_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of right BigInt '%s' in NEQ operation. Correct it and rerun.\n", right_origin_value.c_str());
      //throw firrtlsyn::Exception("NEQ operation right big int error.");
      //return false;
      return "";
    }
    if ((*left_big) != (*right_big)) {
      //return true;
      return RADIX_HEX + "1";
    } else {
      //return false;
      return RADIX_HEX + "0";
    }
  }
  std::string BigInt::lt(BigInt* right) {
    std::string left_origin_value = this->getOriginValue();
    std::string right_origin_value = right->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the left BigInt '%s' in LT operation. Correct it and return.\n", left_origin_value.c_str());
      return "";
    }
    if (!right->init()) {
      fs_error("*ERROR: Failed to initialize the right BigInt '%s' in LT operation. Correct it and return.\n", right_origin_value.c_str());
      return "";
    }
    bool left_signed = this->getSigned();
    bool right_signed = right->getSigned();
    if (left_signed != right_signed) {
      fs_error("*ERROR: The '%s' left BigInt '%s' is incompatible with '%s' right BigInt '%s' in LT operation. Correct them and return.\n", left_signed ? "signed" : "unsigned", left_origin_value.c_str(), right_signed ? "signed" : "unsigned", right_origin_value.c_str());
      //throw firrtlsyn::Exception("LT operation sign compatible error.");
      //return false;
      return "";
    }
    Big* left_big = this->getBig();
    Big* right_big = right->getBig();
    if (left_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of left BigInt '%s' in LT operation. Correct it and rerun.\n", left_origin_value.c_str());
      //throw firrtlsyn::Exception("LT operation left big int error.");
      //return false;
      return "";
    }
    if (right_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of right BigInt '%s' in LT operation. Correct it and rerun.\n", right_origin_value.c_str());
      //throw firrtlsyn::Exception("LT operation right big int error.");
      //return false;
      return "";
    }
    if ((*left_big) < (*right_big)) {
      //return true;
      return RADIX_HEX + "1";
    } else {
      //return false;
      return RADIX_HEX + "0";
    }
  }
  std::string BigInt::leq(BigInt* right) {
    std::string left_origin_value = this->getOriginValue();
    std::string right_origin_value = right->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the left BigInt '%s' in LEQ operation. Correct it and return.\n", left_origin_value.c_str());
      return "";
    }
    if (!right->init()) {
      fs_error("*ERROR: Failed to initialize the right BigInt '%s' in LEQ operation. Correct it and return.\n", right_origin_value.c_str());
      return "";
    }
    bool left_signed = this->getSigned();
    bool right_signed = right->getSigned();
    if (left_signed != right_signed) {
      fs_error("*ERROR: The '%s' left BigInt '%s' is incompatible with '%s' right BigInt '%s' in LEQ operation. Correct them and return.\n", left_signed ? "signed" : "unsigned", left_origin_value.c_str(), right_signed ? "signed" : "unsigned", right_origin_value.c_str());
      //throw firrtlsyn::Exception("LEQ operation sign compatible error.");
      //return false;
      return "";
    }
    Big* left_big = this->getBig();
    Big* right_big = right->getBig();
    if (left_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of left BigInt '%s' in LEQ operation. Correct it and rerun.\n", left_origin_value.c_str());
      //throw firrtlsyn::Exception("LEQ operation left big int error.");
      //return false;
      return "";
    }
    if (right_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of right BigInt '%s' in LEQ operation. Correct it and rerun.\n", right_origin_value.c_str());
      //throw firrtlsyn::Exception("LEQ operation right big int error.");
      //return false;
      return "";
    }
    if ((*left_big) <= (*right_big)) {
      //return true;
      return RADIX_HEX + "1";
    } else {
      //return false;
      return RADIX_HEX + "0";
    }
  }
  std::string BigInt::gt(BigInt* right) {
    std::string left_origin_value = this->getOriginValue();
    std::string right_origin_value = right->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the left BigInt '%s' in GT operation. Correct it and return.\n", left_origin_value.c_str());
      return "";
    }
    if (!right->init()) {
      fs_error("*ERROR: Failed to initialize the right BigInt '%s' in GT operation. Correct it and return.\n", right_origin_value.c_str());
      return "";
    }
    bool left_signed = this->getSigned();
    bool right_signed = right->getSigned();
    if (left_signed != right_signed) {
      fs_error("*ERROR: The '%s' left BigInt '%s' is incompatible with '%s' right BigInt '%s' in GT operation. Correct them and return.\n", left_signed ? "signed" : "unsigned", left_origin_value.c_str(), right_signed ? "signed" : "unsigned", right_origin_value.c_str());
      //throw firrtlsyn::Exception("GT operation sign compatible error.");
      //return false;
      return "";
    }
    Big* left_big = this->getBig();
    Big* right_big = right->getBig();
    if (left_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of left BigInt '%s' in GT operation. Correct it and rerun.\n", left_origin_value.c_str());
      //throw firrtlsyn::Exception("GT operation left big int error.");
      //return false;
      return "";
    }
    if (right_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of right BigInt '%s' in GT operation. Correct it and rerun.\n", right_origin_value.c_str());
      //throw firrtlsyn::Exception("GT operation right big int error.");
      //return false;
      return "";
    }
    if ((*left_big) > (*right_big)) {
      //return true;
      return RADIX_HEX + "1";
    } else {
      //return false;
      return RADIX_HEX + "0";
    }
  }
  std::string BigInt::geq(BigInt* right) {
    std::string left_origin_value = this->getOriginValue();
    std::string right_origin_value = right->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the left BigInt '%s' in GEQ operation. Correct it and return.\n", left_origin_value.c_str());
      return "";
    }
    if (!right->init()) {
      fs_error("*ERROR: Failed to initialize the right BigInt '%s' in GEQ operation. Correct it and return.\n", right_origin_value.c_str());
      return "";
    }
    bool left_signed = this->getSigned();
    bool right_signed = right->getSigned();
    if (left_signed != right_signed) {
      fs_error("*ERROR: The '%s' left BigInt '%s' is incompatible with '%s' right BigInt '%s' in GEQ operation. Correct them and return.\n", left_signed ? "signed" : "unsigned", left_origin_value.c_str(), right_signed ? "signed" : "unsigned", right_origin_value.c_str());
      //throw firrtlsyn::Exception("GEQ operation sign compatible error.");
      //return false;
      return "";
    }
    Big* left_big = this->getBig();
    Big* right_big = right->getBig();
    if (left_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of left BigInt '%s' in GEQ operation. Correct it and rerun.\n", left_origin_value.c_str());
      //throw firrtlsyn::Exception("GEQ operation left big int error.");
      //return false;
      return "";
    }
    if (right_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of right BigInt '%s' in GEQ operation. Correct it and rerun.\n", right_origin_value.c_str());
      //throw firrtlsyn::Exception("GEQ operation right big int error.");
      //return false;
      return "";
    }
    if ((*left_big) >= (*right_big)) {
      //return true;
      return RADIX_HEX + "1";
    } else {
      //return false;
      return RADIX_HEX + "0";
    }
  }
  std::string BigInt::pad(unsigned int pad_n) {
    // same with getting hexadecimal value
    std::string origin_value = this->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the BigInt '%s' in PAD operation. Correct it and return.\n", origin_value.c_str());
      return "";
    }
    Big* big_value = this->getBig();
    if (big_value == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of BigInt '%s' in PAD operation. Correct it and rerun.\n", origin_value.c_str());
      return "";
    }
    int min_value_width = this->getMinBinaryWidth();
    if ((int)pad_n > min_value_width) {
      // this is no use for miracl big final result
      min_value_width = pad_n;
    }
    int min_hexadecimal_width = (int)(min_value_width / 4) + 1;
    std::string hex_result = RADIX_HEX + this->getRadixValue(big_value, 16, min_hexadecimal_width);
    return hex_result;
  }
  std::string BigInt::asuint(unsigned int firexp_width) {
    std::string origin_value = this->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the BigInt '%s' in ASUINT operation. Correct it and return.\n", origin_value.c_str());
      return "";
    }
    Big* big_value = this->getBig();
    if (big_value == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of BigInt '%s' in ASUINT operation. Correct it and rerun.\n", origin_value.c_str());
      return "";
    }
    int min_value_width = this->getMinBinaryWidth();
    std::string binary_value = this->getRadixValue(big_value, 2, min_value_width);
    if (binary_value == "+" || binary_value == "-" || binary_value == "") {
      fs_error("*ERROR*: Empty binary value '%s' for ASUINT operation.\n", binary_value.c_str());
      return "";
    }
    if (binary_value == "-0") {
      fs_warning("*WARNING*: Bad number '-0' for ASUINT operation.\n");
      // this should return "0" I think, in C++, "10" means "-2" as a 2-bit number, like "10000" means "-16",
      // but firrtl will generate "10".
      return "10";
    }
    //std::string binary_result = binary_value;
    if (binary_value[0] == '-') {
      fs_assert(binary_value.size() >= 2);
      binary_value[0] = '0';
      binary_value = this->getBinaryComplement(binary_value);
      fs_assert(binary_value[0] == '1');
      if (firexp_width >= binary_value.size()) {
        binary_value.insert(0, firexp_width - binary_value.size(), '1');
      }
    } else if (binary_value[0] == '+') {
      fs_assert(binary_value.size() >= 2);
      //binary_value = binary_value.substr(1);
      binary_value.erase(0); // erase one char at position 0
    }
    if (firexp_width < binary_value.size()) {
      fs_warning("*WARNING*: The width '%d' of firrtl expression is not enough to cover the width of binary integer '%s'.\n", firexp_width, binary_value.c_str());
    }
    binary_value = "b" + binary_value;
    BigInt binary_bigint(binary_value, false);
    std::string hex_result = binary_bigint.getHexadecimalValue();
    return hex_result;
  }
  std::string BigInt::assint(unsigned int firexp_width) {
    std::string origin_value = this->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the BigInt '%s' in ASUINT operation. Correct it and return.\n", origin_value.c_str());
      return "";
    }
    Big* big_value = this->getBig();
    if (big_value == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of BigInt '%s' in ASUINT operation. Correct it and rerun.\n", origin_value.c_str());
      return "";
    }
    int min_value_width = this->getMinBinaryWidth();
    std::string binary_value = this->getRadixValue(big_value, 2, min_value_width);
    if (binary_value == "+" || binary_value == "-" || binary_value == "") {
      fs_error("*ERROR*: Empty binary value '%s' for ASUINT operation.\n", binary_value.c_str());
      return "";
    }
    if (binary_value == "-0") {
      fs_warning("*WARNING*: Bad number '-0' for ASUINT operation.\n");
      return "-0";
    }
    //std::string binary_result = binary_value;
    if (binary_value[0] == '-') {
      // original value must be sint
      fs_assert(binary_value.size() >= 2);
      binary_value[0] = '0';
      binary_value = this->getBinaryComplement(binary_value);
      fs_assert(binary_value[0] == '1');
      if (firexp_width >= binary_value.size()) {
        binary_value.insert(0, firexp_width - binary_value.size(), '1');
      }
      binary_value = "-" + this->getBinaryComplement(binary_value);
    } else {
      if (binary_value[0] == '+') {
        fs_assert(binary_value.size() >= 2);
        //binary_value = binary_value.substr(1);
        binary_value.erase(0);
      }
      if (firexp_width > binary_value.size()) {
        binary_value.insert(0, firexp_width - binary_value.size(), '0');
      }
      if (binary_value[0] == '1') {
        binary_value = "-" + this->getBinaryComplement(binary_value);
      }
    }
    if (binary_value[0] == '-') {
      if (firexp_width < binary_value.size() - 1) {
        fs_warning("*WARNING*: The width '%d' of firrtl expression is not enough to cover the width of binary integer '%s'.\n", firexp_width, binary_value.c_str());
      }
    } else {
      if (firexp_width < binary_value.size()) {
        fs_warning("*WARNING*: The width '%d' of firrtl expression is not enough to cover the width of binary integer '%s'.\n", firexp_width, binary_value.c_str());
      }
    }

    binary_value = "b" + binary_value;
    BigInt binary_bigint(binary_value, true);
    std::string hex_result = binary_bigint.getHexadecimalValue();
    //if (binary_value[0] == '-') {
    //  hex_result = hex_result.insert(0, 1, '-');
    //}
    return hex_result;
  }
  std::string BigInt::shl(unsigned int shl_n, unsigned int firexp_width) {
    std::string origin_value = this->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the BigInt '%s' in SHL operation. Correct it and return.\n", origin_value.c_str());
      return "";
    }
    Big* big_value = this->getBig();
    if (big_value == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of BigInt '%s' in SHL operation. Correct it and rerun.\n", origin_value.c_str());
      return "";
    }
    //Big shl_result = (*big_value) << shl_n;
    int min_value_width = this->getMinBinaryWidth();
    std::string binary_value = this->getRadixValue(big_value, 2, min_value_width);
    if (binary_value == "+" || binary_value == "-" || binary_value == "") {
      fs_error("*ERROR*: Empty binary value '%s' for SHL operation.\n", binary_value.c_str());
      return "";
    }
    if (binary_value == "-0") {
      fs_warning("*WARNING*: Bad number '-0' for SHL operation.\n");
      return "-0";
    }
    //std::string binary_result = binary_value;
    if (binary_value[0] == '-') {
      binary_value[0] = '0';
      binary_value = this->getBinaryComplement(binary_value);
      binary_value.insert(binary_value.end(), shl_n, '0');
      if (firexp_width > binary_value.size()) {
        binary_value.insert(0, firexp_width - binary_value.size(), '1');
      } else {
        binary_value.erase(0, binary_value.size() - firexp_width);
      }
      binary_value = "-" + this->getBinaryComplement(binary_value);
    } else {
      binary_value.insert(binary_value.end(), shl_n, '0');
    }
    binary_value = "b" + binary_value;
    BigInt binary_big(binary_value, this->getSigned());
    std::string hex_result = binary_big.getHexadecimalValue();
    return hex_result;
  }
  std::string BigInt::shr(unsigned int shr_n, unsigned int firexp_width) {
    std::string origin_value = this->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the BigInt '%s' in SHR operation. Correct it and return.\n", origin_value.c_str());
      return "";
    }
    Big* big_value = this->getBig();
    if (big_value == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of BigInt '%s' in SHR operation. Correct it and rerun.\n", origin_value.c_str());
      return "";
    }
    //Big shl_result = (*big_value) << shl_n;
    int min_value_width = this->getMinBinaryWidth();
    std::string binary_value = this->getRadixValue(big_value, 2, min_value_width);
    if (binary_value == "+" || binary_value == "-" || binary_value == "") {
      fs_error("*ERROR*: Empty binary value '%s' for SHR operation.\n", binary_value.c_str());
      return "";
    }
    if (binary_value == "-0") {
      fs_warning("*WARNING*: Bad number '-0' for SHR operation.\n");
      return "-0";
    }
    //std::string binary_result = binary_value;
    if (binary_value[0] == '-') {
      binary_value[0] = '0';
      binary_value = this->getBinaryComplement(binary_value);
      //according spec document, should be padding first, then erase
      binary_value.insert(0, shr_n, '1');
      binary_value.erase(binary_value.size() - shr_n, shr_n);
      if (firexp_width > binary_value.size()) {
        binary_value.insert(0, firexp_width - binary_value.size(), '1');
      } else {
        binary_value.erase(0, binary_value.size() - firexp_width);
      }
      binary_value = "-" + this->getBinaryComplement(binary_value);
    } else {
      //according spec document, should be padding first, then erase
      binary_value.insert(0, shr_n, '0');
      binary_value.erase(binary_value.size() - shr_n, shr_n);
      if (firexp_width > binary_value.size()) {
        binary_value.insert(0, firexp_width - binary_value.size(), '0');
      } else {
        binary_value.erase(0, binary_value.size() - firexp_width);
      }
    }
    if (binary_value == "-" || binary_value == "+" || binary_value == "" || binary_value == " ") {
      binary_value += "0";
    }
    if (binary_value == "-0") {
      fs_warning("*WARNING*: Bad number '-0' for SHR operation.\n");
      return "-0";
    }
    binary_value = "b" + binary_value;
    BigInt binary_big(binary_value, this->getSigned());
    std::string hex_result = binary_big.getHexadecimalValue();
    return hex_result;
  }
  std::string BigInt::dshl(BigInt* right, unsigned int firexp_width) {
    std::string left_origin_value = this->getOriginValue();
    std::string right_origin_value = right->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the left BigInt '%s' in DSHL operation. Correct it and return.\n", left_origin_value.c_str());
      return "";
    }
    if (!right->init()) {
      fs_error("*ERROR: Failed to initialize the right BigInt '%s' in DSHL operation. Correct it and return.\n", right_origin_value.c_str());
      return "";
    }
    if (!right->isUInt()) {
      fs_error("*ERROR*: The right BigInt value '%s' of DSHL operation must be UInt but it is SInt.\n", right_origin_value.c_str());
      return "";
    }
    Big* left_big = this->getBig();
    Big* right_big = right->getBig();
    if (left_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of left BigInt '%s'. Correct it and rerun.\n", left_origin_value.c_str());
      return "";
    }
    if (right_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of right BigInt '%s'. Correct it and rerun.\n", right_origin_value.c_str());
      return "";
    }
    int right_min_width = right->getMinBinaryWidth();
    int left_min_width = this->getMinBinaryWidth();
    Big right_max_value = pow(Big(2), right_min_width);
    std::string right_value = this->getRadixValue(right_big, 10, 32);
    if (right_max_value > Big(UINT_MAX) - Big(left_min_width + 1)) {
      fs_error("*ERROR*: The shift number '%s' is too large to support.\n", right_value.c_str());
      return "";
    }
    int shift_left_n = std::stoi(right_value);
    fs_assert(shift_left_n == right->getUIntValue());
    return this->shl(shift_left_n, firexp_width);
  }
  std::string BigInt::dshr(BigInt* right, unsigned int firexp_width) {
    std::string left_origin_value = this->getOriginValue();
    std::string right_origin_value = right->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the left BigInt '%s' in DSHR operation. Correct it and return.\n", left_origin_value.c_str());
      return "";
    }
    if (!right->init()) {
      fs_error("*ERROR: Failed to initialize the right BigInt '%s' in DSHR operation. Correct it and return.\n", right_origin_value.c_str());
      return "";
    }
    if (!right->isUInt()) {
      fs_error("*ERROR*: The right BigInt value '%s' of DSHR operation must be UInt but it is SInt.\n", right_origin_value.c_str());
      return "";
    }
    Big* left_big = this->getBig();
    Big* right_big = right->getBig();
    if (left_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of left BigInt '%s'. Correct it and rerun.\n", left_origin_value.c_str());
      return "";
    }
    if (right_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of right BigInt '%s'. Correct it and rerun.\n", right_origin_value.c_str());
      return "";
    }
    int shift_right_n = right->getUIntValue();
    return this->shr(shift_right_n, firexp_width);
  }
  std::string BigInt::cvt() {
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the BigInt '%s' in CVT operation. Correct it and return.\n", this->getOriginValue().c_str());
      return "";
    }
    return this->getHexadecimalValue();
  }
  std::string BigInt::neg() {
    std::string origin_value = this->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the left BigInt '%s' in NEG operation. Correct it and return.\n", origin_value.c_str());
      return "";
    }
    Big* this_big = this->getBig();
    if (this_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of left BigInt '%s'. Correct it and rerun.\n", origin_value.c_str());
      return "";
    }
    Big result(*this_big);
    result.negate();
    int min_value_width = this->getMinBinaryWidth() + 1;
    int min_hexadecimal_width = (int)(min_value_width / 4) + 1;
    std::string hex_result = RADIX_HEX + this->getRadixValue(&result, 16, min_hexadecimal_width);
    return hex_result;
  }
  std::string BigInt::not_op(unsigned int firexp_width) {
    std::string origin_value = this->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the left BigInt '%s' in NOT operation. Correct it and return.\n", origin_value.c_str());
      return "";
    }
    Big* this_big = this->getBig();
    if (this_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of left BigInt '%s'. Correct it and rerun.\n", origin_value.c_str());
      return "";
    }
    int min_value_width = this->getMinBinaryWidth();
    std::string binary_value = this->getRadixValue(this_big, 2, min_value_width);
    if (binary_value == "+" || binary_value == "-" || binary_value == "") {
      fs_error("*ERROR*: Empty binary value '%s' for NOT operation.\n", binary_value.c_str());
      return "";
    }
    if (binary_value == "-0") {
      fs_warning("*WARNING*: Bad number '-0' for NOT operation.\n");
      return "0";
    }
    if (binary_value[0] == '-') {
      fs_assert(binary_value.size() >= 2);
      binary_value[0] = '0';
      binary_value = this->getBinaryComplement(binary_value);
      fs_assert(binary_value[0] == '1');
    } else if (binary_value[0] == '+') {
      fs_assert(binary_value.size() >= 2);
      binary_value.erase(0); // erase one char at position 0
    }
    if (firexp_width > binary_value.size()) {
      binary_value.insert(0, firexp_width - binary_value.size(), '0');
    }
    for (size_t i = 0; i < binary_value.size(); i++) {
      if (binary_value[i] == '0') {
        binary_value[i] = '1';
      } else {
        binary_value[i] = '0';
      }
    }
    binary_value = "b" + binary_value;
    BigInt not_big(binary_value, false);
    std::string hex_result = not_big.getHexadecimalValue();
    return hex_result;
  }
  std::string BigInt::and_op(BigInt* right) {
    std::string left_origin_value = this->getOriginValue();
    std::string right_origin_value = right->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the left BigInt '%s' in AND operation. Correct it and return.\n", left_origin_value.c_str());
      return "";
    }
    if (!right->init()) {
      fs_error("*ERROR: Failed to initialize the right BigInt '%s' in AND operation. Correct it and return.\n", right_origin_value.c_str());
      return "";
    }
    bool left_signed = this->getSigned();
    bool right_signed = right->getSigned();
    if (left_signed != right_signed) {
      fs_error("*ERROR: The '%s' left BigInt '%s' is incompatible with '%s' right BigInt '%s' in AND operation. Correct them and return.\n", left_signed ? "signed" : "unsigned", left_origin_value.c_str(), right_signed ? "signed" : "unsigned", right_origin_value.c_str());
      return "";
    }
    Big* left_big = this->getBig();
    Big* right_big = right->getBig();
    if (left_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of left BigInt '%s'. Correct it and rerun.\n", left_origin_value.c_str());
      return "";
    }
    if (right_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of right BigInt '%s'. Correct it and rerun.\n", right_origin_value.c_str());
      return "";
    }

    int left_min_width = this->getMinBinaryWidth();
    int right_min_width = right->getMinBinaryWidth();
    int width = std::max(left_min_width, right_min_width);
    std::string left_binary_value = this->getRadixValue(left_big, 2, left_min_width);
    if (left_binary_value == "+" || left_binary_value == "-" || left_binary_value == "") {
      fs_error("*ERROR*: Empty left binary value '%s' for AND operation.\n", left_binary_value.c_str());
      return "";
    }
    if (left_binary_value == "-0") {
      fs_warning("*WARNING*: Bad left number '-0' for AND operation.\n");
      return "0";
    }
    if (left_binary_value[0] == '-') {
      fs_assert(left_binary_value.size() >= 2);
      left_binary_value[0] = '0';
      left_binary_value = this->getBinaryComplement(left_binary_value);
      fs_assert(left_binary_value[0] == '1');
      if (left_binary_value.size() < width) {
        left_binary_value.insert(0, width - left_binary_value.size(), '1');
      }
    } else if (left_binary_value[0] == '+') {
      fs_assert(left_binary_value.size() >= 2);
      left_binary_value.erase(0); // erase one char at position 0
      if (left_binary_value.size() < width) {
        left_binary_value.insert(0, width - left_binary_value.size(), '0');
      }
    } else {
      fs_assert(left_binary_value.size() >= 1);
      if (left_binary_value.size() < width) {
        left_binary_value.insert(0, width - left_binary_value.size(), '0');
      }
    }

    std::string right_binary_value = this->getRadixValue(right_big, 2, right_min_width);
    if (right_binary_value == "+" || right_binary_value == "-" || right_binary_value == "") {
      fs_error("*ERROR*: Empty right binary value '%s' for AND operation.\n", right_binary_value.c_str());
      return "";
    }
    if (right_binary_value == "-0") {
      fs_warning("*WARNING*: Bad right number '-0' for AND operation.\n");
      return "0";
    }
    if (right_binary_value[0] == '-') {
      fs_assert(right_binary_value.size() >= 2);
      right_binary_value[0] = '0';
      right_binary_value = this->getBinaryComplement(right_binary_value);
      fs_assert(right_binary_value[0] == '1');
      if (right_binary_value.size() < width) {
        right_binary_value.insert(0, width - right_binary_value.size(), '1');
      }
    } else if (right_binary_value[0] == '+') {
      fs_assert(right_binary_value.size() >= 2);
      right_binary_value.erase(0); // erase one char at position 0
      if (right_binary_value.size() < width) {
        right_binary_value.insert(0, width - right_binary_value.size(), '0');
      }
    } else {
      fs_assert(right_binary_value.size() >= 1);
      if (right_binary_value.size() < width) {
        right_binary_value.insert(0, width - right_binary_value.size(), '0');
      }
    }

    std::string and_binary_result = "";
    for (size_t i = 0; i < width; i++) {
      if (left_binary_value[i] == '0' || right_binary_value[i] == '0') {
        and_binary_result += "0";
      } else {
        and_binary_result += "1";
      }
    }
    fs_assert(and_binary_result.size() == width);
    and_binary_result = "b" + and_binary_result;
    BigInt and_bigint_result(and_binary_result, false);
    std::string and_hex_result = and_bigint_result.getHexadecimalValue();
    return and_hex_result;
  }
  std::string BigInt::or_op(BigInt* right) {
    std::string left_origin_value = this->getOriginValue();
    std::string right_origin_value = right->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the left BigInt '%s' in OR operation. Correct it and return.\n", left_origin_value.c_str());
      return "";
    }
    if (!right->init()) {
      fs_error("*ERROR: Failed to initialize the right BigInt '%s' in OR operation. Correct it and return.\n", right_origin_value.c_str());
      return "";
    }
    bool left_signed = this->getSigned();
    bool right_signed = right->getSigned();
    if (left_signed != right_signed) {
      fs_error("*ERROR: The '%s' left BigInt '%s' is incompatible with '%s' right BigInt '%s' in OR operation. Correct them and return.\n", left_signed ? "signed" : "unsigned", left_origin_value.c_str(), right_signed ? "signed" : "unsigned", right_origin_value.c_str());
      return "";
    }
    Big* left_big = this->getBig();
    Big* right_big = right->getBig();
    if (left_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of left BigInt '%s'. Correct it and rerun.\n", left_origin_value.c_str());
      return "";
    }
    if (right_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of right BigInt '%s'. Correct it and rerun.\n", right_origin_value.c_str());
      return "";
    }

    int left_min_width = this->getMinBinaryWidth();
    int right_min_width = right->getMinBinaryWidth();
    int width = std::max(left_min_width, right_min_width);
    std::string left_binary_value = this->getRadixValue(left_big, 2, left_min_width);
    if (left_binary_value == "+" || left_binary_value == "-" || left_binary_value == "") {
      fs_error("*ERROR*: Empty left binary value '%s' for OR operation.\n", left_binary_value.c_str());
      return "";
    }
    if (left_binary_value == "-0") {
      fs_warning("*WARNING*: Bad left number '-0' for OR operation.\n");
      return "0";
    }
    if (left_binary_value[0] == '-') {
      fs_assert(left_binary_value.size() >= 2);
      left_binary_value[0] = '0';
      left_binary_value = this->getBinaryComplement(left_binary_value);
      fs_assert(left_binary_value[0] == '1');
      if (left_binary_value.size() < width) {
        left_binary_value.insert(0, width - left_binary_value.size(), '1');
      }
    } else if (left_binary_value[0] == '+') {
      fs_assert(left_binary_value.size() >= 2);
      left_binary_value.erase(0); // erase one char at position 0
      if (left_binary_value.size() < width) {
        left_binary_value.insert(0, width - left_binary_value.size(), '0');
      }
    } else {
      fs_assert(left_binary_value.size() >= 1);
      if (left_binary_value.size() < width) {
        left_binary_value.insert(0, width - left_binary_value.size(), '0');
      }
    }

    std::string right_binary_value = this->getRadixValue(right_big, 2, right_min_width);
    if (right_binary_value == "+" || right_binary_value == "-" || right_binary_value == "") {
      fs_error("*ERROR*: Empty right binary value '%s' for OR operation.\n", right_binary_value.c_str());
      return "";
    }
    if (right_binary_value == "-0") {
      fs_warning("*WARNING*: Bad right number '-0' for OR operation.\n");
      return "0";
    }
    if (right_binary_value[0] == '-') {
      fs_assert(right_binary_value.size() >= 2);
      right_binary_value[0] = '0';
      right_binary_value = this->getBinaryComplement(right_binary_value);
      fs_assert(right_binary_value[0] == '1');
      if (right_binary_value.size() < width) {
        right_binary_value.insert(0, width - right_binary_value.size(), '1');
      }
    } else if (right_binary_value[0] == '+') {
      fs_assert(right_binary_value.size() >= 2);
      right_binary_value.erase(0); // erase one char at position 0
      if (right_binary_value.size() < width) {
        right_binary_value.insert(0, width - right_binary_value.size(), '0');
      }
    } else {
      fs_assert(right_binary_value.size() >= 1);
      if (right_binary_value.size() < width) {
        right_binary_value.insert(0, width - right_binary_value.size(), '0');
      }
    }

    std::string or_binary_result = "";
    for (size_t i = 0; i < width; i++) {
      if (left_binary_value[i] == '1' || right_binary_value[i] == '1') {
        or_binary_result += "1";
      } else {
        or_binary_result += "0";
      }
    }
    fs_assert(or_binary_result.size() == width);
    or_binary_result = "b" + or_binary_result;
    BigInt or_bigint_result(or_binary_result, false);
    std::string or_hex_result = or_bigint_result.getHexadecimalValue();
    return or_hex_result;
  }
  std::string BigInt::xor_op(BigInt* right) {
    std::string left_origin_value = this->getOriginValue();
    std::string right_origin_value = right->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the left BigInt '%s' in XOR operation. Correct it and return.\n", left_origin_value.c_str());
      return "";
    }
    if (!right->init()) {
      fs_error("*ERROR: Failed to initialize the right BigInt '%s' in XOR operation. Correct it and return.\n", right_origin_value.c_str());
      return "";
    }
    bool left_signed = this->getSigned();
    bool right_signed = right->getSigned();
    if (left_signed != right_signed) {
      fs_error("*ERROR: The '%s' left BigInt '%s' is incompatible with '%s' right BigInt '%s' in XOR operation. Correct them and return.\n", left_signed ? "signed" : "unsigned", left_origin_value.c_str(), right_signed ? "signed" : "unsigned", right_origin_value.c_str());
      return "";
    }
    Big* left_big = this->getBig();
    Big* right_big = right->getBig();
    if (left_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of left BigInt '%s'. Correct it and rerun.\n", left_origin_value.c_str());
      return "";
    }
    if (right_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of right BigInt '%s'. Correct it and rerun.\n", right_origin_value.c_str());
      return "";
    }

    int left_min_width = this->getMinBinaryWidth();
    int right_min_width = right->getMinBinaryWidth();
    int width = std::max(left_min_width, right_min_width);
    std::string left_binary_value = this->getRadixValue(left_big, 2, left_min_width);
    if (left_binary_value == "+" || left_binary_value == "-" || left_binary_value == "") {
      fs_error("*ERROR*: Empty left binary value '%s' for XOR operation.\n", left_binary_value.c_str());
      return "";
    }
    if (left_binary_value == "-0") {
      fs_warning("*WARNING*: Bad left number '-0' for XOR operation.\n");
      return "0";
    }
    if (left_binary_value[0] == '-') {
      fs_assert(left_binary_value.size() >= 2);
      left_binary_value[0] = '0';
      left_binary_value = this->getBinaryComplement(left_binary_value);
      fs_assert(left_binary_value[0] == '1');
      if (left_binary_value.size() < width) {
        left_binary_value.insert(0, width - left_binary_value.size(), '1');
      }
    } else if (left_binary_value[0] == '+') {
      fs_assert(left_binary_value.size() >= 2);
      left_binary_value.erase(0); // erase one char at position 0
      if (left_binary_value.size() < width) {
        left_binary_value.insert(0, width - left_binary_value.size(), '0');
      }
    } else {
      fs_assert(left_binary_value.size() >= 1);
      if (left_binary_value.size() < width) {
        left_binary_value.insert(0, width - left_binary_value.size(), '0');
      }
    }

    std::string right_binary_value = this->getRadixValue(right_big, 2, right_min_width);
    if (right_binary_value == "+" || right_binary_value == "-" || right_binary_value == "") {
      fs_error("*ERROR*: Empty right binary value '%s' for XOR operation.\n", right_binary_value.c_str());
      return "";
    }
    if (right_binary_value == "-0") {
      fs_warning("*WARNING*: Bad right number '-0' for XOR operation.\n");
      return "0";
    }
    if (right_binary_value[0] == '-') {
      fs_assert(right_binary_value.size() >= 2);
      right_binary_value[0] = '0';
      right_binary_value = this->getBinaryComplement(right_binary_value);
      fs_assert(right_binary_value[0] == '1');
      if (right_binary_value.size() < width) {
        right_binary_value.insert(0, width - right_binary_value.size(), '1');
      }
    } else if (right_binary_value[0] == '+') {
      fs_assert(right_binary_value.size() >= 2);
      right_binary_value.erase(0); // erase one char at position 0
      if (right_binary_value.size() < width) {
        right_binary_value.insert(0, width - right_binary_value.size(), '0');
      }
    } else {
      fs_assert(right_binary_value.size() >= 1);
      if (right_binary_value.size() < width) {
        right_binary_value.insert(0, width - right_binary_value.size(), '0');
      }
    }

    std::string xor_binary_result = "";
    for (size_t i = 0; i < width; i++) {
      if (left_binary_value[i] == '1' && right_binary_value[i] == '1') {
        xor_binary_result += "0";
      } else if (left_binary_value[i] == '0' && right_binary_value[i] == '0'){
        xor_binary_result += "0";
      } else {
        xor_binary_result += '1';
      }
    }
    fs_assert(xor_binary_result.size() == width);
    xor_binary_result = "b" + xor_binary_result;
    BigInt xor_bigint_result(xor_binary_result, false);
    std::string xor_hex_result = xor_bigint_result.getHexadecimalValue();
    return xor_hex_result;
  }
  std::string BigInt::andr(unsigned int firexp_width) {
    std::string left_origin_value = this->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the left BigInt '%s' in ANDR operation. Correct it and return.\n", left_origin_value.c_str());
      return "";
    }
    Big* left_big = this->getBig();
    if (left_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of left BigInt '%s'. Correct it and rerun.\n", left_origin_value.c_str());
      return "";
    }
    int left_min_width = this->getMinBinaryWidth();
    std::string left_binary_value = this->getRadixValue(left_big, 2, left_min_width);
    if (left_binary_value == "+" || left_binary_value == "-" || left_binary_value == "") {
      fs_error("*ERROR*: Empty left binary value '%s' for ANDR operation.\n", left_binary_value.c_str());
      return RADIX_HEX + "1";
    }
    if (left_binary_value == "-0") {
      fs_warning("*WARNING*: Bad left number '-0' for ANDR operation.\n");
      return RADIX_HEX + "0";;
    }
    if (left_binary_value[0] == '-') {
      fs_assert(left_binary_value.size() >= 2);
      left_binary_value[0] = '0';
      left_binary_value = this->getBinaryComplement(left_binary_value);
      fs_assert(left_binary_value[0] == '1');
      if (left_binary_value.size() < firexp_width) {
        left_binary_value.insert(0, firexp_width - left_binary_value.size(), '1');
      }
    } else if (left_binary_value[0] == '+') {
      fs_assert(left_binary_value.size() >= 2);
      left_binary_value.erase(0); // erase one char at position 0
      if (left_binary_value.size() < firexp_width) {
        left_binary_value.insert(0, firexp_width - left_binary_value.size(), '0');
      }
    } else {
      fs_assert(left_binary_value.size() >= 1);
      if (left_binary_value.size() < firexp_width) {
        left_binary_value.insert(0, firexp_width - left_binary_value.size(), '0');
      }
    }
    std::string andr_binary_result = "1";
    for (size_t i = 0; i < firexp_width; i++) {
      if (left_binary_value[i] == '0') {
        andr_binary_result = "0";
        break;
      }
    }
    std::string andr_hex_result = RADIX_HEX + andr_binary_result;
    return andr_hex_result;
  }
  std::string BigInt::orr(unsigned int firexp_width) {
    std::string left_origin_value = this->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the left BigInt '%s' in ORR operation. Correct it and return.\n", left_origin_value.c_str());
      return "";
    }
    Big* left_big = this->getBig();
    if (left_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of left BigInt '%s'. Correct it and rerun.\n", left_origin_value.c_str());
      return "";
    }
    int left_min_width = this->getMinBinaryWidth();
    std::string left_binary_value = this->getRadixValue(left_big, 2, left_min_width);
    if (left_binary_value == "+" || left_binary_value == "-" || left_binary_value == "") {
      fs_error("*ERROR*: Empty left binary value '%s' for ORR operation.\n", left_binary_value.c_str());
      return RADIX_HEX + "0";
    }
    if (left_binary_value == "-0") {
      fs_warning("*WARNING*: Bad left number '-0' for ORR operation.\n");
      return RADIX_HEX + "0";;
    }
    if (left_binary_value[0] == '-') {
      fs_assert(left_binary_value.size() >= 2);
      left_binary_value[0] = '0';
      left_binary_value = this->getBinaryComplement(left_binary_value);
      fs_assert(left_binary_value[0] == '1');
      if (left_binary_value.size() < firexp_width) {
        left_binary_value.insert(0, firexp_width - left_binary_value.size(), '1');
      }
    } else if (left_binary_value[0] == '+') {
      fs_assert(left_binary_value.size() >= 2);
      left_binary_value.erase(0); // erase one char at position 0
      if (left_binary_value.size() < firexp_width) {
        left_binary_value.insert(0, firexp_width - left_binary_value.size(), '0');
      }
    } else {
      fs_assert(left_binary_value.size() >= 1);
      if (left_binary_value.size() < firexp_width) {
        left_binary_value.insert(0, firexp_width - left_binary_value.size(), '0');
      }
    }
    std::string orr_binary_result = "0";
    for (size_t i = 0; i < firexp_width; i++) {
      if (left_binary_value[i] == '1') {
        orr_binary_result = "1";
        break;
      }
    }
    std::string orr_hex_result = RADIX_HEX + orr_binary_result;
    return orr_hex_result;
  }
  std::string BigInt::xorr(unsigned int firexp_width) {
    std::string left_origin_value = this->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the left BigInt '%s' in XORR operation. Correct it and return.\n", left_origin_value.c_str());
      return "";
    }
    Big* left_big = this->getBig();
    if (left_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of left BigInt '%s'. Correct it and rerun.\n", left_origin_value.c_str());
      return "";
    }
    int left_min_width = this->getMinBinaryWidth();
    std::string left_binary_value = this->getRadixValue(left_big, 2, left_min_width);
    if (left_binary_value == "+" || left_binary_value == "-" || left_binary_value == "") {
      fs_error("*ERROR*: Empty left binary value '%s' for XORR operation.\n", left_binary_value.c_str());
      return RADIX_HEX + "0";
    }
    if (left_binary_value == "-0") {
      fs_warning("*WARNING*: Bad left number '-0' for XORR operation.\n");
      return RADIX_HEX + "0";;
    }
    if (left_binary_value[0] == '-') {
      fs_assert(left_binary_value.size() >= 2);
      left_binary_value[0] = '0';
      left_binary_value = this->getBinaryComplement(left_binary_value);
      fs_assert(left_binary_value[0] == '1');
      if (left_binary_value.size() < firexp_width) {
        left_binary_value.insert(0, firexp_width - left_binary_value.size(), '1');
      }
    } else if (left_binary_value[0] == '+') {
      fs_assert(left_binary_value.size() >= 2);
      left_binary_value.erase(0); // erase one char at position 0
      if (left_binary_value.size() < firexp_width) {
        left_binary_value.insert(0, firexp_width - left_binary_value.size(), '0');
      }
    } else {
      fs_assert(left_binary_value.size() >= 1);
      if (left_binary_value.size() < firexp_width) {
        left_binary_value.insert(0, firexp_width - left_binary_value.size(), '0');
      }
    }
    char xorr_binary_result = left_binary_value[0];
    for (size_t i = 1; i < firexp_width; i++) {
      if (left_binary_value[i] == xorr_binary_result) {
        xorr_binary_result = '0';
      } else {
        xorr_binary_result = '1';
      }
    }
    std::string xorr_hex_result = RADIX_HEX + xorr_binary_result;
    return xorr_hex_result;
  }
  std::string BigInt::cat(BigInt* right, unsigned int leftexp_width, unsigned int rightexp_width) {
    std::string left_origin_value = this->getOriginValue();
    std::string right_origin_value = right->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the left BigInt '%s' in CAT operation. Correct it and return.\n", left_origin_value.c_str());
      return "";
    }
    if (!right->init()) {
      fs_error("*ERROR: Failed to initialize the right BigInt '%s' in CAT operation. Correct it and return.\n", right_origin_value.c_str());
      return "";
    }
    bool left_signed = this->getSigned();
    bool right_signed = right->getSigned();
    if (left_signed != right_signed) {
      fs_error("*ERROR: The '%s' left BigInt '%s' is incompatible with '%s' right BigInt '%s' in CAT operation. Correct them and return.\n", left_signed ? "signed" : "unsigned", left_origin_value.c_str(), right_signed ? "signed" : "unsigned", right_origin_value.c_str());
      return "";
    }
    Big* left_big = this->getBig();
    Big* right_big = right->getBig();
    if (left_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of left BigInt '%s'. Correct it and rerun.\n", left_origin_value.c_str());
      return "";
    }
    if (right_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of right BigInt '%s'. Correct it and rerun.\n", right_origin_value.c_str());
      return "";
    }

    int left_min_width = this->getMinBinaryWidth();
    std::string left_binary_value = this->getRadixValue(left_big, 2, left_min_width);
    if (left_binary_value == "+" || left_binary_value == "-" || left_binary_value == "") {
      fs_error("*ERROR*: Empty left binary value '%s' for CAT operation.\n", left_binary_value.c_str());
      return "";
    }
    if (left_binary_value == "-0") {
      fs_warning("*WARNING*: Bad left number '-0' for CAT operation.\n");
      return "0";
    }
    if (left_binary_value[0] == '-') {
      fs_assert(left_binary_value.size() >= 2);
      left_binary_value[0] = '0';
      left_binary_value = this->getBinaryComplement(left_binary_value);
      fs_assert(left_binary_value[0] == '1');
      if (left_binary_value.size() < leftexp_width) {
        left_binary_value.insert(0, leftexp_width - left_binary_value.size(), '1');
      }
    } else if (left_binary_value[0] == '+') {
      fs_assert(left_binary_value.size() >= 2);
      left_binary_value.erase(0); // erase one char at position 0
      if (left_binary_value.size() < leftexp_width) {
        left_binary_value.insert(0, leftexp_width - left_binary_value.size(), '0');
      }
    } else {
      fs_assert(left_binary_value.size() >= 1);
      if (left_binary_value.size() < leftexp_width) {
        left_binary_value.insert(0, leftexp_width - left_binary_value.size(), '0');
      }
    }
    int right_min_width = right->getMinBinaryWidth();
    std::string right_binary_value = this->getRadixValue(right_big, 2, right_min_width);
    if (right_binary_value == "+" || right_binary_value == "-" || right_binary_value == "") {
      fs_error("*ERROR*: Empty right binary value '%s' for CAT operation.\n", right_binary_value.c_str());
      return "";
    }
    if (right_binary_value == "-0") {
      fs_warning("*WARNING*: Bad right number '-0' for CAT operation.\n");
      return "0";
    }
    if (right_binary_value[0] == '-') {
      fs_assert(right_binary_value.size() >= 2);
      right_binary_value[0] = '0';
      right_binary_value = this->getBinaryComplement(right_binary_value);
      fs_assert(right_binary_value[0] == '1');
      if (right_binary_value.size() < rightexp_width) {
        right_binary_value.insert(0, rightexp_width - right_binary_value.size(), '1');
      }
    } else if (right_binary_value[0] == '+') {
      fs_assert(right_binary_value.size() >= 2);
      right_binary_value.erase(0); // erase one char at position 0
      if (right_binary_value.size() < rightexp_width) {
        right_binary_value.insert(0, rightexp_width - right_binary_value.size(), '0');
      }
    } else {
      fs_assert(right_binary_value.size() >= 1);
      if (right_binary_value.size() < rightexp_width) {
        right_binary_value.insert(0, rightexp_width - right_binary_value.size(), '0');
      }
    }

    std::string cat_binary_result = left_binary_value + right_binary_value;
    fs_assert(cat_binary_result.size() == leftexp_width + rightexp_width);
    cat_binary_result = "b" + cat_binary_result;
    BigInt cat_bigint_result(cat_binary_result, false);
    std::string cat_hex_result = cat_bigint_result.getHexadecimalValue();
    return cat_hex_result;
  }
  std::string BigInt::bits(unsigned int firexp_width, unsigned int bits_hi, unsigned int bits_lo) {
    std::string left_origin_value = this->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the left BigInt '%s' in BITS operation. Correct it and return.\n", left_origin_value.c_str());
      return "";
    }
    Big* left_big = this->getBig();
    if (left_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of left BigInt '%s'. Correct it and rerun.\n", left_origin_value.c_str());
      return "";
    }
    int left_min_width = this->getMinBinaryWidth();
    std::string left_binary_value = this->getRadixValue(left_big, 2, left_min_width);
    if (left_binary_value == "+" || left_binary_value == "-" || left_binary_value == "") {
      fs_error("*ERROR*: Empty left binary value '%s' for BITS operation.\n", left_binary_value.c_str());
      return RADIX_HEX + "1";
    }
    if (left_binary_value == "-0") {
      fs_warning("*WARNING*: Bad left number '-0' for BITS operation.\n");
      return RADIX_HEX + "0";;
    }
    if (left_binary_value[0] == '-') {
      fs_assert(left_binary_value.size() >= 2);
      left_binary_value[0] = '0';
      left_binary_value = this->getBinaryComplement(left_binary_value);
      fs_assert(left_binary_value[0] == '1');
      if (left_binary_value.size() < firexp_width) {
        left_binary_value.insert(0, firexp_width - left_binary_value.size(), '1');
      }
    } else if (left_binary_value[0] == '+') {
      fs_assert(left_binary_value.size() >= 2);
      left_binary_value.erase(0); // erase one char at position 0
      if (left_binary_value.size() < firexp_width) {
        left_binary_value.insert(0, firexp_width - left_binary_value.size(), '0');
      }
    } else {
      fs_assert(left_binary_value.size() >= 1);
      if (left_binary_value.size() < firexp_width) {
        left_binary_value.insert(0, firexp_width - left_binary_value.size(), '0');
      }
    }
    int start = firexp_width - bits_hi - 1;
    if (start < 0) {
      fs_error("*ERROR*: High bit '%d' in BITS operator is larger than input width '%d' of bigint number '%s'.\n", bits_hi, firexp_width, left_binary_value.c_str());
      return "";
    }

    std::string bits_binary_result = left_binary_value.substr(start, bits_hi - bits_lo + 1);
    bits_binary_result = "b" + bits_binary_result;
    BigInt bits_big(bits_binary_result, false);
    std::string bits_hex_result = bits_big.getHexadecimalValue();
    return bits_hex_result;
  }
  std::string BigInt::head(unsigned int firexp_width, unsigned int n) {
    std::string left_origin_value = this->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the left BigInt '%s' in HEAD operation. Correct it and return.\n", left_origin_value.c_str());
      return "";
    }
    Big* left_big = this->getBig();
    if (left_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of left BigInt '%s'. Correct it and rerun.\n", left_origin_value.c_str());
      return "";
    }
    int left_min_width = this->getMinBinaryWidth();
    std::string left_binary_value = this->getRadixValue(left_big, 2, left_min_width);
    if (left_binary_value == "+" || left_binary_value == "-" || left_binary_value == "") {
      fs_error("*ERROR*: Empty left binary value '%s' for HEAD operation.\n", left_binary_value.c_str());
      return RADIX_HEX + "1";
    }
    if (left_binary_value == "-0") {
      fs_warning("*WARNING*: Bad left number '-0' for HEAD operation.\n");
      return RADIX_HEX + "0";;
    }
    if (left_binary_value[0] == '-') {
      fs_assert(left_binary_value.size() >= 2);
      left_binary_value[0] = '0';
      left_binary_value = this->getBinaryComplement(left_binary_value);
      fs_assert(left_binary_value[0] == '1');
      if (left_binary_value.size() < firexp_width) {
        left_binary_value.insert(0, firexp_width - left_binary_value.size(), '1');
      }
    } else if (left_binary_value[0] == '+') {
      fs_assert(left_binary_value.size() >= 2);
      left_binary_value.erase(0); // erase one char at position 0
      if (left_binary_value.size() < firexp_width) {
        left_binary_value.insert(0, firexp_width - left_binary_value.size(), '0');
      }
    } else {
      fs_assert(left_binary_value.size() >= 1);
      if (left_binary_value.size() < firexp_width) {
        left_binary_value.insert(0, firexp_width - left_binary_value.size(), '0');
      }
    }

    if (n < 0 || n > firexp_width) {
      fs_error("*ERROR*: HEAD n(%d) must be non-negative and less than or equal to the bit width of bigint value '%s'.\n", n, left_binary_value.c_str());
      return "";
    }

    std::string head_binary_result = left_binary_value.substr(0, n);
    head_binary_result = "b" + head_binary_result;
    BigInt head_big(head_binary_result, false);
    std::string head_hex_result = head_big.getHexadecimalValue();
    return head_hex_result;
  }
  std::string BigInt::tail(unsigned int firexp_width, unsigned int n) {
    std::string left_origin_value = this->getOriginValue();
    if (!this->init()) {
      fs_error("*ERROR: Failed to initialize the left BigInt '%s' in TAIL operation. Correct it and return.\n", left_origin_value.c_str());
      return "";
    }
    Big* left_big = this->getBig();
    if (left_big == NULL) {
      fs_error("*ERROR*: Failed to get the miracl big value of left BigInt '%s'. Correct it and rerun.\n", left_origin_value.c_str());
      return "";
    }
    int left_min_width = this->getMinBinaryWidth();
    std::string left_binary_value = this->getRadixValue(left_big, 2, left_min_width);
    if (left_binary_value == "+" || left_binary_value == "-" || left_binary_value == "") {
      fs_error("*ERROR*: Empty left binary value '%s' for TAIL operation.\n", left_binary_value.c_str());
      return RADIX_HEX + "1";
    }
    if (left_binary_value == "-0") {
      fs_warning("*WARNING*: Bad left number '-0' for TAIL operation.\n");
      return RADIX_HEX + "0";;
    }
    if (left_binary_value[0] == '-') {
      fs_assert(left_binary_value.size() >= 2);
      left_binary_value[0] = '0';
      left_binary_value = this->getBinaryComplement(left_binary_value);
      fs_assert(left_binary_value[0] == '1');
      if (left_binary_value.size() < firexp_width) {
        left_binary_value.insert(0, firexp_width - left_binary_value.size(), '1');
      }
    } else if (left_binary_value[0] == '+') {
      fs_assert(left_binary_value.size() >= 2);
      left_binary_value.erase(0); // erase one char at position 0
      if (left_binary_value.size() < firexp_width) {
        left_binary_value.insert(0, firexp_width - left_binary_value.size(), '0');
      }
    } else {
      fs_assert(left_binary_value.size() >= 1);
      if (left_binary_value.size() < firexp_width) {
        left_binary_value.insert(0, firexp_width - left_binary_value.size(), '0');
      }
    }

    if (n < 0 || n > firexp_width) {
      fs_error("*ERROR*: TAIL n(%d) must be non-negative and less than or equal to the bit width of bigint value '%s'.\n", n, left_binary_value.c_str());
      return "";
    }

    std::string tail_binary_result = left_binary_value.substr(n);
    tail_binary_result = "b" + tail_binary_result;
    BigInt tail_big(tail_binary_result, false);
    std::string tail_hex_result = tail_big.getHexadecimalValue();
    return tail_hex_result;
  }

}