//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#ifndef DB_FIRTYPE_H
#define DB_FIRTYPE_H

#include <sstream>
#include <float.h>
#include <limits.h>
#include "db/fir_db.h"

namespace firrtlsyn {

  class firDB::firType : public firDB::firLocObj {
  public:
    firType() {}
    virtual ~firType() {}
  public:
    virtual std::string toString(std::string indent = "") = 0;
    virtual void alignTypeDataWidth(firType* type);
    virtual void alignTypeDataWidth(firType* type1, firType* type2);
    virtual bool isCompatible(firType* type) {
      if (type == NULL) return false;
      return this->type() == type->type();
    }
    virtual bool isEqual(firType* type) {
      if (type == NULL) return false;
      return this->type() == type->type();
    }
    Type type() const { return type_; }
    bool isGroundType() const {
      return type() == Type::kTypeUInt ||
        type() == Type::kTypeSInt ||
        type() == Type::kTypeFixed ||
        type() == Type::kTypeInterval ||
        type() == Type::kTypeClock ||
        type() == Type::kTypeAsyncReset ||
        type() == Type::kTypeReset ||
        type() == Type::kTypeAnalog;
    }
    bool isMemoryType() const {
      return type() == Type::kTypeUInt ||
        type() == Type::kTypeSInt ||
        type() == Type::kTypeFixed ||
        type() == Type::kTypeInterval;
    }
    bool isPostType() const {
      return type() == Type::kTypeUInt ||
        type() == Type::kTypeSInt ||
        type() == Type::kTypeClock ||
        type() == Type::kTypeAsyncReset ||
        type() == Type::kTypeReset ||
        type() == Type::kTypeAnalog;
    }
    bool isVectorType() const {
      return type() == Type::kTypeVector;
    }
    bool isBundleType() const {
      return type() == Type::kTypeBundle;
    }
    bool isUIntType() const {
      return type() == Type::kTypeUInt;
    }
    bool isSIntType() const {
      return type() == Type::kTypeSInt;
    }
    bool isFixedType() const {
      return type() == Type::kTypeFixed;
    }
    bool isIntervalType() const {
      return type() == Type::kTypeInterval;
    }
    bool isClockType() const {
      return type() == Type::kTypeClock;
    }
    bool isAsyncResetType() const {
      return type() == Type::kTypeAsyncReset;
    }
    bool isResetType() const {
      return type() == Type::kTypeReset;
    }
    bool isAnalogType() const {
      return type() == Type::kTypeAnalog;
    }
  protected:
    Type type_;
  };

  class firDB::firField : public firDB::firLocObj{
  public:
    firField(const char* field_id, firType* type_data, bool flip) {
      field_id_ = field_id;
      type_data_ = type_data;
      flip_ = flip;
    }
    ~firField() {}
    std::string toString(std::string indent = "") {
      std::string str = flip_ ? "flip " : "";
      str += field_id_ + " : " + type_data_->toString();
      return str;
    }
    std::string field_id() const { return field_id_; }
    firType* type_data() { return type_data_; }
    bool flip() const { return flip_; }
  private:
    std::string field_id_;
    firType* type_data_;
    bool flip_;
  };

  class firDB::firTypeUInt : public firDB::firType {
  public:
    firTypeUInt(int width) {
      type_ = Type::kTypeUInt;
      width_ = width;
    }
    ~firTypeUInt() {}
  public:
    // convert UInt type to string format
    std::string toString(std::string indent = "") {
      std::string s_width;
      if (valid_width()) {
        s_width = "<" + std::to_string(width_) + ">";
      }
      std::string str = "UInt" + s_width;   // indent is not used on type
      return str;
    }
    void reset() {
      width_ = -1;
    }
    void alignTypeDataWidth(firType* type);
    void alignTypeDataWidth(firType* type1, firType* type2);
    bool isCompatible(firType* type);
    // Before getting width, !!must!! decide whether width valid by valid_width() first
    bool valid_width() const { return width_ > 0; }
    int width() const {
      fs_assert(valid_width());
      return width_;
    }
    int invalid_width() const {
      fs_assert(!valid_width());
      return width_;
    }
    void set_width(int width) { width_ = width; }
  private:
    int width_;
  };

