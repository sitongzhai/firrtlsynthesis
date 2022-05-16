//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#ifndef UTILITY_BIGINT_H
#define UTILITY_BIGINT_H

#include <string>
#include "utility/assert.h"
#include "big.h"

namespace firrtlsyn {

  //int MAX_MIRACL_BITS = 5000;
  //int RADIX_DEFAULT = 16;

  class BigInt {
  public:
    BigInt(int value) {
      origin_value_ = std::to_string(value);
      is_signed_ = true;
      min_width_ = INT_MAX;
      big_ = NULL;
      radix_ = 10;
    }
    BigInt(unsigned int value) {
      origin_value_ = std::to_string(value);
      is_signed_ = false;
      min_width_ = INT_MAX;
      big_ = NULL;
      radix_ = 10;
    }
    BigInt(long long value) {
      origin_value_ = std::to_string(value);
      is_signed_ = true;
      min_width_ = INT_MAX;
      big_ = NULL;
      radix_ = 10;
    }
    BigInt(unsigned long long value) {
      origin_value_ = std::to_string(value);
      is_signed_ = false;
      min_width_ = INT_MAX;
      big_ = NULL;
      radix_ = 10;
    }
    BigInt(const std::string& value, bool is_signed) {
      origin_value_ = value;
      is_signed_ = is_signed;
      min_width_ = INT_MAX;
      big_ = NULL;
      radix_ = 0;
    }
    ~BigInt() {
      if (big_ != NULL) delete big_;
      big_ = NULL;
    }
  public:
    bool getSigned() const { return is_signed_; }
    bool isSInt() const { return is_signed_ == true; }
    bool isUInt() const { return is_signed_ == false; }
    std::string getOriginValue() const { return origin_value_; }
    Big* getBig();
    int getRadix();
    int getMinBinaryWidth();
    std::string getBinaryValue();
    std::string getOctalValue();
    std::string getDecimalValue();
    std::string getHexadecimalValue();
    int getSIntValue();
    unsigned int getUIntValue();

  public:
    std::string add(BigInt* right);
    std::string sub(BigInt* right);
    std::string mul(BigInt* right);
    std::string div(BigInt* right);
    std::string mod(BigInt* right);
    std::string eq(BigInt* right);
    bool eq(int number);
    std::string neq(BigInt* right);
    std::string lt(BigInt* right);
    std::string leq(BigInt* right);
    std::string gt(BigInt* right);
    std::string geq(BigInt* right);
    std::string pad(unsigned int pad_n);
    std::string asuint(unsigned int firexp_width);
    std::string assint(unsigned int firexp_width);
    std::string shl(unsigned int shl_n, unsigned int firexp_width);
    std::string shr(unsigned int shr_n, unsigned int firexp_width);
    std::string dshl(BigInt* right, unsigned int firexp_width);
    std::string dshr(BigInt* right, unsigned int firexp_width);
    std::string cvt();
    std::string neg();
    std::string not_op(unsigned int firexp_width);
    std::string and_op(BigInt* right);
    std::string or_op(BigInt* right);
    std::string xor_op(BigInt* right);
    std::string andr(unsigned int firexp_width);
    std::string orr(unsigned int firexp_width);
    std::string xorr(unsigned int firexp_width);
    std::string cat(BigInt* right, unsigned int leftexp_width, unsigned int rightexp_width);
    std::string bits(unsigned int firexp_width, unsigned int bits_hi, unsigned int bits_lo);
    std::string head(unsigned int firexp_width, unsigned int n);
    std::string tail(unsigned int firexp_width, unsigned int n);
  private:
    bool isInited() {
      return big_ != NULL;
    }
    bool init();
    void printValidFirrtlValue();
    void setMiraclRadix(int radix) {
      mip_->IOBASE = radix;
    }
    int getMiraclIOBSIZ() const {
      return mip_->IOBSIZ;
    }
    void setMiraclIOBufferSize(int size) {
      set_io_buffer_size(size);
    }
    
    bool hasMiraclError() {
      return mip_->ERNUM > 0;
    }
    std::string getRadixValue(Big* big, int radix, int num_buffer_size);
    std::string getBinaryComplement(const std::string& binary_value);
    
    std::string getMiraclErrorMsg();
  private:
    static miracl* mip_;

  private:
    std::string origin_value_;
    bool is_signed_;
    int min_width_;
    Big* big_;
    int  radix_;
  };

}

#endif
