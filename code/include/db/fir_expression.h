//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#ifndef DB_FIREXPRESSION_H
#define DB_FIREXPRESSION_H

#include <list>
#include "db/fir_db.h"
#include "utility/big_int.h"

namespace firrtlsyn {

  class firDB::firExp : public firDB::firLocObj {
  public:
    firExp() {
      exp_type_ = ExpressionType::kExpTypeUndef;
      type_data_ = NULL;
      exp_val_ = NULL;
    }
    virtual ~firExp() {}

    virtual std::string toString(std::string indent = "") = 0;
    virtual bool isSameExpression(firExp* exp) = 0;
    virtual firType* inferDataType(firModule* module, firItemConditional* domain = NULL) = 0;
    virtual firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL) = 0;
    virtual firType* getTypeData(firModule* module, firItemConditional* domain = NULL) = 0;
    virtual firExp* getExpVal(firModule* module, firItemConditional* domain = NULL) = 0;
    void set_exp_val(firExp* exp_val) { exp_val_ = exp_val; }
    firExp* exp_val() { return exp_val_; }
    void set_type_data(firType* type_data) { type_data_ = type_data; }
    firType* type_data() { return type_data_; }
    ExpressionType type() const { return exp_type_; }
    //To generate a positive expression sequence, because expression is arranged with negative sequence
    //eg., subfield: inst.port.x.y----negative sequence: y->x->port->inst   this is in current memory  
    //                                positive sequence: inst->port->x->y
    std::list<firExp*> generateExpPositiveSequence();
    bool isUIntExpression() {
      return type() == ExpressionType::kExpTypeUInt;
    }
    bool isUIntBitsExpression() {
      return type() == ExpressionType::kExpTypeUIntBits;
    }
    bool isSIntExpression() {
      return type() == ExpressionType::kExpTypeSInt;
    }
    bool isSIntBitsExpression() {
      return type() == ExpressionType::kExpTypeSIntBits;
    }
    bool isReferenceExpression() {
      return type() == ExpressionType::kExpTypeRef;
    }
    bool isSubfieldExpression() {
      return type() == ExpressionType::kExpTypeSubfield;
    }
    bool isDoubleExpression() {
      return type() == ExpressionType::kExpTypeDouble;
    }
    bool isSubindexExpression() {
      return type() == ExpressionType::kExpTypeSubindex;
    }
    bool isSubaccessExpression() {
      return type() == ExpressionType::kExpTypeSubaccess;
    }
    bool isMuxExpression() {
      return type() == ExpressionType::kExpTypeMux;
    }
    bool isValidifExpression() {
      return type() == ExpressionType::kExpTypeValidif;
    }
    bool isPrimOperationExpression() {
      return type() == ExpressionType::kExpTypePrimOperation;
    }
    bool isIdExpression() {
      return type() == ExpressionType::kExpTypeRef ||
        type() == ExpressionType::kExpTypeSubfield ||
        type() == ExpressionType::kExpTypeSubindex ||
        type() == ExpressionType::kExpTypeSubaccess;
    }
    bool isUIntNumberExpression() {
      return type() == ExpressionType::kExpTypeUInt ||
        type() == ExpressionType::kExpTypeUIntBits;
    }
    bool isSIntNumberExpression() {
      return type() == ExpressionType::kExpTypeSInt ||
        type() == ExpressionType::kExpTypeSIntBits;
    }
    bool isNumberExpression() {
      return type() == ExpressionType::kExpTypeDouble ||
        type() == ExpressionType::kExpTypeSInt ||
        type() == ExpressionType::kExpTypeSIntBits ||
        type() == ExpressionType::kExpTypeUInt ||
        type() == ExpressionType::kExpTypeUIntBits;
    }
    bool isOperationExpression() {
      return type() == ExpressionType::kExpTypeMux ||
        type() == ExpressionType::kExpTypeValidif ||
        type() == ExpressionType::kExpTypePrimOperation;
    }
  protected:
    ExpressionType exp_type_;
    firType* type_data_;
    firExp* exp_val_;
  };

  class firDB::firExpUInt : public firDB::firExp {
  public:
    firExpUInt(unsigned long long value, int width);
    ~firExpUInt() {
      if (big_value_ != NULL) delete big_value_;
      big_value_ = NULL;
    }

  public:
    // convert UInt expression to string
    std::string toString(std::string indent = "") {
      std::string s_width;
      if (width_ > 0) {
        s_width = "<" + std::to_string(width_) + ">";
      }
      std::string origin_value = big_value_->getOriginValue();
      fs_assert(origin_value[0] >= '0' && origin_value[0] <= '9');
      std::string str = indent + "UInt" + s_width + "(" + origin_value + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    unsigned int width() { return width_; }
    //unsigned long long value() { return value_; }
    BigInt* big_value() { return big_value_; }
    void set_width(unsigned int width) { width_ = width; }    // width infer

  private:
    void updateTypeData(firModule* module);
    void updateExpVal(firModule* module);
  private:
    unsigned int width_;
    //unsigned long long value_;
    BigInt* big_value_;
  };

  class firDB::firExpUIntBits : public firDB::firExp {
  public:
    firExpUIntBits(const std::string& value, int width);
    ~firExpUIntBits() {
      if (big_value_ != NULL) delete big_value_;
      big_value_ = NULL;
    }

  public:
    // convert UIntBits expression to string
    std::string toString(std::string indent = "") {
      std::string s_width;
      if (width_ > 0) {
        s_width = "<" + std::to_string(width_) + ">";
      }
      std::string origin_value = big_value_->getOriginValue();
      std::string str = indent + "UInt" + s_width + "(\"" + origin_value + "\")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    unsigned int width() { return width_; }
    //std::string value() { return value_; }
    BigInt* big_value() { return big_value_; }
    void set_width(unsigned int width) { width_ = width; }   // width infer
    //void set_value(const std::string& value) { value_ = value; }   // if value is "h00" convert to "h0"

  private:
    void updateTypeData(firModule* module);
    void updateExpVal(firModule* module);
  private:
    unsigned int width_;
    //std::string value_;
    BigInt* big_value_;
  };

  class firDB::firExpSInt : public firDB::firExp {
  public:
    firExpSInt(long long value, int width);
    ~firExpSInt() {
      if (big_value_ != NULL) delete big_value_;
      big_value_ = NULL;
    }

  public:
    // convert SInt to string
    std::string toString(std::string indent = "") {
      std::string s_width;
      if (width_ > 0) {
        s_width = "<" + std::to_string(width_) + ">";
      }
      std::string origin_value = big_value_->getOriginValue();
      std::string str = indent + "SInt" + s_width + "(" + origin_value + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    unsigned int width() { return width_; }
    //long long value() { return value_; }
    BigInt* big_value() { return big_value_; }
    void set_width(unsigned int width) { width_ = width; }   // width infer

  private:
    void updateTypeData(firModule* module);
    void updateExpVal(firModule* module);
  private:
    unsigned int width_;
    //long long value_;
    BigInt* big_value_;
  };

  class firDB::firExpSIntBits : public firDB::firExp {
  public:
    firExpSIntBits(const std::string& value, int width);
    ~firExpSIntBits() {
      if (big_value_ != NULL) delete big_value_;
      big_value_ = NULL;
    }

  public:
    // convert SIntBits to string
    std::string toString(std::string indent = "") {
      std::string s_width;
      if (width_ > 0) {
        s_width = "<" + std::to_string(width_) + ">";
      }
      std::string origin_value = big_value_->getOriginValue();
      std::string str = indent + "SInt" + s_width + "(\"" + origin_value + "\")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    unsigned int width() { return width_; }
    //std::string value() { return value_; }
    BigInt* big_value() { return big_value_; }
    void set_width(unsigned int width) { width_ = width; }   // width infer
    //void set_value(const std::string& value) { value_ = value; }   // if value is "h00" convert to "h0"

  private:
    void updateTypeData(firModule* module);
    void updateExpVal(firModule* module);
  private:
    unsigned int width_;
    //std::string value_;
    BigInt* big_value_;
  };

  class firDB::firExpRef : public firDB::firExp {
  public:
    firExpRef(const std::string& id) {
      id_ = id;
      exp_type_ = ExpressionType::kExpTypeRef;
    }
    ~firExpRef() {}

  public:
    // convert reference expression to string
    std::string toString(std::string indent = "") {
      std::string str = indent + id_;
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    std::string id() { return id_; }

  private:
    void updateTypeData(firModule* module, firItemConditional* domain);
    void updateExpVal(firModule* module, firItemConditional* domain);
  private:
    std::string id_;
  };

  class firDB::firExpSubfield : public firDB::firExp {
  public:
    firExpSubfield(firExp* exp, const std::string& id) {
      exp_ = exp;
      id_ = id;
      exp_type_ = ExpressionType::kExpTypeSubfield;
    }
    ~firExpSubfield() {}

  public:
    // convert subfield expression to string
    std::string toString(std::string indent = "") {
      std::string s_exp;
      if (exp_ != NULL) {
        s_exp = exp_->toString();
      } else {
        fs_assert(0);
        s_exp = "";
      }
      std::string str = indent + s_exp + "." + id_;
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    std::string id() const { return id_; }
    firExp* exp() { return exp_; }

  private:
    void updateMemoryTypeData(firModule* module, firItemConditional* domain, firItemMemory* memory);
    void updateItemTypeData(firModule* module, firItem* item, firType* subfield_exp_type);
  private:
    firExp* exp_;
    std::string id_;
  };

  class firDB::firExpDouble : public firDB::firExp {
  public:
    firExpDouble(int right_side, int left_side) {
      exp_type_ = ExpressionType::kExpTypeDouble;
      left_side_ = left_side;
      right_side_ = right_side;
    }
    ~firExpDouble() {}

  public:
    // convert double expression to string
    std::string toString(std::string indent = "") {
      std::string str = indent + std::to_string(left_side_) + "." + std::to_string(right_side_);
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    int left_side() { return left_side_; }
    int right_side() { return right_side_; }

  private:
    int left_side_;
    int right_side_;
  };

  class firDB::firExpSubindex : public firDB::firExp {
  public:
    firExpSubindex(firExp* exp, int index);
    ~firExpSubindex() {}

  public:
    // convert sub-index to string
    std::string toString(std::string indent = "") {
      std::string s_exp;
      if (exp_ != NULL) {
        s_exp = exp_->toString();
      } else {
        fs_assert(0);
        s_exp = "";
      }
      std::string str = indent + s_exp + "[" + std::to_string(index_) + "]";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp() { return exp_; }
    unsigned int index() { return index_; }

  private:
    void updateTypeData(firModule* module, firType* subindex_exp_type);
    void updateExpVal(firModule* module, firExp* subindex_exp_val);
  private:
    firExp* exp_;
    unsigned int index_;
  };

  class firDB::firExpSubaccess : public firDB::firExp {
  public:
    firExpSubaccess(firExp* exp, firExp* access);
    ~firExpSubaccess() {}

  public:
    // convert sub-access to string
    std::string toString(std::string indent = "") {
      std::string s_exp;
      if (exp_ != NULL) {
        s_exp = exp_->toString();
      } else {
        fs_assert(0);
        s_exp = "";
      }
      std::string s_access;
      if (access_ != NULL) {
        s_access = access_->toString();
      } else {
        fs_assert(0);
        s_access = "";
      }
      std::string str = indent + s_exp + "[" + s_access + "]";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp() { return exp_; }
    firExp* access() { return access_; }

  private:
    void updateTypeData(firModule* module, firType* subaccess_exp_type, firType* subaccess_access_type);
  private:
    firExp* exp_;
    //calculated index
    firExp* access_;
  };

  class firDB::firExpMux : public firDB::firExp {
  public:
    firExpMux(firExp* sel, firExp* input1, firExp* input2);
    ~firExpMux() {}

  public:
    // convert mux expression to string
    std::string toString(std::string indent = "") {
      std::string s_sel;
      if (sel_ != NULL) {
        s_sel = sel_->toString();
      } else {
        fs_assert(0);
        s_sel = "";
      }
      std::string s_input1;
      if (input1_ != NULL) {
        s_input1 = input1_->toString();
      } else {
        fs_assert(0);
        s_input1 = "";
      }
      std::string s_input2;
      if (input2_ != NULL) {
        s_input2 = input2_->toString();
      } else {
        fs_assert(0);
        s_input2 = "";
      }
      std::string str = indent + "mux(" + s_sel + ", " + s_input1 + ", " + s_input2 + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* sel() { return sel_; }
    firExp* input1() { return input1_; }
    firExp* input2() { return input2_; }
    void set_input1(firExp* input1) { input1_ = input1; }
    void set_input2(firExp* input2) { input2_ = input2; }

  private:
    void updateTypeData(firModule* module, firType* mux_sel_type, firType* mux_tval_type, firType* mux_fval_type);
    void updateExpVal(firModule* module, firExp* mux_sel_value, firExp* mux_tval_value, firExp* mux_fval_value);
  private:
    //selection signal
    firExp* sel_;
    //two input expressions
    firExp* input1_;
    firExp* input2_;
  };

  class firDB::firExpValidif : public firDB::firExp {
  public:
    firExpValidif(firExp* valid, firExp* exp);
    ~firExpValidif() {}

  public:
    // convert valid if to string
    std::string toString(std::string indent = "") {
      std::string s_sel;
      if (valid_ != NULL) {
        s_sel = valid_->toString();
      } else {
        fs_assert(0);
        s_sel = "";
      }
      std::string s_signal;
      if (exp_ != NULL) {
        s_signal = exp_->toString();
      } else {
        fs_assert(0);
        s_signal = "";
      }
      std::string str = indent + "validif(" + s_sel + ", " + s_signal + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* valid() { return valid_; }
    firExp* exp() { return exp_; }

  private:
    void updateTypeData(firModule* module, firType* validif_valid_type, firType* validif_exp_type);
    void updateExpVal(firModule* module, firExp* validif_valid_val, firExp* validif_exp_val);
  private:
    //valid signal
    firExp* valid_;
    //input expression
    firExp* exp_;
  };

  class firDB::firExpPrimOperation : public firDB::firExp {
  public:
    class firAdd;
    class firSub;
    class firMul;
    class firDiv;
    class firMod;
    class firLt;
    class firLeq;
    class firGt;
    class firGeq;
    class firEq;
    class firNeq;
    class firPad;
    class firAsUInt;
    class firAsSInt;
    class firAsClock;
    class firAsFixed;
    class firAsAsyncReset;
    class firAsInterval;
    class firShl;
    class firShr;
    class firDshl;
    class firDshr;
    class firCvt;
    class firNeg;
    class firNot;
    class firAnd;
    class firOr;
    class firXor;
    class firAndr;
    class firOrr;
    class firXorr;
    class firCat;
    class firBits;
    class firHead;
    class firTail;
    class firIncp;
    class firDecp;
    class firSetp;
    class firWrap;
    class firClip;
    class firSquz;

    enum PrimOperationType {
      kOperatorTypeAdd,
      kOperatorTypeSub,
      kOperatorTypeMul,
      kOperatorTypeDiv,
      kOperatorTypeMod,
      kOperatorTypeLt,
      kOperatorTypeLeq,
      kOperatorTypeGt,
      kOperatorTypeGeq,
      kOperatorTypeEq,
      kOperatorTypeNeq,
      kOperatorTypePad,
      kOperatorTypeAsUInt,
      kOperatorTypeAsSInt,
      kOperatorTypeAsClock,
      kOperatorTypeAsFixed,
      kOperatorTypeAsAsyncReset,
      kOperatorTypeAsInterval,
      kOperatorTypeShl,
      kOperatorTypeShr,
      kOperatorTypeDshl,
      kOperatorTypeDshr,
      kOperatorTypeCvt,
      kOperatorTypeNeg,
      kOperatorTypeNot,
      kOperatorTypeAnd,
      kOperatorTypeOr,
      kOperatorTypeXor,
      kOperatorTypeAndr,
      kOperatorTypeOrr,
      kOperatorTypeXorr,
      kOperatorTypeCat,
      kOperatorTypeBits,
      kOperatorTypeHead,
      kOperatorTypeTail,
      kOperatorTypeIncp,
      kOperatorTypeDecp,
      kOperatorTypeSetp,
      kOperatorTypeWrap,
      kOperatorTypeClip,
      kOperatorTypeSquz,
      kOperatorTypeUndef
    };

    firExpPrimOperation() {}
    virtual ~firExpPrimOperation() {}

    virtual std::string toString(std::string indent = "") = 0;
    virtual bool isSameExpression(firExp* exp) = 0;
    virtual firType* getTypeData(firModule* module, firItemConditional* domain = NULL) = 0;
    virtual firType* inferDataType(firModule* module, firItemConditional* domain = NULL) = 0;
    virtual firExp* getExpVal(firModule* module, firItemConditional* domain = NULL) = 0;
    virtual firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL) = 0;
    PrimOperationType operator_type() { return operator_type_; }
  public:
    bool isAdd() { return operator_type() == PrimOperationType::kOperatorTypeAdd; }
    bool isSub() { return operator_type() == PrimOperationType::kOperatorTypeSub; }
    bool isMul() { return operator_type() == PrimOperationType::kOperatorTypeMul; }
    bool isDiv() { return operator_type() == PrimOperationType::kOperatorTypeDiv; }
    bool isMod() { return operator_type() == PrimOperationType::kOperatorTypeMod; }
    bool isLt() { return operator_type() == PrimOperationType::kOperatorTypeLt; }
    bool isLeq() { return operator_type() == PrimOperationType::kOperatorTypeLeq; }
    bool isGt() { return operator_type() == PrimOperationType::kOperatorTypeGt; }
    bool isGeq() { return operator_type() == PrimOperationType::kOperatorTypeGeq; }
    bool isEq() { return operator_type() == PrimOperationType::kOperatorTypeEq; }
    bool isNeq() { return operator_type() == PrimOperationType::kOperatorTypeNeq; }
    bool isPad() { return operator_type() == PrimOperationType::kOperatorTypePad; }
    bool isAsUInt() { return operator_type() == PrimOperationType::kOperatorTypeAsUInt; }
    bool isAsSInt() { return operator_type() == PrimOperationType::kOperatorTypeAsSInt; }
    bool isAsClock() { return operator_type() == PrimOperationType::kOperatorTypeAsClock; }
    bool isAsFixed() { return operator_type() == PrimOperationType::kOperatorTypeAsFixed; }
    bool isAsAsyncReset() { return operator_type() == PrimOperationType::kOperatorTypeAsAsyncReset; }
    bool isAsInterval() { return operator_type() == PrimOperationType::kOperatorTypeAsInterval; }
    bool isShl() { return operator_type() == PrimOperationType::kOperatorTypeShl; }
    bool isShr() { return operator_type() == PrimOperationType::kOperatorTypeShr; }
    bool isDshl() { return operator_type() == PrimOperationType::kOperatorTypeDshl; }
    bool isDshr() { return operator_type() == PrimOperationType::kOperatorTypeDshr; }
    bool isCvt() { return operator_type() == PrimOperationType::kOperatorTypeCvt; }
    bool isNeg() { return operator_type() == PrimOperationType::kOperatorTypeNeg; }
    bool isNot() { return operator_type() == PrimOperationType::kOperatorTypeNot; }
    bool isAnd() { return operator_type() == PrimOperationType::kOperatorTypeAnd; }
    bool isOr() { return operator_type() == PrimOperationType::kOperatorTypeOr; }
    bool isXor() { return operator_type() == PrimOperationType::kOperatorTypeXor; }
    bool isAndr() { return operator_type() == PrimOperationType::kOperatorTypeAndr; }
    bool isOrr() { return operator_type() == PrimOperationType::kOperatorTypeOrr; }
    bool isXorr() { return operator_type() == PrimOperationType::kOperatorTypeXorr; }
    bool isCat() { return operator_type() == PrimOperationType::kOperatorTypeCat; }
    bool isBits() { return operator_type() == PrimOperationType::kOperatorTypeBits; }
    bool isHead() { return operator_type() == PrimOperationType::kOperatorTypeHead; }
    bool isTail() { return operator_type() == PrimOperationType::kOperatorTypeTail; }
    bool isIncp() { return operator_type() == PrimOperationType::kOperatorTypeIncp; }
    bool isDecp() { return operator_type() == PrimOperationType::kOperatorTypeDecp; }
    bool isSetp() { return operator_type() == PrimOperationType::kOperatorTypeSetp; }
    bool isWrap() { return operator_type() == PrimOperationType::kOperatorTypeWrap; }
    bool isClip() { return operator_type() == PrimOperationType::kOperatorTypeClip; }
    bool isSquz() { return operator_type() == PrimOperationType::kOperatorTypeSquz; }

  private:
    PrimOperationType operator_type_;
  };

  class firDB::firExpPrimOperation::firAdd : public firDB::firExpPrimOperation {
  public:
    firAdd(firExp* exp1, firExp* exp2) {
      exp1_ = exp1;
      exp2_ = exp2;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeAdd;
    }
    ~firAdd() {}

  public:
    // convert add prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp1;
      if (exp1_ != NULL) {
        s_exp1 = exp1_->toString();
      } else {
        fs_assert(0);
        s_exp1 = "";
      }
      std::string s_exp2;
      if (exp2_ != NULL) {
        s_exp2 = exp2_->toString();
      } else {
        fs_assert(0);
        s_exp2 = "";
      }
      std::string str = indent + "add(" + s_exp1 + ", " + s_exp2 + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp1() { return exp1_; }
    firExp* exp2() { return exp2_; }

  private:
    void updateTypeData(firModule* module, firType* add_exp1_type, firType* add_exp2_type);
    void updateExpVal(firModule* module, firExp* add_exp1_value, firExp* add_exp2_value);
  private:
    firExp* exp1_;
    firExp* exp2_;
  };

  class firDB::firExpPrimOperation::firSub : public firDB::firExpPrimOperation {
  public:
    firSub(firExp* exp1, firExp* exp2) {
      exp1_ = exp1;
      exp2_ = exp2;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeSub;
    }
    ~firSub() {}

  public:
    // convert sub prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp1;
      if (exp1_ != NULL) {
        s_exp1 = exp1_->toString();
      } else {
        fs_assert(0);
        s_exp1 = "";
      }
      std::string s_exp2;
      if (exp2_ != NULL) {
        s_exp2 = exp2_->toString();
      } else {
        fs_assert(0);
        s_exp2 = "";
      }
      std::string str = indent + "sub(" + s_exp1 + ", " + s_exp2 + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp1() { return exp1_; }
    firExp* exp2() { return exp2_; }

  private:
    void updateTypeData(firModule* module, firType* sub_exp1_type, firType* sub_exp2_type);
    void updateExpVal(firModule* module, firExp* sub_exp1_value, firExp* sub_exp2_value);
  private:
    firExp* exp1_;
    firExp* exp2_;
  };

  class firDB::firExpPrimOperation::firMul : public firDB::firExpPrimOperation {
  public:
    firMul(firExp* exp1, firExp* exp2) {
      exp1_ = exp1;
      exp2_ = exp2;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeMul;
    }
    ~firMul() {}

  public:
    // convert mul prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp1;
      if (exp1_ != NULL) {
        s_exp1 = exp1_->toString();
      } else {
        fs_assert(0);
        s_exp1 = "";
      }
      std::string s_exp2;
      if (exp2_ != NULL) {
        s_exp2 = exp2_->toString();
      } else {
        fs_assert(0);
        s_exp2 = "";
      }
      std::string str = indent + "mul(" + s_exp1 + ", " + s_exp2 + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp1() { return exp1_; }
    firExp* exp2() { return exp2_; }

  private:
    void updateTypeData(firModule* module, firType* mul_exp1_type, firType* mul_exp2_type);
    void updateExpVal(firModule* module, firExp* mul_exp1_value, firExp* mul_exp2_value);
  private:
    firExp* exp1_;
    firExp* exp2_;
  };

  class firDB::firExpPrimOperation::firDiv : public firDB::firExpPrimOperation {
  public:
    firDiv(firExp* num, firExp* den) {
      num_ = num;
      den_ = den;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeDiv;
    }
    ~firDiv() {}

  public:
    // convert div prim to string
    std::string toString(std::string indent = "") {
      std::string s_num;
      if (num_ != NULL) {
        s_num = num_->toString();
      } else {
        fs_assert(0);
        s_num = "";
      }
      std::string s_den;
      if (den_ != NULL) {
        s_den = den_->toString();
      } else {
        fs_assert(0);
        s_den = "";
      }
      std::string str = indent + "div(" + s_num + ", " + s_den + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* num() { return num_; }
    firExp* den() { return den_; }

  private:
    void updateTypeData(firModule* module, firType* div_num_type, firType* div_den_type);
    void updateExpVal(firModule* module, firExp* div_num_value, firExp* div_den_value);
  private:
    firExp* num_;
    firExp* den_;
  };

  class firDB::firExpPrimOperation::firMod : public firDB::firExpPrimOperation {
  public:
    firMod(firExp* num, firExp* den) {
      num_ = num;
      den_ = den;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeMod;
    }
    ~firMod() {}

  public:
    // convert mod prim to string
    std::string toString(std::string indent = "") {
      std::string s_num;
      if (num_ != NULL) {
        s_num = num_->toString();
      } else {
        fs_assert(0);
        s_num = "";
      }
      std::string s_den;
      if (den_ != NULL) {
        s_den = den_->toString();
      } else {
        fs_assert(0);
        s_den = "";
      }
      std::string str = indent + "mod(" + s_num + ", " + s_den + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* num() { return num_; }
    firExp* den() { return den_; }

  private:
    void updateTypeData(firModule* module, firType* mod_num_type, firType* mod_den_type);
    void updateExpVal(firModule* module, firExp* mod_num_value, firExp* mod_den_value);
  private:
    firExp* num_;
    firExp* den_;
  };

  class firDB::firExpPrimOperation::firLt : public firDB::firExpPrimOperation {
  public:
    firLt(firExp* exp1, firExp* exp2) {
      exp1_ = exp1;
      exp2_ = exp2;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeLt;
    }
    ~firLt() {}

  public:
    // convert lt prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp1;
      if (exp1_ != NULL) {
        s_exp1 = exp1_->toString();
      } else {
        fs_assert(0);
        s_exp1 = "";
      }
      std::string s_exp2;
      if (exp2_ != NULL) {
        s_exp2 = exp2_->toString();
      } else {
        fs_assert(0);
        s_exp2 = "";
      }
      std::string str = indent + "lt(" + s_exp1 + ", " + s_exp2 + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp1() { return exp1_; }
    firExp* exp2() { return exp2_; }

  private:
    void updateTypeData(firModule* module, firType* lt_exp1_type, firType* lt_exp2_type);
    void updateExpVal(firModule* module, firExp* lt_exp1_value, firExp* lt_exp2_value);
  private:
    firExp* exp1_;
    firExp* exp2_;
  };

  class firDB::firExpPrimOperation::firLeq : public firDB::firExpPrimOperation {
  public:
    firLeq(firExp* exp1, firExp* exp2) {
      exp1_ = exp1;
      exp2_ = exp2;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeLeq;
    }
    ~firLeq() {}

  public:
    // convert leq prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp1;
      if (exp1_ != NULL) {
        s_exp1 = exp1_->toString();
      } else {
        fs_assert(0);
        s_exp1 = "";
      }
      std::string s_exp2;
      if (exp2_ != NULL) {
        s_exp2 = exp2_->toString();
      } else {
        fs_assert(0);
        s_exp2 = "";
      }
      std::string str = indent + "leq(" + s_exp1 + ", " + s_exp2 + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp1() { return exp1_; }
    firExp* exp2() { return exp2_; }

  private:
    void updateTypeData(firModule* module, firType* leq_exp1_type, firType* leq_exp2_type);
    void updateExpVal(firModule* module, firExp* leq_exp1_value, firExp* leq_exp2_value);
  private:
    firExp* exp1_;
    firExp* exp2_;
  };

  class firDB::firExpPrimOperation::firGt : public firDB::firExpPrimOperation {
  public:
    firGt(firExp* exp1, firExp* exp2) {
      exp1_ = exp1;
      exp2_ = exp2;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeGt;
    }
    ~firGt() {}

  public:
    // convert gt prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp1;
      if (exp1_ != NULL) {
        s_exp1 = exp1_->toString();
      } else {
        fs_assert(0);
        s_exp1 = "";
      }
      std::string s_exp2;
      if (exp2_ != NULL) {
        s_exp2 = exp2_->toString();
      } else {
        fs_assert(0);
        s_exp2 = "";
      }
      std::string str = indent + "gt(" + s_exp1 + ", " + s_exp2 + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp1() { return exp1_; }
    firExp* exp2() { return exp2_; }

  private:
    void updateTypeData(firModule* module, firType* gt_exp1_type, firType* gt_exp2_type);
    void updateExpVal(firModule* module, firExp* gt_exp1_value, firExp* gt_exp2_value);
  private:
    firExp* exp1_;
    firExp* exp2_;
  };

  class firDB::firExpPrimOperation::firGeq : public firDB::firExpPrimOperation {
  public:
    firGeq(firExp* exp1, firExp* exp2) {
      exp1_ = exp1;
      exp2_ = exp2;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeGeq;
    }
    ~firGeq() {}

  public:
    // convert geq prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp1;
      if (exp1_ != NULL) {
        s_exp1 = exp1_->toString();
      } else {
        fs_assert(0);
        s_exp1 = "";
      }
      std::string s_exp2;
      if (exp2_ != NULL) {
        s_exp2 = exp2_->toString();
      } else {
        fs_assert(0);
        s_exp2 = "";
      }
      std::string str = indent + "geq(" + s_exp1 + ", " + s_exp2 + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp1() { return exp1_; }
    firExp* exp2() { return exp2_; }

  private:
    void updateTypeData(firModule* module, firType* geq_exp1_type, firType* geq_exp2_type);
    void updateExpVal(firModule* module, firExp* geq_exp1_value, firExp* geq_exp2_value);
  private:
    firExp* exp1_;
    firExp* exp2_;
  };

  class firDB::firExpPrimOperation::firEq : public firDB::firExpPrimOperation {
  public:
    firEq(firExp* exp1, firExp* exp2) {
      exp1_ = exp1;
      exp2_ = exp2;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeEq;
    }
    ~firEq() {}

  public:
    // convert eq prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp1;
      if (exp1_ != NULL) {
        s_exp1 = exp1_->toString();
      } else {
        fs_assert(0);
        s_exp1 = "";
      }
      std::string s_exp2;
      if (exp2_ != NULL) {
        s_exp2 = exp2_->toString();
      } else {
        fs_assert(0);
        s_exp2 = "";
      }
      std::string str = indent + "eq(" + s_exp1 + ", " + s_exp2 + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp1() { return exp1_; }
    firExp* exp2() { return exp2_; }

  private:
    void updateTypeData(firModule* module, firType* eq_exp1_type, firType* eq_exp2_type);
    void updateExpVal(firModule* module, firExp* eq_exp1_value, firExp* eq_exp2_value);
  private:
    firExp* exp1_;
    firExp* exp2_;
  };

  class firDB::firExpPrimOperation::firNeq : public firDB::firExpPrimOperation {
  public:
    firNeq(firExp* exp1, firExp* exp2) {
      exp1_ = exp1;
      exp2_ = exp2;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeNeq;
    }
    ~firNeq() {}

  public:
    // convert neq prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp1;
      if (exp1_ != NULL) {
        s_exp1 = exp1_->toString();
      } else {
        fs_assert(0);
        s_exp1 = "";
      }
      std::string s_exp2;
      if (exp2_ != NULL) {
        s_exp2 = exp2_->toString();
      } else {
        fs_assert(0);
        s_exp2 = "";
      }
      std::string str = indent + "neq(" + s_exp1 + ", " + s_exp2 + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp1() { return exp1_; }
    firExp* exp2() { return exp2_; }

  private:
    void updateTypeData(firModule* module, firType* neq_exp1_type, firType* neq_exp2_type);
    void updateExpVal(firModule* module, firExp* neq_exp1_value, firExp* neq_exp2_value);
  private:
    firExp* exp1_;
    firExp* exp2_;
  };

  class firDB::firExpPrimOperation::firPad : public firDB::firExpPrimOperation {
  public:
    firPad(firExp* exp, unsigned int n) {
      exp_ = exp;
      n_ = n;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypePad;
    }
    ~firPad() {}

  public:
    // convert pad prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp;
      if (exp_ != NULL) {
        s_exp = exp_->toString();
      } else {
        fs_assert(0);
        s_exp = "";
      }
      std::string str = indent + "pad(" + s_exp + ", " + std::to_string(n_) + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp() { return exp_; }
    unsigned int n() { return n_; }

  private:
    void updateTypeData(firModule* module, firType* pad_exp_type, unsigned int pad_n);
    void updateExpVal(firModule* module, firExp* pad_exp_val, unsigned int pad_n);
  private:
    firExp* exp_;
    unsigned int n_;
  };

  class firDB::firExpPrimOperation::firAsUInt : public firDB::firExpPrimOperation {
  public:
    firAsUInt(firExp* exp) {
      exp_ = exp;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeAsUInt;
    }
    ~firAsUInt() {}

  public:
    // convert asUInt prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp;
      if (exp_ != NULL) {
        s_exp = exp_->toString();
      } else {
        fs_assert(0);
        s_exp = "";
      }
      std::string str = indent + "asUInt(" + s_exp + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp() { return exp_; }

  private:
    void updateTypeData(firModule* module, firType* asuint_exp_type);
    void updateExpVal(firModule* module, firExp* asuint_exp_val);
  private:
    firExp* exp_;
  };

  class firDB::firExpPrimOperation::firAsSInt : public firDB::firExpPrimOperation {
  public:
    firAsSInt(firExp* exp) {
      exp_ = exp;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeAsSInt;
    }
    ~firAsSInt() {}

  public:
    // convert asSInt prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp;
      if (exp_ != NULL) {
        s_exp = exp_->toString();
      } else {
        fs_assert(0);
        s_exp = "";
      }
      std::string str = indent + "asSInt(" + s_exp + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp() { return exp_; }

  private:
    void updateTypeData(firModule* module, firType* assint_exp_type);
    void updateExpVal(firModule* module, firExp* assint_exp_val);
  private:
    firExp* exp_;
  };

  class firDB::firExpPrimOperation::firAsClock : public firDB::firExpPrimOperation {
  public:
    firAsClock(firExp* exp) {
      exp_ = exp;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeAsClock;
    }
    ~firAsClock() {}

  public:
    // convert asClock prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp;
      if (exp_ != NULL) {
        s_exp = exp_->toString();
      } else {
        fs_assert(0);
        s_exp = "";
      }
      std::string str = indent + "asClock(" + s_exp + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp() { return exp_; }

  private:
    void updateTypeData(firModule* module, firType* asclock_exp_type);

  private:
    firExp* exp_;
  };

  class firDB::firExpPrimOperation::firAsFixed : public firDB::firExpPrimOperation {
  public:
    firAsFixed(firExp* exp, int binary_point) {
      exp_ = exp;
      binary_point_ = binary_point;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeAsFixed;
    }
    ~firAsFixed() {}

  public:
    // convert asFixed prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp;
      if (exp_ != NULL) {
        s_exp = exp_->toString();
      } else {
        fs_assert(0);
        s_exp = "";
      }
      std::string str = indent + "asFixedPoint(" + s_exp + ", " + std::to_string(binary_point_) + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp() { return exp_; }
    int binary_point() { return binary_point_; }

  private:
    void updateTypeData(firModule* module, firType* asfixed_exp_type, int asfixed_bp);

  private:
    firExp* exp_;
    int binary_point_;
  };

  class firDB::firExpPrimOperation::firAsAsyncReset : public firDB::firExpPrimOperation {
  public:
    firAsAsyncReset(firExp* exp) {
      exp_ = exp;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeAsAsyncReset;
    }
    ~firAsAsyncReset() {}

  public:
    // convert asAsyncReset prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp;
      if (exp_ != NULL) {
        s_exp = exp_->toString();
      } else {
        fs_assert(0);
        s_exp = "";
      }
      std::string str = indent + "asAsyncReset(" + s_exp + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp() { return exp_; }

  private:
    void updateTypeData(firModule* module, firType* asasyncreset_exp_type);

  private:
    firExp* exp_;
  };

  class firDB::firExpPrimOperation::firAsInterval : public firDB::firExpPrimOperation {
  public:
    firAsInterval(firExp* exp, int left, int right, unsigned int binary = 0) {
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeAsInterval;
      exp_ = exp;
      left_ = left;
      right_ = right;
      binary_ = binary;
    }
    ~firAsInterval() {}

  public:
    // convert asInterval prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp;
      if (exp_ != NULL) {
        s_exp = exp_->toString();
      } else {
        fs_assert(0);
        s_exp = "";
      }
      std::string str = indent + "asInterval(" + s_exp + ", " + std::to_string(left_) + ", " + std::to_string(right_) + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp() { return exp_; }
    int left() { return left_; }
    int right() { return right_; }
    unsigned int bit_width() { return binary_; }

  private:
    void updateTypeData(firModule* module, firType* asreset_exp_type, int left, int right, unsigned int binary);

  private:
    firExp* exp_;
    int left_;
    int right_;
    unsigned int binary_;
  };

  class firDB::firExpPrimOperation::firShl : public firDB::firExpPrimOperation {
  public:
    firShl(firExp* exp, unsigned int n) {
      exp_ = exp;
      n_ = n;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeShl;
    }
    ~firShl() {}

  public:
    // convert shl prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp;
      if (exp_ != NULL) {
        s_exp = exp_->toString();
      } else {
        fs_assert(0);
        s_exp = "";
      }
      std::string str = indent + "shl(" + s_exp + ", " + std::to_string(n_) + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp() { return exp_; }
    unsigned int n() { return n_; }

  private:
    void updateTypeData(firModule* module, firType* shl_exp_type, unsigned int shl_n);
    void updateExpVal(firModule* module, firExp* shl_exp_val, unsigned int shl_n);
  private:
    firExp* exp_;
    unsigned int n_;
  };

  class firDB::firExpPrimOperation::firShr : public firDB::firExpPrimOperation {
  public:
    firShr(firExp* exp, unsigned int n) {
      exp_ = exp;
      n_ = n;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeShr;
    }
    ~firShr() {}

  public:
    // convert shr prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp;
      if (exp_ != NULL) {
        s_exp = exp_->toString();
      } else {
        fs_assert(0);
        s_exp = "";
      }
      std::string str = indent + "shr(" + s_exp + ", " + std::to_string(n_) + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp() { return exp_; }
    unsigned int n() { return n_; }

  private:
    void updateTypeData(firModule* module, firType* shr_exp_type, unsigned int shr_n);
    void updateExpVal(firModule* module, firExp* shr_exp_val, unsigned int shr_n);
  private:
    firExp* exp_;
    unsigned int n_;
  };

  class firDB::firExpPrimOperation::firDshl : public firDB::firExpPrimOperation {
  public:
    firDshl(firExp* exp1, firExp* exp2) {
      exp1_ = exp1;
      exp2_ = exp2;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeDshl;
    }
    ~firDshl() {}

  public:
    // convert dshl prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp1;
      if (exp1_ != NULL) {
        s_exp1 = exp1_->toString();
      } else {
        fs_assert(0);
        s_exp1 = "";
      }
      std::string s_exp2;
      if (exp2_ != NULL) {
        s_exp2 = exp2_->toString();
      } else {
        fs_assert(0);
        s_exp2 = "";
      }
      std::string str = indent + "dshl(" + s_exp1 + ", " + s_exp2 + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp1() { return exp1_; }
    firExp* exp2() { return exp2_; }

  private:
    void updateTypeData(firModule* module, firType* dshl_exp1_type, firType* dshl_exp2_type);
    void updateExpVal(firModule* module, firExp* dshl_exp1_val, firExp* dshl_exp2_val);
  private:
    firExp* exp1_;
    firExp* exp2_;
  };

  class firDB::firExpPrimOperation::firDshr : public firDB::firExpPrimOperation {
  public:
    firDshr(firExp* exp1, firExp* exp2) {
      exp1_ = exp1;
      exp2_ = exp2;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeDshr;
    }
    ~firDshr() {}

  public:
    // convert dshr prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp1;
      if (exp1_ != NULL) {
        s_exp1 = exp1_->toString();
      } else {
        fs_assert(0);
        s_exp1 = "";
      }
      std::string s_exp2;
      if (exp2_ != NULL) {
        s_exp2 = exp2_->toString();
      } else {
        fs_assert(0);
        s_exp2 = "";
      }
      std::string str = indent + "dshr(" + s_exp1 + ", " + s_exp2 + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp1() { return exp1_; }
    firExp* exp2() { return exp2_; }

  private:
    void updateTypeData(firModule* module, firType* dshr_exp1_type, firType* dshr_exp2_type);
    void updateExpVal(firModule* module, firExp* dshr_exp1_val, firExp* dshr_exp2_val);
  private:
    firExp* exp1_;
    firExp* exp2_;
  };

  class firDB::firExpPrimOperation::firCvt : public firDB::firExpPrimOperation {
  public:
    firCvt(firExp* exp) {
      exp_ = exp;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeCvt;
    }
    ~firCvt() {}

  public:
    // convert cvt prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp;
      if (exp_ != NULL) {
        s_exp = exp_->toString();
      } else {
        fs_assert(0);
        s_exp = "";
      }
      std::string str = indent + "cvt(" + s_exp + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp() { return exp_; }

  private:
    void updateTypeData(firModule* module, firType* cvt_exp_type);
    void updateExpVal(firModule* module, firExp* cvt_exp_val);
  private:
    firExp* exp_;
  };

  class firDB::firExpPrimOperation::firNeg : public firDB::firExpPrimOperation {
  public:
    firNeg(firExp* exp) {
      exp_ = exp;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeNeg;
    }
    ~firNeg() {}

  public:
    // convert neg prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp;
      if (exp_ != NULL) {
        s_exp = exp_->toString();
      } else {
        fs_assert(0);
        s_exp = "";
      }
      std::string str = indent + "neg(" + s_exp + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp() { return exp_; }

  private:
    void updateTypeData(firModule* module, firType* neg_exp_type);
    void updateExpVal(firModule* module, firExp* neg_exp_val);
  private:
    firExp* exp_;
  };

  class firDB::firExpPrimOperation::firNot : public firDB::firExpPrimOperation {
  public:
    firNot(firExp* exp) {
      exp_ = exp;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeNot;
    }
    ~firNot() {}

  public:
    // convert not prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp;
      if (exp_ != NULL) {
        s_exp = exp_->toString();
      } else {
        fs_assert(0);
        s_exp = "";
      }
      std::string str = indent + "not(" + s_exp + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp() { return exp_; }

  private:
    void updateTypeData(firModule* module, firType* not_exp_type);
    void updateExpVal(firModule* module, firExp* not_exp_val);
  private:
    firExp* exp_;
  };

  class firDB::firExpPrimOperation::firAnd : public firDB::firExpPrimOperation {
  public:
    firAnd(firExp* exp1, firExp* exp2) {
      exp1_ = exp1;
      exp2_ = exp2;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeAnd;
    }
    ~firAnd() {}

  public:
    // convert and prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp1;
      if (exp1_ != NULL) {
        s_exp1 = exp1_->toString();
      } else {
        fs_assert(0);
        s_exp1 = "";
      }
      std::string s_exp2;
      if (exp2_ != NULL) {
        s_exp2 = exp2_->toString();
      } else {
        fs_assert(0);
        s_exp2 = "";
      }
      std::string str = indent + "and(" + s_exp1 + ", " + s_exp2 + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp1() { return exp1_; }
    firExp* exp2() { return exp2_; }

  private:
    void updateTypeData(firModule* module, firType* and_exp1_type, firType* and_exp2_type);
    void updateExpVal(firModule* module, firExp* and_exp1_val, firExp* and_exp2_val);
  private:
    firExp* exp1_;
    firExp* exp2_;
  };

  class firDB::firExpPrimOperation::firOr : public firDB::firExpPrimOperation {
  public:
    firOr(firExp* exp1, firExp* exp2) {
      exp1_ = exp1;
      exp2_ = exp2;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeOr;
    }
    ~firOr() {}

  public:
    // convert or prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp1;
      if (exp1_ != NULL) {
        s_exp1 = exp1_->toString();
      } else {
        fs_assert(0);
        s_exp1 = "";
      }
      std::string s_exp2;
      if (exp2_ != NULL) {
        s_exp2 = exp2_->toString();
      } else {
        fs_assert(0);
        s_exp2 = "";
      }
      std::string str = indent + "or(" + s_exp1 + ", " + s_exp2 + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp1() { return exp1_; }
    firExp* exp2() { return exp2_; }

  private:
    void updateTypeData(firModule* module, firType* or_exp1_type, firType* or_exp2_type);
    void updateExpVal(firModule* module, firExp* or_exp1_val, firExp* or_exp2_val);
  private:
    firExp* exp1_;
    firExp* exp2_;
  };

  class firDB::firExpPrimOperation::firXor : public firDB::firExpPrimOperation {
  public:
    firXor(firExp* exp1, firExp* exp2) {
      exp1_ = exp1;
      exp2_ = exp2;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeXor;
    }
    ~firXor() {}

  public:
    // convert xor prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp1;
      if (exp1_ != NULL) {
        s_exp1 = exp1_->toString();
      } else {
        fs_assert(0);
        s_exp1 = "";
      }
      std::string s_exp2;
      if (exp2_ != NULL) {
        s_exp2 = exp2_->toString();
      } else {
        fs_assert(0);
        s_exp2 = "";
      }
      std::string str = indent + "xor(" + s_exp1 + ", " + s_exp2 + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp1() { return exp1_; }
    firExp* exp2() { return exp2_; }

  private:
    void updateTypeData(firModule* module, firType* xor_exp1_type, firType* xor_exp2_type);
    void updateExpVal(firModule* module, firExp* xor_exp1_val, firExp* xor_exp2_val);
  private:
    firExp* exp1_;
    firExp* exp2_;
  };

  class firDB::firExpPrimOperation::firAndr : public firDB::firExpPrimOperation {
  public:
    firAndr(firExp* exp) {
      exp_ = exp;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeAndr;
    }
    ~firAndr() {}

  public:
    // convert andr prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp;
      if (exp_ != NULL) {
        s_exp = exp_->toString();
      } else {
        fs_assert(0);
        s_exp = "";
      }
      std::string str = indent + "andr(" + s_exp + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp() { return exp_; }

  private:
    void updateTypeData(firModule* module, firType* andr_exp_type);
    void updateExpVal(firModule* module, firExp* andr_exp_val);
  private:
    firExp* exp_;
  };

  class firDB::firExpPrimOperation::firOrr : public firDB::firExpPrimOperation {
  public:
    firOrr(firExp* exp) {
      exp_ = exp;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeOrr;
    }
    ~firOrr() {}

  public:
    // convert orr prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp;
      if (exp_ != NULL) {
        s_exp = exp_->toString();
      } else {
        fs_assert(0);
        s_exp = "";
      }
      std::string str = indent + "orr(" + s_exp + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp() { return exp_; }

  private:
    void updateTypeData(firModule* module, firType* orr_exp_type);
    void updateExpVal(firModule* module, firExp* orr_exp_val);
  private:
    firExp* exp_;
  };

  class firDB::firExpPrimOperation::firXorr : public firDB::firExpPrimOperation {
  public:
    firXorr(firExp* exp) {
      exp_ = exp;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeXorr;
    }
    ~firXorr() {}

  public:
    // convert xorr prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp;
      if (exp_ != NULL) {
        s_exp = exp_->toString();
      } else {
        fs_assert(0);
        s_exp = "";
      }
      std::string str = indent + "xorr(" + s_exp + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp() { return exp_; }

  private:
    void updateTypeData(firModule* module, firType* xorr_exp_type);
    void updateExpVal(firModule* module, firExp* xorr_exp_val);
  private:
    firExp* exp_;
  };

  class firDB::firExpPrimOperation::firCat : public firDB::firExpPrimOperation {
  public:
    firCat(firExp* exp1, firExp* exp2) {
      exp1_ = exp1;
      exp2_ = exp2;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeCat;
    }
    ~firCat() {}

  public:
    // convert cat prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp1;
      if (exp1_ != NULL) {
        s_exp1 = exp1_->toString();
      } else {
        fs_assert(0);
        s_exp1 = "";
      }
      std::string s_exp2;
      if (exp2_ != NULL) {
        s_exp2 = exp2_->toString();
      } else {
        fs_assert(0);
        s_exp2 = "";
      }
      std::string str = indent + "cat(" + s_exp1 + ", " + s_exp2 + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp1() { return exp1_; }
    firExp* exp2() { return exp2_; }

  private:
    void updateTypeData(firModule* module, firType* cat_exp1_type, firType* cat_exp2_type);
    void updateExpVal(firModule* module, firExp* cat_exp1_val, firExp* cat_exp2_val);
  private:
    firExp* exp1_;
    firExp* exp2_;
  };

  class firDB::firExpPrimOperation::firBits : public firDB::firExpPrimOperation {
  public:
    firBits(firExp* exp, unsigned int hi, unsigned int lo) {
      exp_ = exp;
      hi_ = hi;
      lo_ = lo;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeBits;
    }
    ~firBits() {}

  public:
    // convert bits prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp;
      if (exp_ != NULL) {
        s_exp = exp_->toString();
      } else {
        fs_assert(0);
        s_exp = "";
      }
      std::string str = indent + "bits(" + s_exp + ", " + std::to_string(hi_) + ", " + std::to_string(lo_) + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp() { return exp_; }
    unsigned int hi() { return hi_; }
    unsigned int lo() { return lo_; }

  private:
    void updateTypeData(firModule* module, firType* bits_exp_type, unsigned int bits_hi, unsigned int bits_lo);
    void updateExpVal(firModule* module, firExp* bits_exp_val, unsigned int bits_hi, unsigned int bits_lo);
  private:
    firExp* exp_;
    unsigned int hi_;
    unsigned int lo_;
  };

  class firDB::firExpPrimOperation::firHead : public firDB::firExpPrimOperation {
  public:
    firHead(firExp* exp, unsigned int n) {
      exp_ = exp;
      n_ = n;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeHead;
    }
    ~firHead() {}

  public:
    // convert head prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp;
      if (exp_ != NULL) {
        s_exp = exp_->toString();
      } else {
        fs_assert(0);
        s_exp = "";
      }
      std::string str = indent + "head(" + s_exp + ", " + std::to_string(n_) + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp() { return exp_; }
    unsigned int n() { return n_; }

  private:
    void updateTypeData(firModule* module, firType* head_exp_type, unsigned int head_n);
    void updateExpVal(firModule* module, firExp* head_exp_val, unsigned int head_n);
  private:
    firExp* exp_;
    unsigned int n_;
  };

  class firDB::firExpPrimOperation::firTail : public firDB::firExpPrimOperation {
  public:
    firTail(firExp* exp, unsigned int n) {
      exp_ = exp;
      n_ = n;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeTail;
    }
    ~firTail() {}

  public:
    // convert tail prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp;
      if (exp_ != NULL) {
        s_exp = exp_->toString();
      } else {
        fs_assert(0);
        s_exp = "";
      }
      std::string str = indent + "tail(" + s_exp + ", " + std::to_string(n_) + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp() { return exp_; }
    unsigned int n() { return n_; }

  private:
    void updateTypeData(firModule* module, firType* tail_exp_type, unsigned int tail_n);
    void updateExpVal(firModule* module, firExp* tail_exp_val, unsigned int tail_n);
  private:
    firExp* exp_;
    unsigned int n_;
  };

  class firDB::firExpPrimOperation::firIncp : public firDB::firExpPrimOperation {
  public:
    firIncp(firExp* exp, unsigned int n) {
      exp_ = exp;
      n_ = n;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeIncp;
    }
    ~firIncp() {}

  public:
    // convert incp prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp;
      if (exp_ != NULL) {
        s_exp = exp_->toString();
      } else {
        fs_assert(0);
        s_exp = "";
      }
      std::string str = indent + "incp(" + s_exp + ", " + std::to_string(n_) + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp() { return exp_; }
    unsigned int n() { return n_; }

  private:
    void updateTypeData(firModule* module, firType* incp_exp_type, unsigned int incp_n);

  private:
    firExp* exp_;
    unsigned int n_;
  };

  class firDB::firExpPrimOperation::firDecp : public firDB::firExpPrimOperation {
  public:
    firDecp(firExp* exp, unsigned int n) {
      exp_ = exp;
      n_ = n;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeDecp;
    }
    ~firDecp() {}

  public:
    // convert decp prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp;
      if (exp_ != NULL) {
        s_exp = exp_->toString();
      } else {
        fs_assert(0);
        s_exp = "";
      }
      std::string str = indent + "decp(" + s_exp + ", " + std::to_string(n_) + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp() { return exp_; }
    unsigned int n() { return n_; }

  private:
    void updateTypeData(firModule* module, firType* decp_exp_type, unsigned int decp_n);

  private:
    firExp* exp_;
    unsigned int n_;
  };

  class firDB::firExpPrimOperation::firSetp : public firDB::firExpPrimOperation {
  public:
    firSetp(firExp* exp, unsigned int n) {
      exp_ = exp;
      n_ = n;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeSetp;
    }
    ~firSetp() {}

  public:
    // convert setp prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp;
      if (exp_ != NULL) {
        s_exp = exp_->toString();
      } else {
        fs_assert(0);
        s_exp = "";
      }
      std::string str = indent + "setp(" + s_exp + ", " + std::to_string(n_) + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp() { return exp_; }
    unsigned int n() { return n_; }

  private:
    void updateTypeData(firModule* module, firType* setp_exp_type, unsigned int setp_n);

  private:
    firExp* exp_;
    unsigned int n_;
  };

  //operator only for interval type
  class firDB::firExpPrimOperation::firWrap : public firDB::firExpPrimOperation {
  public:
    firWrap(firExp* exp1, firExp* exp2) {
      exp1_ = exp1;
      exp2_ = exp2;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeWrap;
    }
    ~firWrap() {}

  public:
    // convert wrap prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp1;
      if (exp1_ != NULL) {
        s_exp1 = exp1_->toString();
      } else {
        fs_assert(0);
        s_exp1 = "";
      }
      std::string s_exp2;
      if (exp2_ != NULL) {
        s_exp2 = exp2_->toString();
      } else {
        fs_assert(0);
        s_exp2 = "";
      }
      std::string str = indent + "wrap(" + s_exp1 + ", " + s_exp2 + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp1() { return exp1_; }
    firExp* exp2() { return exp2_; }

  private:
    void updateTypeData(firModule* module, firType* wrap_exp1_type, firType* wrap_exp2_type);

  private:
    firExp* exp1_;
    firExp* exp2_;
  };

  //operator only for interval type
  class firDB::firExpPrimOperation::firClip : public firDB::firExpPrimOperation {
  public:
    firClip(firExp* exp1, firExp* exp2) {
      exp1_ = exp1;
      exp2_ = exp2;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeClip;
    }
    ~firClip() {}

  public:
    // convert clip prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp1;
      if (exp1_ != NULL) {
        s_exp1 = exp1_->toString();
      } else {
        fs_assert(0);
        s_exp1 = "";
      }
      std::string s_exp2;
      if (exp2_ != NULL) {
        s_exp2 = exp2_->toString();
      } else {
        fs_assert(0);
        s_exp2 = "";
      }
      std::string str = indent + "clip(" + s_exp1 + ", " + s_exp2 + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp1() { return exp1_; }
    firExp* exp2() { return exp2_; }

  private:
    void updateTypeData(firModule* module, firType* clip_exp1_type, firType* clip_exp2_type);

  private:
    firExp* exp1_;
    firExp* exp2_;
  };

  //operator only for interval type
  class firDB::firExpPrimOperation::firSquz : public firDB::firExpPrimOperation {
  public:
    firSquz(firExp* exp1, firExp* exp2) {
      exp1_ = exp1;
      exp2_ = exp2;
      exp_type_ = ExpressionType::kExpTypePrimOperation;
      operator_type_ = PrimOperationType::kOperatorTypeSquz;
    }
    ~firSquz() {}

  public:
    // convert squz prim to string
    std::string toString(std::string indent = "") {
      std::string s_exp1;
      if (exp1_ != NULL) {
        s_exp1 = exp1_->toString();
      } else {
        fs_assert(0);
        s_exp1 = "";
      }
      std::string s_exp2;
      if (exp2_ != NULL) {
        s_exp2 = exp2_->toString();
      } else {
        fs_assert(0);
        s_exp2 = "";
      }
      std::string str = indent + "squz(" + s_exp1 + ", " + s_exp2 + ")";
      return str;
    }
    bool isSameExpression(firExp* exp);
    firType* getTypeData(firModule* module, firItemConditional* domain = NULL);
    firType* inferDataType(firModule* module, firItemConditional* domain = NULL);
    firExp* getExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* inferExpVal(firModule* module, firItemConditional* domain = NULL);
    firExp* exp1() { return exp1_; }
    firExp* exp2() { return exp2_; }

  private:
    void updateTypeData(firModule* module, firType* squz_exp1_type, firType* squz_exp2_type);

  private:
    firExp* exp1_;
    firExp* exp2_;
  };
}

#endif