  class firDB::firTypeSInt : public firDB::firType {
  public:
    firTypeSInt(int width) {
      type_ = Type::kTypeSInt;
      width_ = width;
    }
    ~firTypeSInt() {}
  public:
    // convert SInt type to string format
    std::string toString(std::string indent = "") {
      std::string s_width;
      if (valid_width()) {
        s_width = "<" + std::to_string(width_) + ">";
      }
      std::string str = "SInt" + s_width;   // indent is not used on type
      return str;
    }
    void reset() {
      width_ = -1;
    }
    void alignTypeDataWidth(firType* type);
    void alignTypeDataWidth(firType* type1, firType* type2);
    // Before getting width, !!must!! decide whether width valid by valid_width() first
    bool valid_width() const { return width_ > 0; }
    int width() const {
      fs_assert(valid_width());
      return width_;
    }
    int invalid_width() const {
      fs_assert(!valid_width());
      return width_;
    }
    void set_width(int width) { width_ = width; }
  private:
    int width_;
  };

  class firDB::firTypeFixed : public firDB::firType {
  public:
    firTypeFixed() {
      type_ = Type::kTypeFixed;
      valid_width_ = false;
      valid_binary_ = false;
      width_ = INT_MAX;
      binary_point_ = INT_MAX;
    }
    ~firTypeFixed() {}
  public:
    // convert Fixed type to string format
    std::string toString(std::string indent = "") {
      std::string s_width, s_bp;
      if (valid_binary()) {
        s_bp = "<<" + std::to_string(binary_point_) + ">>";
      }
      if (valid_width()) {
        s_width = "<" + std::to_string(width_) + ">";
      }
      std::string str = "Fixed" + s_width + s_bp;   // indent is not used on type
      return str;
    }
    void alignTypeDataWidth(firType* type);
    void alignTypeDataWidth(firType* type1, firType* type2);
    void reset() {
      valid_width_ = false;
      valid_binary_ = false;
      width_ = INT_MAX;
      binary_point_ = INT_MAX;
    }
    // Before getting integer value or binary value, 
    // !!must!! decide whether valid by valid_width()/valid_binary() first
    bool valid_width() const { return valid_width_; }
    bool valid_binary() const { return valid_binary_; }
    int width() const {
      fs_assert(valid_width());
      return width_;
    }
    int invalid_width() const {
      fs_assert(!valid_width());
      return width_;
    }
    void set_width(int width) {
      valid_width_ = true;
      width_ = width; 
    }
    int binary_point() const {
      fs_assert(valid_binary());
      return binary_point_;
    }
    void set_binary_point(int binary_point) {
      valid_binary_ = true;
      binary_point_ = binary_point;
    }
  private:
    bool valid_width_;
    bool valid_binary_;
    int width_;
    int binary_point_;
  };

