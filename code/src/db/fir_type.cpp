//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#include <algorithm>
#include <cmath>

#include "db/fir_type.h"
#include "utility/big_int.h"

namespace firrtlsyn {
  void firDB::firType::alignTypeDataWidth(firType* type) {
    fs_assert(this->isEqual(type));
    return;
  }
  void firDB::firType::alignTypeDataWidth(firType* type1, firType* type2) {
    fs_assert(this->isEqual(type1));
    fs_assert(this->isEqual(type2));
    return;
  }
  void firDB::firTypeUInt::alignTypeDataWidth(firType* type) {
    fs_assert(this->isEqual(type));
    firTypeUInt* utype = dynamic_cast<firTypeUInt*>(type);
    if (utype->valid_width()) {
      this->set_width(utype->width());
    }
    return;
  }
  void firDB::firTypeUInt::alignTypeDataWidth(firType* type1, firType* type2) {
    fs_assert(this->isEqual(type1));
    fs_assert(this->isEqual(type2));
    firTypeUInt* utype1 = dynamic_cast<firTypeUInt*>(type1);
    firTypeUInt* utype2 = dynamic_cast<firTypeUInt*>(type2);
    this->reset();
    if (utype1->valid_width() && utype2->valid_width()) {
      int width = std::max(utype1->width(), utype2->width());
      this->set_width(width);
    } else if (utype1->valid_width() && !utype2->valid_width()) {
      int width = utype1->width();
      this->set_width(width);
    } else if (!utype1->valid_width() && utype2->valid_width()) {
      int width = utype2->width();
      this->set_width(width);
    }
    return;
  }
  void firDB::firTypeSInt::alignTypeDataWidth(firType* type) {
    fs_assert(this->isEqual(type));
    firTypeSInt* stype = dynamic_cast<firTypeSInt*>(type);
    if (stype->valid_width()) {
      this->set_width(stype->width());
    }
    return;
  }
  void firDB::firTypeSInt::alignTypeDataWidth(firType* type1, firType* type2) {
    fs_assert(this->isEqual(type1));
    fs_assert(this->isEqual(type2));
    firTypeSInt* stype1 = dynamic_cast<firTypeSInt*>(type1);
    firTypeSInt* stype2 = dynamic_cast<firTypeSInt*>(type2);
    this->reset();
    if (stype1->valid_width() && stype2->valid_width()) {
      int width = std::max(stype1->width(), stype2->width());
      this->set_width(width);
    } else if (stype1->valid_width() && !stype2->valid_width()) {
      int width = stype1->width();
      this->set_width(width);
    } else if (!stype1->valid_width() && stype2->valid_width()) {
      int width = stype2->width();
      this->set_width(width);
    }
    return;
  }
  void firDB::firTypeFixed::alignTypeDataWidth(firType* type) {
    fs_assert(this->isEqual(type));
    firTypeFixed* ftype = dynamic_cast<firTypeFixed*>(type);
    if (ftype->valid_width()) {
      this->set_width(ftype->width());
    }
    if (ftype->valid_binary()) {
      this->set_binary_point(ftype->binary_point());
    }
    return;
  }
  void firDB::firTypeFixed::alignTypeDataWidth(firType* type1, firType* type2) {
    fs_assert(this->isEqual(type1));
    fs_assert(this->isEqual(type2));
    firTypeFixed* ftype1 = dynamic_cast<firTypeFixed*>(type1);
    firTypeFixed* ftype2 = dynamic_cast<firTypeFixed*>(type2);
    this->reset();
    int bp1 = 0;
    int bp2 = 0;
    if (ftype1->valid_binary()) {
      bp1 = ftype1->binary_point();
    }
    if (ftype2->valid_binary()) {
      bp2 = ftype2->binary_point();
    }
    int w1 = 0;
    int w2 = 0;
    if (ftype1->valid_width()) {
      w1 = ftype1->width();
    }
    if (ftype2->valid_width()) {
      w2 = ftype2->width();
    }
    int binary_point = std::max(bp1, bp2);
    int width = binary_point + std::max((w1 - bp1), (w2 - bp2));
    this->set_binary_point(binary_point);
    if (width > 0) {
      this->set_width(width);
    }
    return;
  }
  void firDB::firTypeInterval::alignTypeDataWidth(firType* type) {
    fs_assert(this->isEqual(type));
    firTypeInterval* itype = dynamic_cast<firTypeInterval*>(type);
    if (itype->valid_lower_value() && itype->valid_upper_value()) {
      this->set_value(itype->lower_bound(), itype->lower_value(), itype->upper_value(), itype->upper_bound());
    }
    if (itype->valid_binary()) {
      this->set_value(itype->binary());
    }
    return;
  }
  void firDB::firTypeInterval::alignTypeDataWidth(firType* type1, firType* type2) {
    fs_assert(this->isEqual(type1));
    fs_assert(this->isEqual(type2));
    firTypeInterval* itype1 = dynamic_cast<firTypeInterval*>(type1);
    firTypeInterval* itype2 = dynamic_cast<firTypeInterval*>(type2);
    this->reset();
    bool valid_value1 = itype1->trimInterval();
    bool valid_value2 = itype2->trimInterval();
    if (valid_value1 && valid_value2) {
      double lower = std::min(itype1->lower_value(), itype2->lower_value());
      double upper = std::max(itype1->upper_value(), itype2->upper_value());
      int binary = std::max(itype1->binary(), itype2->binary());
      this->set_value('[', lower, upper, ']', binary);
    } else if (valid_value1 && !valid_value2) {
      double lower = itype1->lower_value();
      double upper = itype1->upper_value();
      int binary = itype1->binary();
      this->set_value('[', lower, upper, ']', binary);
    } else if (!valid_value1 && valid_value2) {
      double lower = itype2->lower_value();
      double upper = itype2->upper_value();
      int binary = itype2->binary();
      this->set_value('[', lower, upper, ']', binary);
    }
    return;
  }
  void firDB::firTypeAnalog::alignTypeDataWidth(firType* type) {
    fs_assert(this->isEqual(type));
    firTypeAnalog* atype = dynamic_cast<firTypeAnalog*>(type);
    if (atype->valid_width()) {
      this->set_width(atype->width());
    }
    return;
  }
  void firDB::firTypeAnalog::alignTypeDataWidth(firType* type1, firType* type2) {
    fs_assert(this->isEqual(type1));
    fs_assert(this->isEqual(type2));
    firTypeAnalog* atype1 = dynamic_cast<firTypeAnalog*>(type1);
    firTypeAnalog* atype2 = dynamic_cast<firTypeAnalog*>(type2);
    this->reset();
    if (atype1->valid_width() && atype2->valid_width()) {
      int width = std::max(atype1->width(), atype2->width());
      this->set_width(width);
    } else if (atype1->valid_width() && !atype2->valid_width()) {
      int width = atype1->width();
      this->set_width(width);
    } else if (!atype1->valid_width() && atype2->valid_width()) {
      int width = atype2->width();
      this->set_width(width);
    }
    return;
  }
  void firDB::firTypeVector::alignTypeDataWidth(firType* type) {
    fs_assert(this->isEqual(type));
    firTypeVector* vtype = dynamic_cast<firTypeVector*>(type);
    this->type_data()->alignTypeDataWidth(vtype->type_data());
    return;
  }
  void firDB::firTypeVector::alignTypeDataWidth(firType* type1, firType* type2) {
    fs_assert(this->isEqual(type1));
    fs_assert(this->isEqual(type2));
    firTypeVector* vtype1 = dynamic_cast<firTypeVector*>(type1);
    firTypeVector* vtype2 = dynamic_cast<firTypeVector*>(type2);
    this->type_data()->alignTypeDataWidth(vtype1->type_data(), vtype2->type_data());
    return;
  }
  void firDB::firTypeBundle::alignTypeDataWidth(firType* type) {
    fs_assert(this->isEqual(type));
    firTypeBundle* btype = dynamic_cast<firTypeBundle*>(type);
    std::vector<firDB::firField*>& btype_type_datas = btype->type_datas();
    for (size_t i = 0; i < btype_type_datas.size(); i++) {
      firType* this_type_data = this->type_datas()[i]->type_data();
      firType* btype_type_data = btype_type_datas[i]->type_data();
      this_type_data->alignTypeDataWidth(btype_type_data);
    }
    return;
  }
  void firDB::firTypeBundle::alignTypeDataWidth(firType* type1, firType* type2) {
    fs_assert(this->isEqual(type1));
    fs_assert(this->isEqual(type2));
    firTypeBundle* btype1 = dynamic_cast<firTypeBundle*>(type1);
    firTypeBundle* btype2 = dynamic_cast<firTypeBundle*>(type2);
    std::vector<firDB::firField*>& btype1_type_datas = btype1->type_datas();
    std::vector<firDB::firField*>& btype2_type_datas = btype2->type_datas();
    for (size_t i = 0; i < btype1_type_datas.size(); i++) {
      firType* this_type_data = this->type_datas()[i]->type_data();
      firType* btype1_type_data = btype1_type_datas[i]->type_data();
      firType* btype2_type_data = btype2_type_datas[i]->type_data();
      this_type_data->alignTypeDataWidth(btype1_type_data, btype2_type_data);
    }
    return;
  }
  void firDB::firTypeInterval::set_value(int binary) {
    valid_binary_ = true;
    binary_ = binary;
  }
  void firDB::firTypeInterval::set_value(char lower_bound, double lower_value, double upper_value, char upper_bound) {
    lower_bound_ = lower_bound;
    valid_lower_value_ = true;
    lower_value_ = lower_value;
    valid_upper_value_ = true;
    upper_value_ = upper_value;
    upper_bound_ = upper_bound;
  }
  void firDB::firTypeInterval::set_value(char lower_bound, char lower_value, double upper_value, char upper_bound) {
    lower_bound_ = lower_bound;
    fs_assert(lower_value == '?');
    valid_upper_value_ = true;
    upper_value_ = upper_value;
    upper_bound_ = upper_bound;
  }
  void firDB::firTypeInterval::set_value(char lower_bound, double lower_value, char upper_value, char upper_bound) {
    lower_bound_ = lower_bound;
    valid_lower_value_ = true;
    lower_value_ = lower_value;
    fs_assert(upper_value == '?');
    upper_bound_ = upper_bound;
  }
  void firDB::firTypeInterval::set_value(char lower_bound, char lower_value, char upper_value, char upper_bound) {
    lower_bound_ = lower_bound;
    fs_assert(lower_value == '?');
    fs_assert(upper_value == '?');
    upper_bound_ = upper_bound;
  }
  void firDB::firTypeInterval::set_value(char lower_bound, double lower_value, double upper_value, char upper_bound, int binary) {
    lower_bound_ = lower_bound;
    valid_lower_value_ = true;
    lower_value_ = lower_value;
    valid_upper_value_ = true;
    upper_value_ = upper_value;
    upper_bound_ = upper_bound;
    valid_binary_ = true;
    binary_ = binary;
  }
  void firDB::firTypeInterval::set_value(char lower_bound, char lower_value, double upper_value, char upper_bound, int binary) {
    lower_bound_ = lower_bound;
    fs_assert(lower_value == '?');
    valid_upper_value_ = true;
    upper_value_ = upper_value;
    upper_bound_ = upper_bound;
    valid_binary_ = true;
    binary_ = binary;
  }
  void firDB::firTypeInterval::set_value(char lower_bound, double lower_value, char upper_value, char upper_bound, int binary) {
    lower_bound_ = lower_bound;
    valid_lower_value_ = true;
    lower_value_ = lower_value;
    fs_assert(upper_value == '?');
    upper_bound_ = upper_bound;
    valid_binary_ = true;
    binary_ = binary;
  }
  void firDB::firTypeInterval::set_value(char lower_bound, char lower_value, char upper_value, char upper_bound, int binary) {
    lower_bound_ = lower_bound;
    fs_assert(lower_value == '?');
    fs_assert(upper_value == '?');
    upper_bound_ = upper_bound;
    valid_binary_ = true;
    binary_ = binary;
  }
  void firDB::firTypeInterval::set_binary_point(int binary_point) {
    valid_binary_ = true;
    binary_ = binary_point;
  }
  void firDB::firTypeInterval::set_lower_bound(char lower_bound) {
    lower_bound_ = lower_bound;
  }
  void firDB::firTypeInterval::set_lower_value(double lower_value) {
    valid_lower_value_ = true;
    lower_value_ = lower_value;
  }
  void firDB::firTypeInterval::set_upper_value(double upper_value) {
    valid_upper_value_ = true;
    upper_value_ = upper_value;
  }
  void firDB::firTypeInterval::set_upper_bound(char upper_bound) {
    upper_bound_ = upper_bound;
  }
  bool firDB::firTypeInterval::trimInterval() {
    if (valid_binary_) {
      if (valid_lower_value_ && valid_upper_value_) {
        double precision = 0;
        double min = 0;
        double max = 0;
        precision = binary_ >= 0 ? (static_cast<double>(1.0 / (1 << binary_))) : 1 << (-binary_);
        if (precision == 0) {
          fs_assert(0);
          return false;
        }
        if (lower_bound_ == '(') {
          if (fmod(lower_value_, precision) == 0) {
            min = lower_value_ + precision;
          } else {
            min = ceil(lower_value_ / precision) * precision;
          }
        } else if (lower_bound_ == '[') {
          if (fmod(lower_value_, precision) == 0) {
            min = lower_value_;
          } else {
            min = ceil(lower_value_ / precision) * precision;
          }
        } else {
          return false;
        }
        if (upper_bound_ == ')') {
          if (fmod(upper_value_, precision) == 0) {
            max = upper_value_ - precision;
          } else {
            max = floor(upper_value_ / precision) * precision;
          }
        } else if (upper_bound_ == ']') {
          if (fmod(upper_value_, precision) == 0) {
            max = upper_value_;
          } else {
            max = floor(upper_value_ / precision) * precision;
          }
        } else {
          return false;
        }
        set_value('[', min, max, ']', binary_);
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
  bool firDB::firTypeInterval::getWidth(int& bitWidth) {
    if (!trimInterval()) {
      return false;
    }
    double min_adjust = lower_value_ * pow(2, binary_);
    double max_adjust = upper_value_ * pow(2, binary_);
    if (fmod(min_adjust, 1.0) != 0 || fmod(max_adjust, 1.0) != 0) {
      fs_assert(0);
      return false;
    }
    BigInt min_adjust_binary_form((long long)min_adjust);
    BigInt max_adjust_binary_form((long long)max_adjust);
    bitWidth = std::max(min_adjust_binary_form.getMinBinaryWidth(), max_adjust_binary_form.getMinBinaryWidth()) + 1;
    return true;
  }
  bool firDB::firTypeUInt::isCompatible(firType* type) {
    if (type == NULL) return false;
    if (type->isUIntType()) return true;
    else if (type->isResetType()) {
      if (this->valid_width()) {
        int width = this->width();
        if (width == 1) return true;
      }
    } else if (type->isAsyncResetType()) {
      if (this->valid_width()) {
        int width = this->width();
        if (width == 1) return true;
      }
    }
    return false;
  }
  bool firDB::firTypeReset::isCompatible(firType* type) {
    if (type == NULL) return false;
    if (type->isResetType()) return true;
    else if (type->isUIntType()) {
      firTypeUInt* utype = dynamic_cast<firTypeUInt*>(type);
      if (utype->valid_width()) {
        int width = utype->width();
        if (width == 1) return true;
      }
    } else if (type->isAsyncResetType()) {
      return true;
    }
    return false;
  }
  bool firDB::firTypeAsyncReset::isCompatible(firType* type) {
    if (type == NULL) return false;
    if (type->isAsyncResetType()) return true;
    else if (type->isUIntType()) {
      firTypeUInt* utype = dynamic_cast<firTypeUInt*>(type);
      if (utype->valid_width()) {
        int width = utype->width();
        if (width == 1) return true;
      }
    } else if (type->isResetType()) {
      return true;
    }
    return false;
  }
  bool firDB::firTypeVector::isCompatible(firType* type) {
    if (type == NULL) return false;
    if (!type->isVectorType()) {
      return false;
    }
    firTypeVector* vtype = dynamic_cast<firTypeVector*>(type);
    if (this->depth() != vtype->depth()) {
      return false;
    }
    return this->type_data()->isCompatible(vtype->type_data());
  }
  bool firDB::firTypeBundle::isCompatible(firType* type) {
    if (type == NULL) return false;
    if (!type->isBundleType()) {
      return false;
    }
    firTypeBundle* btype = dynamic_cast<firTypeBundle*>(type);
    size_t size = this->type_datas().size();
    size_t bsize = btype->type_datas().size();
    if (size != bsize) {
      return false;
    }
    for (size_t i = 0; i < size; i++) {
      firDB::firField* type_data1 = this->type_datas().at(i);
      firDB::firField* type_data2 = btype->type_datas().at(i);
      if (!(type_data1->field_id() == type_data2->field_id())) {
        return false;
      }
      if (!(type_data1->flip() == type_data2->flip())) {
        return false;
      }
      if (!type_data1->type_data()->isCompatible(type_data2->type_data())) {
        return false;
      }
    }
    return true;
  }
  bool firDB::firTypeVector::isEqual(firType* type) {
    if (type == NULL) return false;
    if (!type->isVectorType()) {
      return false;
    }
    firTypeVector* vtype = dynamic_cast<firTypeVector*>(type);
    if (this->depth() != vtype->depth()) {
      return false;
    }
    return this->type_data()->isEqual(vtype->type_data());
  }
  bool firDB::firTypeBundle::isEqual(firType* type) {
    if (type == NULL) return false;
    if (!type->isBundleType()) {
      return false;
    }
    firTypeBundle* btype = dynamic_cast<firTypeBundle*>(type);
    size_t size = this->type_datas().size();
    size_t bsize = btype->type_datas().size();
    if (size != bsize) {
      return false;
    }
    for (size_t i = 0; i < size; i++) {
      firDB::firField* type_data1 = this->type_datas().at(i);
      firDB::firField* type_data2 = btype->type_datas().at(i);
      if (!(type_data1->field_id() == type_data2->field_id())) {
        return false;
      }
      if (!(type_data1->flip() == type_data2->flip())) {
        return false;
      }
      if (!type_data1->type_data()->isEqual(type_data2->type_data())) {
        return false;
      }
    }
    return true;
  }
}