  class firDB::firTypeInterval : public firDB::firType {
  public:
    firTypeInterval() {
      type_ = Type::kTypeInterval;
      valid_lower_value_ = false;
      valid_upper_value_ = false;
      valid_binary_ = false;
      lower_bound_ = ' ';
      upper_bound_ = ' ';
      binary_ = INT_MAX;
      lower_value_ = DBL_MAX;
      upper_value_ = DBL_MAX;
    }
    ~firTypeInterval() {}
  public:
    // convert Interval type to string format
    std::string toString(std::string indent = "") {
      std::string str = "Interval";
      if (lower_bound_ != ' ' && upper_bound_ != ' ') {
        str += lower_bound_;
        if (valid_lower_value_) {
          str += std::to_string(lower_value_);
        } else {
          str += "?";
        }
        str += ", ";
        if (valid_upper_value_) {
          str += std::to_string(upper_value_);
        } else {
          str += "?";
        }
        str += upper_bound_;
      }
      if (valid_binary_) {
        str += "." + std::to_string(binary_);
      }
      return str;
    }
    void alignTypeDataWidth(firType* type);
    void alignTypeDataWidth(firType* type1, firType* type2);
    void reset() {
      valid_lower_value_ = false;
      valid_upper_value_ = false;
      valid_binary_ = false;
      lower_bound_ = ' ';
      upper_bound_ = ' ';
      binary_ = UINT_MAX;
      lower_value_ = DBL_MAX;
      upper_value_ = DBL_MAX;
    }
    void set_value(int binary);
    void set_value(char lower_bound, double lower_value, double upper_value, char upper_bound);
    void set_value(char lower_bound, char lower_value, double upper_value, char upper_bound);
    void set_value(char lower_bound, double lower_value, char upper_value, char upper_bound);
    void set_value(char lower_bound, char lower_value, char upper_value, char upper_bound);
    void set_value(char lower_bound, double lower_value, double upper_value, char upper_bound, int binary);
    void set_value(char lower_bound, char lower_value, double upper_value, char upper_bound, int binary);
    void set_value(char lower_bound, double lower_value, char upper_value, char upper_bound, int binary);
    void set_value(char lower_bound, char lower_value, char upper_value, char upper_bound, int binary);
    void set_binary_point(int binary_point);
    void set_lower_bound(char lower_bound);
    void set_lower_value(double lower_value);
    void set_upper_value(double upper_value);
    void set_upper_bound(char upper_bound);
    // Before getting lower/upper value or binary, 
    // !!must!! decide whether valid by valid_lower/upper/binary() first
    bool valid_lower_value() const { return valid_lower_value_; }
    bool valid_upper_value() const { return valid_upper_value_; }
    bool valid_binary() const { return valid_binary_; }
    char lower_bound() const {
      //fs_assert(valid_lower_value());
      return lower_bound_;
    }
    char upper_bound() const {
      //fs_assert(valid_upper_value());
      return upper_bound_;
    }
    double lower_value() const {
      fs_assert(valid_lower_value());
      return lower_value_;
    }
    double upper_value() const {
      fs_assert(valid_upper_value());
      return upper_value_;
    }
    int binary() const {
      fs_assert(valid_binary());
      return binary_;
    }
    bool trimInterval();
    bool getWidth(int& bitWidth);
  private:
    bool valid_lower_value_;
    bool valid_upper_value_;
    bool valid_binary_;
    char lower_bound_;
    char upper_bound_;
    int binary_;
    double lower_value_;
    double upper_value_;
  };

  class firDB::firTypeClock : public firDB::firType {
  public:
    firTypeClock() {
      type_ = Type::kTypeClock;
    }
    ~firTypeClock() {}
  public:
    // convert Clock type to string format
    std::string toString(std::string indent = "") {
      std::string str = "Clock";    // indent is not used on type
      return str;
    }
    bool isEqual(firType* type) { return type->isClockType(); }
  };

  class firDB::firTypeAsyncReset : public firDB::firType {
  public:
    firTypeAsyncReset() {
      type_ = Type::kTypeAsyncReset;
    }
    ~firTypeAsyncReset() {}
  public:
    // convert AsyncReset to string format
    std::string toString(std::string indent = "") {
      std::string str = "AsyncReset";    // indent is not used on type
      return str;
    }
    bool isEqual(firType* type) { return type->isAsyncResetType(); }
    bool isCompatible(firType* type);
  };

  class firDB::firTypeReset : public firDB::firType {
  public:
    firTypeReset() {
      type_ = Type::kTypeReset;
    }
    ~firTypeReset() {}
  public:
    // convert reset type to string
    std::string toString(std::string indent = "") {
      std::string str = "Reset";    // indent is not used on type
      return str;
    }
    bool isCompatible(firType* type);
  };

  class firDB::firTypeAnalog : public firDB::firType {
  public:
    firTypeAnalog(int width) {
      type_ = Type::kTypeAnalog;
      width_ = width;
    }
    ~firTypeAnalog() {}
  public:
    // convert analog type to string
    std::string toString(std::string indent = "") {
      std::string s_width;
      if (valid_width()) {
        s_width = "<" + std::to_string(width_) + ">";
      }
      std::string str = "Analog" + s_width;     // indent is not used on type
      return str;
    }
    void alignTypeDataWidth(firType* type);
    void alignTypeDataWidth(firType* type1, firType* type2);
    void reset() {
      width_ = -1;
    }
    // Before getting width, !!must!! decide whether width valid by valid_width() first
    bool valid_width() const { return width_ > 0; }
    int width() const {
      fs_assert(valid_width());
      return width_;
    }
    int invalid_width() const {
      fs_assert(!valid_width());
      return width_;
    }
    void set_width(int width) { width_ = width; }
  private:
    int width_;
  };

  class firDB::firTypeVector : public firDB::firType {
  public:
    firTypeVector(unsigned int depth) {
      type_ = Type::kTypeVector;
      type_data_ = NULL;
      depth_ = depth;
    }
    ~firTypeVector() {}
  public:
    // convert vector type to string
    std::string toString(std::string indent = "") {
      std::string s_type;
      if (type_data_ != NULL) {
        s_type = type_data_->toString();
      } else {
        fs_assert(0);
        s_type = "";
      }
      std::string str = s_type + "[" + std::to_string(depth_) + "]";  // indent is not used here
      return str;
    }
    void alignTypeDataWidth(firType* type);
    void alignTypeDataWidth(firType* type1, firType* type2);
    bool isEqual(firType* type);
    bool isCompatible(firType* type);
    firType* type_data() { return type_data_; }
    unsigned int depth() const { return depth_; }
    void set_type_data(firType* type_data) { type_data_ = type_data; }
  private:
    // example: UInt<3>[10][20]
    //          this.data_ = Vector(UInt<3>[10]),
    //              .depth_ = 20,
    //              .type_ = kTypeVector
    //          Vector.data_ = UInt(UInt<3>),
    //                .depth_ = 10,
    //                .type_ = kTypeVector
    //          UInt.width_ = 3,
    //              .type_ = kTypeUInt
    firType* type_data_;
    unsigned int depth_;
  };

  class firDB::firTypeBundle : public firDB::firType {
  public:
    firTypeBundle() {
      type_ = Type::kTypeBundle;
    }
    ~firTypeBundle() {
      type_datas_.clear();
      id_typedata_map_.clear();
    }
  public:
    // convert bundle type to string
    std::string toString(std::string indent = "") {
      std::string str = "{";
      if (type_datas_.size() > 0) {
        str += type_datas_[0]->toString();
      }
      for (size_t i = 1; i < type_datas_.size(); i++) {
        str += ", " + type_datas_[i]->toString();
      }
      str += "}";  // indent is not used on type
      return str;
    }
    void alignTypeDataWidth(firType* type);
    void alignTypeDataWidth(firType* type1, firType* type2);
    bool isEqual(firType* type);
    bool isCompatible(firType* type);
    std::vector<firField*>& type_datas() { return type_datas_; }
    firField* findFieldById(const std::string& id) {
      auto iter = id_typedata_map_.find(id);
      if (iter != id_typedata_map_.end()) {
        return iter->second;
      } else {
        return NULL;
      }
    }
    firType* findTypeDataById(const std::string& id) {
      firField* field = findFieldById(id);
      if (field != NULL) {
        return field->type_data();
      } else {
        return NULL;
      }
    }
    void addTypeData(firField* field) {
      fs_assert(findFieldById(field->field_id()) == NULL);
      id_typedata_map_.insert(std::make_pair(field->field_id(), field));
      type_datas_.push_back(field);
    }
  private:
    std::vector<firField*> type_datas_;
    std::map<std::string, firField*> id_typedata_map_;
  };


}

#endif