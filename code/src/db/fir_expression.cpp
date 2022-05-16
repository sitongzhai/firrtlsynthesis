//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#include <regex>
#include <cmath>
#include "db/fir_expression.h"
#include "db/fir_type.h"
#include "db/fir_circuit.h"
#include "utility/exception.h"
#include "utility/utility.h"
#include "utility/big_int.h"

namespace firrtlsyn {
  // last element in list must be NULL even illegal expression or empty expression,
  // first element in list must be reference expression for legal expression positive sequence list,
  // only id expression is legal expression for this stack function.
  std::list<firDB::firExp*> firDB::firExp::generateExpPositiveSequence() {
    std::list<firExp*> exps_list;
    exps_list.push_front(NULL);
    firExp* current_exp = this;
    while (current_exp != NULL) {
      if (current_exp->isReferenceExpression()) {
        exps_list.push_front(current_exp);
        current_exp = NULL;
      } else if (current_exp->isSubfieldExpression()) {
        exps_list.push_front(current_exp);
        current_exp = (dynamic_cast<firExpSubfield*>(current_exp))->exp();
      } else if (current_exp->isSubindexExpression()) {
        exps_list.push_front(current_exp);
        current_exp = (dynamic_cast<firExpSubindex*>(current_exp))->exp();
      } else if (current_exp->isSubaccessExpression()) {
        exps_list.push_front(current_exp);
        current_exp = (dynamic_cast<firExpSubaccess*>(current_exp))->exp();
      } else {
        current_exp = NULL;
        //fs_warning("*WARNING*: Illegal expression to generate stack!\n");
        exps_list.clear();
        exps_list.push_front(NULL);
      }
    }
    return exps_list;
  }
  firDB::firExpUInt::firExpUInt(unsigned long long value, int width) {
    big_value_ = new BigInt(value);
    width_ = static_cast<unsigned int>(width);
    exp_type_ = ExpressionType::kExpTypeUInt;
  }
  firDB::firExpSInt::firExpSInt(long long value, int width) {
    big_value_ = new BigInt(value);
    width_ = static_cast<unsigned int>(width);
    exp_type_ = ExpressionType::kExpTypeSInt;
  }
  firDB::firExpUIntBits::firExpUIntBits(const std::string& value, int width) {
    fs_assert(width >= 0);
    //std::regex binary("b[01]+");
    //std::regex octonary("o[0-7]+");
    //std::regex hex("h[0-9A-F]+");
    //std::regex pattern("(b[01]+|o[0-7]+|h[0-9a-f]+)");
    //fs_assert(regex_match(value.begin(), value.end(), pattern));
    big_value_ = new BigInt(value, false);
    width_ = static_cast<unsigned int>(width);
    exp_type_ = ExpressionType::kExpTypeUIntBits;
  }
  firDB::firExpSIntBits::firExpSIntBits(const std::string& value, int width) {
    fs_assert(width >= 0);
    big_value_ = new BigInt(value, true);
    width_ = static_cast<unsigned int>(width);
    exp_type_ = ExpressionType::kExpTypeSIntBits;
  }
  firDB::firExpSubindex::firExpSubindex(firExp* exp, int index) {
    fs_assert(index >= 0);
    exp_ = exp;
    index_ = static_cast<unsigned int>(index);
    exp_type_ = ExpressionType::kExpTypeSubindex;
  }
  firDB::firExpSubaccess::firExpSubaccess(firExp* exp, firExp* access) {
    //access type match (unsigned integer type)
    exp_type_ = ExpressionType::kExpTypeSubaccess;
    exp_ = exp;
    access_ = access;
  }
  firDB::firExpMux::firExpMux(firExp* sel, firExp* input1, firExp* input2) {
    //access type match (unsigned integer type)
    exp_type_ = ExpressionType::kExpTypeMux;
    sel_ = sel;
    input1_ = input1;
    input2_ = input2;
  }
  firDB::firExpValidif::firExpValidif(firExp* valid, firExp* exp) {
    //access type match (unsigned integer type)
    exp_type_ = ExpressionType::kExpTypeValidif;
    valid_ = valid;
    exp_ = exp;
  }
  
  bool firDB::firExpUInt::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isUIntExpression()) return false;
    Big* this_big = this->big_value()->getBig();
    Big* exp_big = dynamic_cast<firExpUInt*>(exp)->big_value()->getBig();
    if ((*this_big) != (*exp_big)) return false;
    return (this->width() == dynamic_cast<firExpUInt*>(exp)->width());
  }
  bool firDB::firExpUIntBits::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isUIntBitsExpression()) return false;
    Big* this_big = this->big_value()->getBig();
    Big* exp_big = dynamic_cast<firExpUIntBits*>(exp)->big_value()->getBig();
    if ((*this_big) != (*exp_big)) return false;
    return (this->width() == dynamic_cast<firExpUIntBits*>(exp)->width());
  }
  bool firDB::firExpSInt::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isSIntExpression()) return false;
    Big* this_big = this->big_value()->getBig();
    Big* exp_big = dynamic_cast<firExpSInt*>(exp)->big_value()->getBig();
    if ((*this_big) != (*exp_big)) return false;
    return (this->width() == dynamic_cast<firExpSInt*>(exp)->width());
  }
  bool firDB::firExpSIntBits::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isSIntBitsExpression()) return false;
    Big* this_big = this->big_value()->getBig();
    Big* exp_big = dynamic_cast<firExpSIntBits*>(exp)->big_value()->getBig();
    if ((*this_big) != (*exp_big)) return false;
    return (this->width() == dynamic_cast<firExpSIntBits*>(exp)->width());
  }
  bool firDB::firExpRef::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isReferenceExpression()) return false;
    std::string id = this->id();
    std::string exp_id = dynamic_cast<firExpRef*>(exp)->id();
    return id == exp_id;
  }
  bool firDB::firExpDouble::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isDoubleExpression()) return false;
    if (this->left_side() != dynamic_cast<firExpDouble*>(exp)->left_side()) return false;
    return (this->right_side() != dynamic_cast<firExpDouble*>(exp)->right_side());
  }
  bool firDB::firExpSubfield::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isSubfieldExpression()) return false;
    if (this->id() != dynamic_cast<firExpSubfield*>(exp)->id()) return false;
    return (this->exp()->isSameExpression(dynamic_cast<firExpSubfield*>(exp)->exp()));
  }
  bool firDB::firExpSubindex::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isSubindexExpression()) return false;
    if (this->index() != dynamic_cast<firExpSubindex*>(exp)->index()) return false;
    return (this->exp()->isSameExpression(dynamic_cast<firExpSubindex*>(exp)->exp()));
  }
  bool firDB::firExpSubaccess::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isSubaccessExpression()) return false;
    firExpSubaccess* subaccess = dynamic_cast<firExpSubaccess*>(exp);
    if (!this->access()->isSameExpression(subaccess->access())) return false;
    return (this->exp()->isSameExpression(subaccess->exp()));
  }
  bool firDB::firExpMux::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isMuxExpression()) return false;
    firExpMux* mux = dynamic_cast<firExpMux*>(exp);
    if (!this->sel()->isSameExpression(mux->sel())) return false;
    if (!this->input1()->isSameExpression(mux->input1())) return false;
    return (this->input2()->isSameExpression(mux->input2()));
  }
  bool firDB::firExpValidif::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isValidifExpression()) return false;
    firExpValidif* validif = dynamic_cast<firExpValidif*>(exp);
    if (!this->valid()->isSameExpression(validif->valid())) return false;
    return (this->exp()->isSameExpression(validif->exp()));
  }
  bool firDB::firExpPrimOperation::firAdd::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isAdd()) return false;
    firExpPrimOperation::firAdd* prim_add = dynamic_cast<firExpPrimOperation::firAdd*>(exp);
    if (!this->exp1()->isSameExpression(prim_add->exp1())) return false;
    return (this->exp2()->isSameExpression(prim_add->exp2()));
  }
  bool firDB::firExpPrimOperation::firSub::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isSub()) return false;
    firExpPrimOperation::firSub* prim_sub = dynamic_cast<firExpPrimOperation::firSub*>(exp);
    if (!this->exp1()->isSameExpression(prim_sub->exp1())) return false;
    return (this->exp2()->isSameExpression(prim_sub->exp2()));
  }
  bool firDB::firExpPrimOperation::firMul::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isMul()) return false;
    firExpPrimOperation::firMul* prim_mul = dynamic_cast<firExpPrimOperation::firMul*>(exp);
    if (!this->exp1()->isSameExpression(prim_mul->exp1())) return false;
    return (this->exp2()->isSameExpression(prim_mul->exp2()));
  }
  bool firDB::firExpPrimOperation::firDiv::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isDiv()) return false;
    firExpPrimOperation::firDiv* prim_div = dynamic_cast<firExpPrimOperation::firDiv*>(exp);
    if (!this->num()->isSameExpression(prim_div->num())) return false;
    return (this->den()->isSameExpression(prim_div->den()));
  }
  bool firDB::firExpPrimOperation::firMod::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isMod()) return false;
    firExpPrimOperation::firMod* prim_mod = dynamic_cast<firExpPrimOperation::firMod*>(exp);
    if (!this->num()->isSameExpression(prim_mod->num())) return false;
    return (this->den()->isSameExpression(prim_mod->den()));
  }
  bool firDB::firExpPrimOperation::firLt::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isLt()) return false;
    firExpPrimOperation::firLt* prim_lt = dynamic_cast<firExpPrimOperation::firLt*>(exp);
    if (!this->exp1()->isSameExpression(prim_lt->exp1())) return false;
    return (this->exp2()->isSameExpression(prim_lt->exp2()));
  }
  bool firDB::firExpPrimOperation::firLeq::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isLeq()) return false;
    firExpPrimOperation::firLeq* prim_leq = dynamic_cast<firExpPrimOperation::firLeq*>(exp);
    if (!this->exp1()->isSameExpression(prim_leq->exp1())) return false;
    return (this->exp2()->isSameExpression(prim_leq->exp2()));
  }
  bool firDB::firExpPrimOperation::firGt::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isGt()) return false;
    firExpPrimOperation::firGt* prim_gt = dynamic_cast<firExpPrimOperation::firGt*>(exp);
    if (!this->exp1()->isSameExpression(prim_gt->exp1())) return false;
    return (this->exp2()->isSameExpression(prim_gt->exp2()));
  }
  bool firDB::firExpPrimOperation::firGeq::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isGeq()) return false;
    firExpPrimOperation::firGeq* prim_geq = dynamic_cast<firExpPrimOperation::firGeq*>(exp);
    if (!this->exp1()->isSameExpression(prim_geq->exp1())) return false;
    return (this->exp2()->isSameExpression(prim_geq->exp2()));
  }
  bool firDB::firExpPrimOperation::firEq::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isEq()) return false;
    firExpPrimOperation::firEq* prim_eq = dynamic_cast<firExpPrimOperation::firEq*>(exp);
    if (!this->exp1()->isSameExpression(prim_eq->exp1())) return false;
    return (this->exp2()->isSameExpression(prim_eq->exp2()));
  }
  bool firDB::firExpPrimOperation::firNeq::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isNeq()) return false;
    firExpPrimOperation::firNeq* prim_neq = dynamic_cast<firExpPrimOperation::firNeq*>(exp);
    if (!this->exp1()->isSameExpression(prim_neq->exp1())) return false;
    return (this->exp2()->isSameExpression(prim_neq->exp2()));
  }
  bool firDB::firExpPrimOperation::firPad::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isPad()) return false;
    firExpPrimOperation::firPad* prim_pad = dynamic_cast<firExpPrimOperation::firPad*>(exp);
    return (this->exp()->isSameExpression(prim_pad->exp()));
  }
  bool firDB::firExpPrimOperation::firAsUInt::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isAsUInt()) return false;
    firExpPrimOperation::firAsUInt* prim_asuint = dynamic_cast<firExpPrimOperation::firAsUInt*>(exp);
    return (this->exp()->isSameExpression(prim_asuint->exp()));
  }
  bool firDB::firExpPrimOperation::firAsSInt::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isAsSInt()) return false;
    firExpPrimOperation::firAsSInt* prim_assint = dynamic_cast<firExpPrimOperation::firAsSInt*>(exp);
    return (this->exp()->isSameExpression(prim_assint->exp()));
  }
  bool firDB::firExpPrimOperation::firAsClock::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isAsClock()) return false;
    firExpPrimOperation::firAsClock* prim_asclock = dynamic_cast<firExpPrimOperation::firAsClock*>(exp);
    return (this->exp()->isSameExpression(prim_asclock->exp()));
  }
  bool firDB::firExpPrimOperation::firAsFixed::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isAsFixed()) return false;
    firExpPrimOperation::firAsFixed* prim_asfixed = dynamic_cast<firExpPrimOperation::firAsFixed*>(exp);
    if (this->binary_point() != prim_asfixed->binary_point()) return false;
    return (this->exp()->isSameExpression(prim_asfixed->exp()));
  }
  bool firDB::firExpPrimOperation::firAsAsyncReset::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isAsAsyncReset()) return false;
    firExpPrimOperation::firAsAsyncReset* prim_asasyncreset = dynamic_cast<firExpPrimOperation::firAsAsyncReset*>(exp);
    return (this->exp()->isSameExpression(prim_asasyncreset->exp()));
  }
  bool firDB::firExpPrimOperation::firAsInterval::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isAsInterval()) return false;
    firExpPrimOperation::firAsInterval* prim_asinterval = dynamic_cast<firExpPrimOperation::firAsInterval*>(exp);
    if (this->left() != prim_asinterval->left()) return false;
    if (this->right() != prim_asinterval->right()) return false;
    if (this->bit_width() != prim_asinterval->bit_width()) return false;
    return (this->exp()->isSameExpression(prim_asinterval->exp()));
  }
  bool firDB::firExpPrimOperation::firShl::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isShl()) return false;
    firExpPrimOperation::firShl* prim_shl = dynamic_cast<firExpPrimOperation::firShl*>(exp);
    if (this->n() != prim_shl->n()) return false;
    return (this->exp()->isSameExpression(prim_shl->exp()));
  }
  bool firDB::firExpPrimOperation::firShr::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isShr()) return false;
    firExpPrimOperation::firShr* prim_shr = dynamic_cast<firExpPrimOperation::firShr*>(exp);
    if (this->n() != prim_shr->n()) return false;
    return (this->exp()->isSameExpression(prim_shr->exp()));
  }
  bool firDB::firExpPrimOperation::firDshl::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isDshl()) return false;
    firExpPrimOperation::firDshl* prim_dshl = dynamic_cast<firExpPrimOperation::firDshl*>(exp);
    if (!this->exp1()->isSameExpression(prim_dshl->exp1())) return false;
    return (this->exp2()->isSameExpression(prim_dshl->exp2()));
  }
  bool firDB::firExpPrimOperation::firDshr::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isDshr()) return false;
    firExpPrimOperation::firDshr* prim_dshr = dynamic_cast<firExpPrimOperation::firDshr*>(exp);
    if (!this->exp1()->isSameExpression(prim_dshr->exp1())) return false;
    return (this->exp2()->isSameExpression(prim_dshr->exp2()));
  }
  bool firDB::firExpPrimOperation::firCvt::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isCvt()) return false;
    firExpPrimOperation::firCvt* prim_cvt = dynamic_cast<firExpPrimOperation::firCvt*>(exp);
    return (this->exp()->isSameExpression(prim_cvt->exp()));
  }
  bool firDB::firExpPrimOperation::firNeg::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isNeg()) return false;
    firExpPrimOperation::firNeg* prim_neg = dynamic_cast<firExpPrimOperation::firNeg*>(exp);
    return (this->exp()->isSameExpression(prim_neg->exp()));
  }
  bool firDB::firExpPrimOperation::firNot::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isNot()) return false;
    firExpPrimOperation::firNot* prim_not = dynamic_cast<firExpPrimOperation::firNot*>(exp);
    return (this->exp()->isSameExpression(prim_not->exp()));
  }
  bool firDB::firExpPrimOperation::firAnd::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isAnd()) return false;
    firExpPrimOperation::firAnd* prim_and = dynamic_cast<firExpPrimOperation::firAnd*>(exp);
    if (!this->exp1()->isSameExpression(prim_and->exp1())) return false;
    return (this->exp2()->isSameExpression(prim_and->exp2()));
  }
  bool firDB::firExpPrimOperation::firOr::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isOr()) return false;
    firExpPrimOperation::firOr* prim_or = dynamic_cast<firExpPrimOperation::firOr*>(exp);
    if (!this->exp1()->isSameExpression(prim_or->exp1())) return false;
    return (this->exp2()->isSameExpression(prim_or->exp2()));
  }
  bool firDB::firExpPrimOperation::firXor::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isXor()) return false;
    firExpPrimOperation::firXor* prim_xor = dynamic_cast<firExpPrimOperation::firXor*>(exp);
    if (!this->exp1()->isSameExpression(prim_xor->exp1())) return false;
    return (this->exp2()->isSameExpression(prim_xor->exp2()));
  }
  bool firDB::firExpPrimOperation::firAndr::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isAndr()) return false;
    firExpPrimOperation::firAndr* prim_andr = dynamic_cast<firExpPrimOperation::firAndr*>(exp);
    return (this->exp()->isSameExpression(prim_andr->exp()));
  }
  bool firDB::firExpPrimOperation::firOrr::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isOrr()) return false;
    firExpPrimOperation::firOrr* prim_orr = dynamic_cast<firExpPrimOperation::firOrr*>(exp);
    return (this->exp()->isSameExpression(prim_orr->exp()));
  }
  bool firDB::firExpPrimOperation::firXorr::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isXorr()) return false;
    firExpPrimOperation::firXorr* prim_xorr = dynamic_cast<firExpPrimOperation::firXorr*>(exp);
    return (this->exp()->isSameExpression(prim_xorr->exp()));
  }
  bool firDB::firExpPrimOperation::firCat::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isCat()) return false;
    firExpPrimOperation::firCat* prim_cat = dynamic_cast<firExpPrimOperation::firCat*>(exp);
    if (!this->exp1()->isSameExpression(prim_cat->exp1())) return false;
    return (this->exp2()->isSameExpression(prim_cat->exp2()));
  }
  bool firDB::firExpPrimOperation::firBits::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isBits()) return false;
    firExpPrimOperation::firBits* prim_bits = dynamic_cast<firExpPrimOperation::firBits*>(exp);
    if (this->lo() != prim_bits->lo()) return false;
    if (this->hi() != prim_bits->hi()) return false;
    return (this->exp()->isSameExpression(prim_bits->exp()));
  }
  bool firDB::firExpPrimOperation::firHead::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isHead()) return false;
    firExpPrimOperation::firHead* prim_head = dynamic_cast<firExpPrimOperation::firHead*>(exp);
    if (this->n() != prim_head->n()) return false;
    return (this->exp()->isSameExpression(prim_head->exp()));
  }
  bool firDB::firExpPrimOperation::firTail::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isTail()) return false;
    firExpPrimOperation::firTail* prim_tail = dynamic_cast<firExpPrimOperation::firTail*>(exp);
    if (this->n() != prim_tail->n()) return false;
    return (this->exp()->isSameExpression(prim_tail->exp()));
  }
  bool firDB::firExpPrimOperation::firIncp::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isIncp()) return false;
    firExpPrimOperation::firIncp* prim_incp = dynamic_cast<firExpPrimOperation::firIncp*>(exp);
    if (this->n() != prim_incp->n()) return false;
    return (this->exp()->isSameExpression(prim_incp->exp()));
  }
  bool firDB::firExpPrimOperation::firDecp::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isDecp()) return false;
    firExpPrimOperation::firDecp* prim_decp = dynamic_cast<firExpPrimOperation::firDecp*>(exp);
    if (this->n() != prim_decp->n()) return false;
    return (this->exp()->isSameExpression(prim_decp->exp()));
  }
  bool firDB::firExpPrimOperation::firSetp::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isSetp()) return false;
    firExpPrimOperation::firSetp* prim_setp = dynamic_cast<firExpPrimOperation::firSetp*>(exp);
    if (this->n() != prim_setp->n()) return false;
    return (this->exp()->isSameExpression(prim_setp->exp()));
  }
  bool firDB::firExpPrimOperation::firWrap::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isWrap()) return false;
    firExpPrimOperation::firWrap* prim_wrap = dynamic_cast<firExpPrimOperation::firWrap*>(exp);
    if (!this->exp1()->isSameExpression(prim_wrap->exp1())) return false;
    return (this->exp2()->isSameExpression(prim_wrap->exp2()));
  }
  bool firDB::firExpPrimOperation::firClip::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isClip()) return false;
    firExpPrimOperation::firClip* prim_clip = dynamic_cast<firExpPrimOperation::firClip*>(exp);
    if (!this->exp1()->isSameExpression(prim_clip->exp1())) return false;
    return (this->exp2()->isSameExpression(prim_clip->exp2()));
  }
  bool firDB::firExpPrimOperation::firSquz::isSameExpression(firExp* exp) {
    if (exp == NULL) return false;
    if (!exp->isPrimOperationExpression()) return false;
    if (!dynamic_cast<firExpPrimOperation*>(exp)->isSquz()) return false;
    firExpPrimOperation::firSquz* prim_squz = dynamic_cast<firExpPrimOperation::firSquz*>(exp);
    if (!this->exp1()->isSameExpression(prim_squz->exp1())) return false;
    return (this->exp2()->isSameExpression(prim_squz->exp2()));
  }
  
  void firDB::firExpUInt::updateTypeData(firModule* module) {
    BigInt* big_value = this->big_value();
    unsigned int min_width = big_value->getMinBinaryWidth();
    unsigned int exp_width = this->width();
    if (exp_width == 0) {
      this->set_width(min_width);
    } else {
      if (min_width > exp_width) {
        fs_error("*ERROR*: The width '%d' of expression is not enough to cover the width of value '%s'.\n", exp_width, big_value->getOriginValue().c_str());
      }
    }
    firTypeUInt* rtype = dynamic_cast<firTypeUInt*>(this->type_data());
    if (rtype == NULL) {
      this->set_type_data(module->addTypeUInt(this->width()));
    } else {
      rtype->set_width(this->width());
    }
  }
  firDB::firType* firDB::firExpUInt::getTypeData(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      updateTypeData(module);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpUInt::inferDataType(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module != NULL);
    updateTypeData(module);
    return this->type_data();
  }
  void firDB::firExpUInt::updateExpVal(firModule* module) {
    fs_assert(module != NULL);
    BigInt* big_value = this->big_value();
    fs_assert(big_value != NULL);
    std::string hex_value = big_value->getHexadecimalValue();
    unsigned int min_width = this->width();
    fs_assert(big_value->isUInt());
    firExpUIntBits* result_val = module->addExpUIntBits(hex_value, min_width);
    this->set_exp_val(result_val);
    return;
  }
  firDB::firExp* firDB::firExpUInt::getExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module != NULL);
    if (this->exp_val() == NULL) {
      updateExpVal(module);
    }
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpUInt::inferExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module != NULL);
    updateExpVal(module);
    return this->exp_val();
  }
  
  void firDB::firExpUIntBits::updateTypeData(firModule* module) {
    BigInt* big_value = this->big_value();
    unsigned int min_width = big_value->getMinBinaryWidth();
    unsigned int exp_width = this->width();
    if (exp_width == 0) {
      this->set_width(min_width);
    } else {
      if (min_width > exp_width) {
        fs_error("*ERROR*: The width '%d' of expression is not enough to cover the width of value '%s'.\n", exp_width, big_value->getOriginValue().c_str());
      }
    }
    firTypeUInt* rtype = dynamic_cast<firTypeUInt*>(this->type_data());
    if (rtype == NULL) {
      this->set_type_data(module->addTypeUInt(this->width()));
    } else {
      rtype->set_width(this->width());
    }
  }
  firDB::firType* firDB::firExpUIntBits::getTypeData(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      updateTypeData(module);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpUIntBits::inferDataType(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module != NULL);
    updateTypeData(module);
    return this->type_data();
  }
  void firDB::firExpUIntBits::updateExpVal(firModule* module) {
    fs_assert(module != NULL);
    BigInt* big_value = this->big_value();
    fs_assert(big_value != NULL);
    std::string hex_value = big_value->getHexadecimalValue();
    unsigned int min_width = this->width();
    fs_assert(big_value->isUInt());
    firExpUIntBits* result_val = module->addExpUIntBits(hex_value, min_width);
    this->set_exp_val(result_val);
    return;
  }
  firDB::firExp* firDB::firExpUIntBits::getExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module != NULL);
    if (this->exp_val() == NULL) {
      updateExpVal(module);
    }
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpUIntBits::inferExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module != NULL);
    updateExpVal(module);
    return this->exp_val();
  }
  
  void firDB::firExpSInt::updateTypeData(firModule* module) {
    BigInt* big_value = this->big_value();
    unsigned int min_width = big_value->getMinBinaryWidth();
    unsigned int exp_width = this->width();
    if (exp_width == 0) {
      this->set_width(min_width);
    } else {
      if (min_width > exp_width) {
        fs_error("*ERROR*: The width '%d' of expression is not enough to cover the width of value '%s'.\n", exp_width, big_value->getOriginValue().c_str());
      }
    }
    firTypeSInt* rtype = dynamic_cast<firTypeSInt*>(this->type_data());
    if (rtype == NULL) {
      this->set_type_data(module->addTypeSInt(this->width()));
    } else {
      rtype->set_width(this->width());
    }
  }
  firDB::firType* firDB::firExpSInt::getTypeData(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      updateTypeData(module);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpSInt::inferDataType(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module != NULL);
    updateTypeData(module);
    return this->type_data();
  }
  void firDB::firExpSInt::updateExpVal(firModule* module) {
    fs_assert(module != NULL);
    BigInt* big_value = this->big_value();
    fs_assert(big_value != NULL);
    std::string hex_value = big_value->getHexadecimalValue();
    unsigned int min_width = this->width();
    fs_assert(big_value->isSInt());
    firExpSIntBits* result_val = module->addExpSIntBits(hex_value, min_width);
    this->set_exp_val(result_val);
    return;
  }
  firDB::firExp* firDB::firExpSInt::getExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module != NULL);
    if (this->exp_val() == NULL) {
      updateExpVal(module);
    }
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpSInt::inferExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module != NULL);
    updateExpVal(module);
    return this->exp_val();
  }
  
  void firDB::firExpSIntBits::updateTypeData(firModule* module) {
    BigInt* big_value = this->big_value();
    unsigned int min_width = big_value->getMinBinaryWidth();
    unsigned int exp_width = this->width();
    if (exp_width == 0) {
      this->set_width(min_width);
    } else {
      if (min_width > exp_width) {
        fs_error("*ERROR*: The width '%d' of expression is not enough to cover the width of value '%s'.\n", exp_width, big_value->getOriginValue().c_str());
      }
    }
    firTypeSInt* rtype = dynamic_cast<firTypeSInt*>(this->type_data());
    if (rtype == NULL) {
      this->set_type_data(module->addTypeSInt(this->width()));
    } else {
      rtype->set_width(this->width());
    }
  }
  firDB::firType* firDB::firExpSIntBits::getTypeData(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      updateTypeData(module);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpSIntBits::inferDataType(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module != NULL);
    updateTypeData(module);
    return this->type_data();
  }
  void firDB::firExpSIntBits::updateExpVal(firModule* module) {
    fs_assert(module != NULL);
    BigInt* big_value = this->big_value();
    fs_assert(big_value != NULL);
    std::string hex_value = big_value->getHexadecimalValue();
    //unsigned int min_width = big_value->getMinBinaryWidth();
    unsigned int min_width = this->width();
    fs_assert(big_value->isSInt());
    firExpSIntBits* result_val = module->addExpSIntBits(hex_value, min_width);
    this->set_exp_val(result_val);
    return;
  }
  firDB::firExp* firDB::firExpSIntBits::getExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module != NULL);
    if (this->exp_val() == NULL) {
      updateExpVal(module);
    }
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpSIntBits::inferExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module != NULL);
    updateExpVal(module);
    return this->exp_val();
  }
  
  void firDB::firExpRef::updateTypeData(firModule* module, firItemConditional* domain) {
    firItem* fir_item = module->findItemById(this->id(), domain);
    fs_assert(fir_item != NULL);
    firType* rtype = module->getItemType(fir_item);
    if (rtype == NULL) {
      //if (!fir_item->isInstanceItem()) {
      //  fs_warning("*WARNING*: Failed to update the type of '%s'.\n", this->toString().c_str());
      //}
      this->set_type_data(NULL);
    } else {
      if (this->type_data() == NULL || !this->type_data()->isEqual(rtype)) {
        //this->set_type_data(module->copyType(rtype));
        this->set_type_data(rtype);
      } else {
        this->type_data()->alignTypeDataWidth(rtype);
      }
    }
  }
  firDB::firType* firDB::firExpRef::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      updateTypeData(module, domain);
    }
    if (this->type_data() == NULL) {
      firItem* inst_item = module->findItemExceptMPort(this->id(), domain);
      if (inst_item == NULL || !inst_item->isInstanceItem()) {
        fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
        fs_assert(0);
      }
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpRef::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    updateTypeData(module, domain);
    if (this->type_data() == NULL) {
      firItem* inst_item = module->findItemExceptMPort(this->id(), domain);
      if (inst_item == NULL || !inst_item->isInstanceItem()) {
        fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
        fs_assert(0);
      }
    }
    return this->type_data();
  }
  void firDB::firExpRef::updateExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    std::string this_id = this->toString();
    firExp* result_val = module->getItemExpValById(this_id, domain);
    this->set_exp_val(result_val);
    return;
  }
  firDB::firExp* firDB::firExpRef::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->exp_val() == NULL) {
      updateExpVal(module, domain);
    }
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpRef::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    updateExpVal(module, domain);
    return this->exp_val();
  }
  
  void firDB::firExpSubfield::updateMemoryTypeData(firModule* module, firItemConditional* domain, firItemMemory* item_memory) {
    if (item_memory == NULL) {
      this->set_type_data(NULL);
      return;
    }
    std::list<firExp*> exp_list = this->generateExpPositiveSequence();
    fs_assert(exp_list.front()->isReferenceExpression());
    //fs_assert(item_memory == module->findItemById(dynamic_cast<firExpRef*>(exp_list.front())->id(), domain));
    exp_list.pop_front();
    firExpSubfield* mem_mport_exp = dynamic_cast<firExpSubfield*>(exp_list.front());
    fs_assert(mem_mport_exp != NULL);
    MPortDir mem_mport_dir = item_memory->findPortDirById(mem_mport_exp->id());
    exp_list.pop_front();
    firExpSubfield* mem_mport_port_exp = dynamic_cast<firExpSubfield*>(exp_list.front());
    fs_assert(mem_mport_port_exp != NULL);
    MemPortType mem_mport_port_type = item_memory->getMemPortTypeById(mem_mport_dir, mem_mport_port_exp->id());
    if (mem_mport_port_type == MemPortType::kMemPortData ||
      mem_mport_port_type == MemPortType::kMemPortWData ||
      mem_mport_port_type == MemPortType::kMemPortRData) {
      firType* item_memory_type = module->getItemType(item_memory, domain);
      if (this->type_data() == NULL || !this->type_data()->isEqual(item_memory_type)) {
        //this->set_type_data(module->copyType(item_memory_type));
        this->set_type_data(item_memory_type);
      } else {
        this->type_data()->alignTypeDataWidth(item_memory_type);
      }
    } else if (mem_mport_port_type == MemPortType::kMemPortAddr) {
      unsigned int depth = item_memory->depth();
      std::string s_depth = std::to_string(depth - 1);
      BigInt o_depth(s_depth, false);
      int width = o_depth.getMinBinaryWidth();
      if (dynamic_cast<firTypeUInt*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeUInt(-1));
      }
      firTypeUInt* utype = dynamic_cast<firTypeUInt*>(this->type_data());
      utype->set_width(width);
    } else if (mem_mport_port_type == MemPortType::kMemPortClk) {
      if (dynamic_cast<firTypeClock*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeClock());
      }
    } else if (mem_mport_port_type == MemPortType::kMemPortEn ||
      mem_mport_port_type == MemPortType::kMemPortMask ||
      mem_mport_port_type == MemPortType::kMemPortWMode ||
      mem_mport_port_type == MemPortType::kMemPortWMask) {
      if (dynamic_cast<firTypeUInt*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeUInt(-1));
      }
      firTypeUInt* utype = dynamic_cast<firTypeUInt*>(this->type_data());
      utype->set_width(1);
    } else {
      fs_assert(0);
      this->set_type_data(NULL);
    }
  }
  void firDB::firExpSubfield::updateItemTypeData(firModule* module, firItem* fir_item, firType* subfield_exp_type) {
    if (fir_item == NULL) {
      this->set_type_data(NULL);
      return;
    }
    firType* rtype = NULL;
    firExp* subfield_exp = this->exp();
    std::string id = this->id();
    if (fir_item->isInstanceItem()) {
      if (subfield_exp->isReferenceExpression()) {
        fs_assert(subfield_exp_type == NULL);
        firItemInstance* iitem = dynamic_cast<firItemInstance*>(fir_item);
        firCircuit* circuit = module->circuit();
        firModule* inst_module = circuit->findModuleById(iitem->module_id());
        if (inst_module != NULL) {
          firItem* inst_port = inst_module->findItemExceptMPort(id, NULL);
          if (inst_port != NULL) {
            if (inst_port->isPortItem()) {
              rtype = inst_module->getItemType(inst_port, NULL);
            }
          }
        }
      } else {
        if (subfield_exp_type == NULL) {
          this->set_type_data(NULL);
          return;
        }
        if (subfield_exp_type->isBundleType()) {
          firTypeBundle* btype = dynamic_cast<firTypeBundle*>(subfield_exp_type);
          rtype = btype->findTypeDataById(id);
        } else {
          fs_assert(0);
          rtype = NULL;
        }
      }
    } else {
      if (subfield_exp_type == NULL) {
        this->set_type_data(NULL);
        return;
      }
      if (subfield_exp_type->isBundleType()) {
        firTypeBundle* btype = dynamic_cast<firTypeBundle*>(subfield_exp_type);
        rtype = btype->findTypeDataById(id);
      } else {
        if (fir_item->isRegisterItem()) {
          std::string register_d = dynamic_cast<firItemRegister*>(fir_item)->getPortDId();
          std::string register_q = dynamic_cast<firItemRegister*>(fir_item)->getPortQId();
          if (id == register_d || id == register_q) {
            rtype = subfield_exp_type;
          } else {
            fs_error("*ERROR*: The type of expression '%s' must be bundle but it was not.\n", this->toString().c_str());
            fs_assert(0);
            rtype = NULL;
          }
        } else {
          fs_error("*ERROR*: The type of expression '%s' must be bundle but it was not.\n", this->toString().c_str());
          fs_assert(0);
          rtype = NULL;
        }
      }
    }
    if (rtype == NULL) {
      fs_warning("*WARNING*: Failed to update the type of '%s'.\n", this->toString().c_str());
      this->set_type_data(NULL);
    } else {
      if (this->type_data() == NULL || !this->type_data()->isEqual(rtype)) {
        //this->set_type_data(module->copyType(rtype));
        this->set_type_data(rtype);
      } else {
        this->type_data()->alignTypeDataWidth(rtype);
      }
    }
  }
  firDB::firType* firDB::firExpSubfield::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firItem* fir_item = module->findItemByExpression(this, domain);
      if (fir_item == NULL) {
        fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
        fs_assert(0);
        return NULL;
      }
      if (fir_item->isMemoryItem()) {
        updateMemoryTypeData(module, domain, dynamic_cast<firItemMemory*>(fir_item));
      } else {
        firType* subfield_exp_type = this->exp()->getTypeData(module, domain);
        updateItemTypeData(module, fir_item, subfield_exp_type);
      }
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpSubfield::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firItem* fir_item = module->findItemByExpression(this, domain);
    if (fir_item == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
      return NULL;
    }
    if (fir_item->isMemoryItem()) {
      updateMemoryTypeData(module, domain, dynamic_cast<firItemMemory*>(fir_item));
    } else {
      firType* subfield_exp_type = this->exp()->inferDataType(module, domain);
      updateItemTypeData(module, fir_item, subfield_exp_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firExp* firDB::firExpSubfield::getExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module);
    fs_assert(this->exp_val() == NULL);
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpSubfield::inferExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module);
    fs_assert(this->exp_val() == NULL);
    return this->exp_val();
  }
  
  firDB::firType* firDB::firExpDouble::getTypeData(firModule* module, firItemConditional* /*domain*/) {
    //TODO
    fs_assert(module != NULL);
    fs_warning("*WARNING*: The 'double' expression has not been supported in this version.\n");
    return NULL;
  }
  firDB::firType* firDB::firExpDouble::inferDataType(firModule* module, firItemConditional* /*domain*/) {
    //TODO
    fs_assert(module != NULL);
    fs_warning("*WARNING*: The 'double' expression has not been supported in this version.\n");
    return NULL;
  }
  firDB::firExp* firDB::firExpDouble::getExpVal(firModule* module, firItemConditional* /*domain*/) {
    //TODO
    fs_assert(module != NULL);
    fs_warning("*WARNING*: The 'double' expression has not been supported in this version.\n");
    return NULL;
  }
  firDB::firExp* firDB::firExpDouble::inferExpVal(firModule* module, firItemConditional* /*domain*/) {
    //TODO
    fs_assert(module != NULL);
    fs_warning("*WARNING*: The 'double' expression has not been supported in this version.\n");
    return NULL;
  }
  
  void firDB::firExpSubindex::updateTypeData(firModule* module, firType* subindex_exp_type) {
    fs_assert(module != NULL);
    if (subindex_exp_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    firType* rtype = NULL;
    unsigned int index = this->index();
    if (!subindex_exp_type->isVectorType()) {
      fs_error("*ERROR*: The type of expression '%s' must be vector but it was not.\n", this->toString().c_str());
      fs_assert(0);
      rtype = NULL;
    }
    firTypeVector* vtype = dynamic_cast<firTypeVector*>(subindex_exp_type);
    if (index >= vtype->depth()) {
      fs_error("*ERROR*: The sub-index value (%u) was not within the type depth range (0 to %u) of expression '%s'.\n", index, vtype->depth(), this->toString().c_str());
      fs_assert(0);
      rtype = NULL;
    }
    rtype = vtype->type_data();
    if (rtype == NULL) {
      fs_warning("*WARNING*: Failed to update the type of '%s'.\n", this->toString().c_str());
      this->set_type_data(NULL);
    } else {
      if (this->type_data() == NULL || !this->type_data()->isEqual(rtype)) {
        //this->set_type_data(module->copyType(rtype));
        this->set_type_data(rtype);
      } else {
        this->type_data()->alignTypeDataWidth(rtype);
      }
    }
  }
  firDB::firType* firDB::firExpSubindex::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* subindex_exp_type = this->exp()->getTypeData(module, domain);
      updateTypeData(module, subindex_exp_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpSubindex::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* subindex_exp_type = this->exp()->inferDataType(module, domain);
    updateTypeData(module, subindex_exp_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firExp* firDB::firExpSubindex::getExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module);
    fs_assert(this->exp_val() == NULL);
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpSubindex::inferExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module);
    fs_assert(this->exp_val() == NULL);
    return this->exp_val();
  }
  
  void firDB::firExpSubaccess::updateTypeData(firModule* module, firType* subaccess_exp_type, firType* subaccess_access_type) {
    fs_assert(module != NULL);
    if (subaccess_exp_type == NULL || subaccess_access_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (!subaccess_exp_type->isVectorType()) {
      fs_error("*ERROR*: The type of expression '%s' must be vector but it was not.\n", this->toString().c_str());
      fs_assert(0);
    }
    firTypeVector* v_exp_type = dynamic_cast<firTypeVector*>(subaccess_exp_type);
    firType* rtype = v_exp_type->type_data();
    if (!subaccess_access_type->isUIntType()) {
      fs_error("*ERROR*: The index of '%s' must be an expression with an unsigned integer type.\n", this->toString().c_str());
      fs_assert(0);
    }
    if (rtype == NULL) {
      fs_warning("*WARNING*: Failed to update the type of '%s'.\n", this->toString().c_str());
      this->set_type_data(NULL);
    } else {
      if (this->type_data() == NULL || !this->type_data()->isEqual(rtype)) {
        //this->set_type_data(module->copyType(rtype));
        this->set_type_data(rtype);
      } else {
        this->type_data()->alignTypeDataWidth(rtype);
      }
    }
  }
  firDB::firType* firDB::firExpSubaccess::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* subaccess_exp_type = this->exp()->getTypeData(module, domain);
      firType* subaccess_access_type = this->access()->getTypeData(module, domain);
      updateTypeData(module, subaccess_exp_type, subaccess_access_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpSubaccess::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* subaccess_exp_type = this->exp()->inferDataType(module, domain);
    firType* subaccess_access_type = this->access()->inferDataType(module, domain);
    updateTypeData(module, subaccess_exp_type, subaccess_access_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firExp* firDB::firExpSubaccess::getExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module);
    fs_assert(this->exp_val() == NULL);
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpSubaccess::inferExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module);
    fs_assert(this->exp_val() == NULL);
    return this->exp_val();
  }
  
  void firDB::firExpMux::updateTypeData(firModule* module, firType* mux_sel_type, firType* mux_tval_type, firType* mux_fval_type) {
    fs_assert(module != NULL);
    if (mux_sel_type == NULL || mux_tval_type == NULL || mux_fval_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (!mux_sel_type->isUIntType()) {
      fs_error("*ERROR*: The select signal in 'mux' expression '%s' was not 'UInt' type.\n", this->toString().c_str());
      this->set_type_data(NULL);
      return;
    }
    if (!mux_tval_type->isEqual(mux_fval_type)) {
      fs_error("*ERROR*: The types of the two input signals in 'mux' expression '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
      this->set_type_data(NULL);
    } else {
      if (mux_tval_type->isUIntType()) {
        firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
        if (utype_data == NULL) {
          this->set_type_data(module->addTypeUInt(-1));
        }
        this->type_data()->alignTypeDataWidth(mux_tval_type, mux_fval_type);
      } else if (mux_tval_type->isSIntType()) {
        firTypeSInt* stype_data = dynamic_cast<firTypeSInt*>(this->type_data());
        if (stype_data == NULL) {
          this->set_type_data(module->addTypeSInt(-1));
        }
        this->type_data()->alignTypeDataWidth(mux_tval_type, mux_fval_type);
      } else if (mux_tval_type->isAnalogType()) {
        firTypeAnalog* atype_data = dynamic_cast<firTypeAnalog*>(this->type_data());
        if (atype_data == NULL) {
          this->set_type_data(module->addTypeAnalog(-1));
        }
        this->type_data()->alignTypeDataWidth(mux_tval_type, mux_fval_type);
      } else if (mux_tval_type->isAsyncResetType()) {
        firTypeAsyncReset* atype_data = dynamic_cast<firTypeAsyncReset*>(this->type_data());
        if (atype_data == NULL) {
          this->set_type_data(module->addTypeAsyncReset());
        }
      } else if (mux_tval_type->isClockType()) {
        firTypeClock* ctype_data = dynamic_cast<firTypeClock*>(this->type_data());
        if (ctype_data == NULL) {
          this->set_type_data(module->addTypeClock());
        }
      } else if (mux_tval_type->isResetType()) {
        firTypeReset* rtype_data = dynamic_cast<firTypeReset*>(this->type_data());
        if (rtype_data == NULL) {
          this->set_type_data(module->addTypeReset());
        }
      } else if (mux_tval_type->isFixedType()) {
        firTypeFixed* ftype_data = dynamic_cast<firTypeFixed*>(this->type_data());
        if (ftype_data == NULL) {
          this->set_type_data(module->addTypeFixed());
        }
        this->type_data()->alignTypeDataWidth(mux_tval_type, mux_fval_type);
      } else if (mux_tval_type->isIntervalType()) {
        firTypeInterval* itype_data = dynamic_cast<firTypeInterval*>(this->type_data());
        if (itype_data == NULL) {
          this->set_type_data(module->addTypeInterval());
        }
        this->type_data()->alignTypeDataWidth(mux_tval_type, mux_fval_type);
      } else if (mux_tval_type->isVectorType()) {
        firTypeVector* vtype_data = dynamic_cast<firTypeVector*>(this->type_data());
        if (vtype_data == NULL) {
          this->set_type_data(module->copyType(mux_tval_type));
        }
        this->type_data()->alignTypeDataWidth(mux_tval_type, mux_fval_type);
      } else if (mux_tval_type->isBundleType()) {
        firTypeBundle* btype_data = dynamic_cast<firTypeBundle*>(this->type_data());
        if (btype_data == NULL) {
          this->set_type_data(module->copyType(mux_tval_type));
        }
        this->type_data()->alignTypeDataWidth(mux_tval_type, mux_fval_type);
      } else {
        fs_error("*ERROR*: Failed to determine the type of the input in 'mux' expression '%s'.\n", this->toString().c_str());
        this->set_type_data(NULL);
      }
    }
    return;
  }
  firDB::firType* firDB::firExpMux::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* mux_sel_type = this->sel()->getTypeData(module, domain);
      firType* mux_tval_type = this->input1()->getTypeData(module, domain);
      firType* mux_fval_type = this->input2()->getTypeData(module, domain);
      updateTypeData(module, mux_sel_type, mux_tval_type, mux_fval_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpMux::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* mux_sel_type = this->sel()->inferDataType(module, domain);
    firType* mux_tval_type = this->input1()->inferDataType(module, domain);
    firType* mux_fval_type = this->input2()->inferDataType(module, domain);
    updateTypeData(module, mux_sel_type, mux_tval_type, mux_fval_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpMux::updateExpVal(firModule* module, firExp* mux_sel_value, firExp* mux_tval_value, firExp* mux_fval_value) {
    fs_assert(module != NULL);
    firExp* result_val = NULL;
    if (mux_sel_value != NULL) {
      firExpUIntBits* sel_uintbits = dynamic_cast<firExpUIntBits*>(mux_sel_value);
      Big* sel_big = sel_uintbits->big_value()->getBig();
      if (!mux_sel_value->isUIntBitsExpression()) {
        fs_error("*ERROR*: The select signal value in MUX expression '%s' was not 'UIntBits' type.\n", mux_sel_value->toString().c_str());
        this->set_type_data(NULL);
        return;
      }
      if ((*sel_big) == Big(1)) {
        if (mux_tval_value == NULL) {
          this->set_type_data(NULL);
          return;
        }
        firDB::firType* fval_exp_type = this->input2()->type_data();
        fs_assert(fval_exp_type != NULL);
        if (mux_tval_value->isUIntBitsExpression()) {
          firDB::firTypeUInt* u_fval_type = dynamic_cast<firDB::firTypeUInt*>(fval_exp_type);
          fs_assert(u_fval_type != NULL);
          unsigned int fval_width = u_fval_type->width();
          firExpUIntBits* tval_uintbits = dynamic_cast<firExpUIntBits*>(mux_tval_value);
          std::string hex_value = tval_uintbits->big_value()->getHexadecimalValue();
          unsigned int result_width = tval_uintbits->width();
          result_val = module->addExpUIntBits(hex_value, std::max(result_width, fval_width));
        } else if (mux_tval_value->isSIntBitsExpression()) {
          firDB::firTypeSInt* s_fval_type = dynamic_cast<firDB::firTypeSInt*>(fval_exp_type);
          fs_assert(s_fval_type != NULL);
          unsigned int fval_width = s_fval_type->width();
          firExpSIntBits* tval_sintbits = dynamic_cast<firExpSIntBits*>(mux_tval_value);
          std::string hex_value = tval_sintbits->big_value()->getHexadecimalValue();
          unsigned int result_width = tval_sintbits->width();
          result_val = module->addExpSIntBits(hex_value, std::max(result_width, fval_width));
        } else {
          fs_error("*ERROR*: Illegal value '%s' of true expression in MUX operation '%s'.\n", mux_tval_value->toString().c_str(), this->toString().c_str());
        }
      } else if ((*sel_big) == Big(0)) {
        if (mux_fval_value == NULL) {
          this->set_type_data(NULL);
          return;
        }
        firDB::firType* tval_exp_type = this->input1()->type_data();
        fs_assert(tval_exp_type != NULL);
        if (mux_fval_value->isUIntBitsExpression()) {
          firDB::firTypeUInt* u_tval_type = dynamic_cast<firDB::firTypeUInt*>(tval_exp_type);
          fs_assert(u_tval_type != NULL);
          unsigned int tval_width = u_tval_type->width();
          firExpUIntBits* fval_uintbits = dynamic_cast<firExpUIntBits*>(mux_fval_value);
          std::string hex_value = fval_uintbits->big_value()->getHexadecimalValue();
          unsigned int result_width = fval_uintbits->width();
          result_val = module->addExpUIntBits(hex_value, std::max(result_width, tval_width));
        } else if (mux_fval_value->isSIntBitsExpression()) {
          firDB::firTypeSInt* s_tval_type = dynamic_cast<firDB::firTypeSInt*>(tval_exp_type);
          fs_assert(s_tval_type != NULL);
          unsigned int tval_width = s_tval_type->width();
          firExpSIntBits* fval_sintbits = dynamic_cast<firExpSIntBits*>(mux_fval_value);
          std::string hex_value = fval_sintbits->big_value()->getHexadecimalValue();
          unsigned int result_width = fval_sintbits->width();
          result_val = module->addExpSIntBits(hex_value, std::max(result_width, tval_width));
        } else {
          fs_error("*ERROR*: Illegal value '%s' of false expression in MUX operation '%s'.\n", mux_fval_value->toString().c_str(), this->toString().c_str());
        }
      }
    } else {
      if (mux_tval_value == NULL || mux_fval_value == NULL) {
        this->set_type_data(NULL);
        return;
      }
      BigInt* big_tval = NULL;
      BigInt* big_fval = NULL;
      unsigned int tval_width = 0;
      unsigned int fval_width = 0;
      bool is_signed = false;
      if (mux_tval_value->isUIntBitsExpression()) {
        firExpUIntBits* tval_uintbits = dynamic_cast<firExpUIntBits*>(mux_tval_value);
        big_tval = tval_uintbits->big_value();
        tval_width = tval_uintbits->width();
      } else if (mux_tval_value->isSIntBitsExpression()) {
        is_signed = true;
        firExpSIntBits* tval_sintbits = dynamic_cast<firExpSIntBits*>(mux_tval_value);
        big_tval = tval_sintbits->big_value();
        fval_width = tval_sintbits->width();
      } else {
        fs_error("*ERROR*: Illegal value '%s' of true expression in MUX operation '%s'.\n", mux_tval_value->toString().c_str(), this->toString().c_str());
      }
      if (mux_fval_value->isUIntBitsExpression()) {
        firExpUIntBits* fval_uintbits = dynamic_cast<firExpUIntBits*>(mux_fval_value);
        big_fval = fval_uintbits->big_value();
        fval_width = fval_uintbits->width();
        if ((*big_tval->getBig()) == (*big_fval->getBig())) {
          string hex_value = big_tval->getHexadecimalValue();
          result_val = module->addExpUIntBits(hex_value, max(tval_width, fval_width));
        }
      } else if (mux_fval_value->isSIntBitsExpression()) {
        firExpSIntBits* fval_sintbits = dynamic_cast<firExpSIntBits*>(mux_fval_value);
        big_fval = fval_sintbits->big_value();
        fval_width = fval_sintbits->width();
        if ((*big_tval->getBig()) == (*big_fval->getBig())) {
          string hex_value = big_tval->getHexadecimalValue();
          result_val = module->addExpSIntBits(hex_value, max(tval_width, fval_width));
        }
      } else {
        fs_error("*ERROR*: Illegal value '%s' of false expression in MUX operation '%s'.\n", mux_fval_value->toString().c_str(), this->toString().c_str());
      }
    }
    this->set_exp_val(result_val);
    return;
  }
  firDB::firExp* firDB::firExpMux::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->exp_val() == NULL) {
      firExp* mux_sel_val = this->sel()->getExpVal(module, domain);
      firExp* mux_tval_val = this->input1()->getExpVal(module, domain);
      firExp* mux_fval_val = this->input2()->getExpVal(module, domain);
      updateExpVal(module, mux_sel_val, mux_tval_val, mux_fval_val);
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpMux::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* mux_sel_val = this->sel()->inferExpVal(module, domain);
    firExp* mux_tval_val = this->input1()->inferExpVal(module, domain);
    firExp* mux_fval_val = this->input2()->inferExpVal(module, domain);
    updateExpVal(module, mux_sel_val, mux_tval_val, mux_fval_val);
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpValidif::updateTypeData(firModule* module, firType* validif_valid_type, firType* validif_exp_type) {
    fs_assert(module != NULL);
    if (validif_valid_type == NULL || validif_exp_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (!validif_valid_type->isUIntType()) {
      fs_error("*ERROR*: The type of the valid signal in 'validif' expression '%s' was not 'UInt'.\n", this->toString().c_str());
      this->set_type_data(NULL);
    } else {
      if (validif_exp_type->isUIntType()) {
        firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
        if (utype_data == NULL) {
          this->set_type_data(module->addTypeUInt(-1));
        }
        this->type_data()->alignTypeDataWidth(validif_exp_type);
      } else if (validif_exp_type->isSIntType()) {
        firTypeSInt* stype_data = dynamic_cast<firTypeSInt*>(this->type_data());
        if (stype_data == NULL) {
          this->set_type_data(module->addTypeSInt(-1));
        }
        this->type_data()->alignTypeDataWidth(validif_exp_type);
      } else if (validif_exp_type->isAnalogType()) {
        firTypeAnalog* atype_data = dynamic_cast<firTypeAnalog*>(this->type_data());
        if (atype_data == NULL) {
          this->set_type_data(module->addTypeAnalog(-1));
        }
        this->type_data()->alignTypeDataWidth(validif_exp_type);
      } else if (validif_exp_type->isAsyncResetType()) {
        firTypeAsyncReset* atype_data = dynamic_cast<firTypeAsyncReset*>(this->type_data());
        if (atype_data == NULL) {
          this->set_type_data(module->addTypeAsyncReset());
        }
      } else if (validif_exp_type->isClockType()) {
        firTypeClock* ctype_data = dynamic_cast<firTypeClock*>(this->type_data());
        if (ctype_data == NULL) {
          this->set_type_data(module->addTypeClock());
        }
      } else if (validif_exp_type->isResetType()) {
        firTypeReset* rtype_data = dynamic_cast<firTypeReset*>(this->type_data());
        if (rtype_data == NULL) {
          this->set_type_data(module->addTypeReset());
        }
      } else if (validif_exp_type->isFixedType()) {
        firTypeFixed* ftype_data = dynamic_cast<firTypeFixed*>(this->type_data());
        if (ftype_data == NULL) {
          this->set_type_data(module->addTypeFixed());
        }
        this->type_data()->alignTypeDataWidth(validif_exp_type);
      } else if (validif_exp_type->isIntervalType()) {
        firTypeInterval* itype_data = dynamic_cast<firTypeInterval*>(this->type_data());
        if (itype_data == NULL) {
          this->set_type_data(module->addTypeInterval());
        }
        this->type_data()->alignTypeDataWidth(validif_exp_type);
      } else if (validif_exp_type->isVectorType()) {
        firTypeVector* vtype_data = dynamic_cast<firTypeVector*>(this->type_data());
        if (vtype_data == NULL) {
          this->set_type_data(module->copyType(validif_exp_type));
        } else {
          this->type_data()->alignTypeDataWidth(validif_exp_type);
        }
      } else if (validif_exp_type->isBundleType()) {
        firTypeBundle* btype_data = dynamic_cast<firTypeBundle*>(this->type_data());
        if (btype_data == NULL) {
          this->set_type_data(module->copyType(validif_exp_type));
        }
        this->type_data()->alignTypeDataWidth(validif_exp_type);
      } else {
        fs_error("*ERROR*: Failed to determine the type of the input in 'validif' expression '%s'.\n", this->toString().c_str());
        this->set_type_data(NULL);
      }
    }
  }
  firDB::firType* firDB::firExpValidif::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* validif_valid_type = this->valid()->getTypeData(module, domain);
      firType* validif_exp_type = this->exp()->getTypeData(module, domain);
      updateTypeData(module, validif_valid_type, validif_exp_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpValidif::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* validif_valid_type = this->valid()->inferDataType(module, domain);
    firType* validif_exp_type = this->exp()->inferDataType(module, domain);
    updateTypeData(module, validif_valid_type, validif_exp_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpValidif::updateExpVal(firModule* module, firExp* validif_valid_val, firExp* validif_exp_val) {
    fs_assert(module != NULL);
    if (validif_valid_val == NULL || validif_exp_val == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (!validif_valid_val->isUIntBitsExpression()) {
      fs_error("*ERROR*: The valid signal value in Validif expression '%s' was not 'UIntBits' type.\n", this->toString().c_str());
      this->set_type_data(NULL);
      return;
    }
    firExpUIntBits* valid_uintbits = dynamic_cast<firExpUIntBits*>(validif_valid_val);
    Big* valid_big = valid_uintbits->big_value()->getBig();
    firExp* result_val = NULL;
    if ((*valid_big) == Big(1)) {
      if (validif_exp_val->isUIntBitsExpression()) {
        firExpUIntBits* exp_uintbits = dynamic_cast<firExpUIntBits*>(validif_exp_val);
        std::string hex_value = exp_uintbits->big_value()->getHexadecimalValue();
        unsigned int result_width = exp_uintbits->width();
        result_val = module->addExpUIntBits(hex_value, result_width);
      } else if (validif_exp_val->isSIntBitsExpression()) {
        firExpSIntBits* exp_sintbits = dynamic_cast<firExpSIntBits*>(validif_exp_val);
        std::string hex_value = exp_sintbits->big_value()->getHexadecimalValue();
        unsigned int result_width = exp_sintbits->width();
        result_val = module->addExpSIntBits(hex_value, result_width);
      } else {
        fs_error("*ERROR*: Illegal expression value '%s' of true expression in Validif operation '%s'.\n", validif_exp_val->toString().c_str(), this->toString().c_str());
      }
    } else {
      fs_warning("*WARNING*: The value of valid expression in Validif statement should be '1 or undetermined'.\n");
    }
    this->set_exp_val(result_val);
    return;
  }
  firDB::firExp* firDB::firExpValidif::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->exp_val() == NULL) {
      firExp* validif_valid_val = this->valid()->getExpVal(module, domain);
      firExp* validif_exp_val = this->exp()->getExpVal(module, domain);
      updateExpVal(module, validif_valid_val, validif_exp_val);
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpValidif::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* validif_valid_val = this->valid()->inferExpVal(module, domain);
    firExp* validif_exp_val = this->exp()->inferExpVal(module, domain);
    updateExpVal(module, validif_valid_val, validif_exp_val);
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firAdd::updateTypeData(firModule* module, firType* add_exp1_type, firType* add_exp2_type) {
    fs_assert(module != NULL);
    if (add_exp1_type == NULL || add_exp2_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (!add_exp1_type->isEqual(add_exp2_type)) {
      fs_error("*ERROR*: The types of the two inputs in 'add' operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
      this->set_type_data(NULL);
    } else {
      if (add_exp1_type->isUIntType()) {
        if (dynamic_cast<firTypeUInt*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeUInt(-1));
        }
        firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
        firTypeUInt* utype1 = dynamic_cast<firTypeUInt*>(add_exp1_type);
        firTypeUInt* utype2 = dynamic_cast<firTypeUInt*>(add_exp2_type);
        utype_data->reset();
        if (utype1->valid_width() && utype2->valid_width()) {
          int width = std::max(utype1->width(), utype2->width()) + 1;
          utype_data->set_width(width);
        } else if (utype1->valid_width() && !utype2->valid_width()) {
          int width = utype1->width() + 1;
          utype_data->set_width(width);
        } else if (!utype1->valid_width() && utype2->valid_width()) {
          int width = utype2->width() + 1;
          utype_data->set_width(width);
        }
      } else if (add_exp1_type->isSIntType()) {
        if (dynamic_cast<firTypeSInt*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeSInt(-1));
        }
        firTypeSInt* stype_data = dynamic_cast<firTypeSInt*>(this->type_data());
        firTypeSInt* stype1 = dynamic_cast<firTypeSInt*>(add_exp1_type);
        firTypeSInt* stype2 = dynamic_cast<firTypeSInt*>(add_exp2_type);
        stype_data->reset();
        if (stype1->valid_width() && stype2->valid_width()) {
          int width = std::max(stype1->width(), stype2->width()) + 1;
          stype_data->set_width(width);
        } else if (stype1->valid_width() && !stype2->valid_width()) {
          int width = stype1->width() + 1;
          stype_data->set_width(width);
        } else if (!stype1->valid_width() && stype2->valid_width()) {
          int width = stype2->width() + 1;
          stype_data->set_width(width);
        }
      } else if (add_exp1_type->isFixedType()) {
        if (dynamic_cast<firTypeFixed*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeFixed());
        }
        firTypeFixed* ftype_data = dynamic_cast<firTypeFixed*>(this->type_data());
        firTypeFixed* ftype1 = dynamic_cast<firTypeFixed*>(add_exp1_type);
        firTypeFixed* ftype2 = dynamic_cast<firTypeFixed*>(add_exp2_type);
        ftype_data->reset();
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
        int width = binary_point + std::max((w1 - bp1), (w2 - bp2)) + 1;
        ftype_data->set_binary_point(binary_point);
        if (width > 0) {
          ftype_data->set_width(width);
        }
      } else if (add_exp1_type->isIntervalType()) {
        if (dynamic_cast<firTypeInterval*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeInterval());
        }
        firTypeInterval* itype_data = dynamic_cast<firTypeInterval*>(this->type_data());
        firTypeInterval* itype1 = dynamic_cast<firTypeInterval*>(add_exp1_type);
        firTypeInterval* itype2 = dynamic_cast<firTypeInterval*>(add_exp2_type);
        itype_data->reset();
        bool valid_value1 = itype1->trimInterval();
        bool valid_value2 = itype2->trimInterval();
        if (valid_value1 && valid_value2) {
          double lower = itype1->lower_value() + itype2->lower_value();
          double upper = itype1->upper_value() + itype2->upper_value();
          int binary = std::max(itype1->binary(), itype2->binary());
          itype_data->set_value('[', lower, upper, ']', binary);
        } else if (valid_value1 && !valid_value2) {
          double lower = itype1->lower_value();
          double upper = itype1->upper_value();
          int binary = itype1->binary();
          itype_data->set_value('[', lower, upper, ']', binary);
        } else if (!valid_value1 && valid_value2) {
          double lower = itype2->lower_value();
          double upper = itype2->upper_value();
          int binary = itype2->binary();
          itype_data->set_value('[', lower, upper, ']', binary);
        }
      } else {
        fs_error("*ERROR*: Failed to determine the type of the input in 'add' expression '%s'.\n", this->toString().c_str());
        this->set_type_data(NULL);
      }
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firAdd::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* add_exp1_type = this->exp1()->getTypeData(module, domain);
      firType* add_exp2_type = this->exp2()->getTypeData(module, domain);
      updateTypeData(module, add_exp1_type, add_exp2_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firAdd::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* add_exp1_type = this->exp1()->inferDataType(module, domain);
    firType* add_exp2_type = this->exp2()->inferDataType(module, domain);
    updateTypeData(module, add_exp1_type, add_exp2_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firAdd::updateExpVal(firModule* module, firExp* add_exp1_value, firExp* add_exp2_value) {
    fs_assert(module);
    // get bigint1
    if (add_exp1_value == NULL) {
      //fs_error("*ERROR*: The left expression in ADD operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_left = UINT_MAX;
    BigInt* big_left = NULL;
    bool signed_left = false;
    if (add_exp1_value->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits1 = dynamic_cast<firExpUIntBits*>(add_exp1_value);
      width_left = uint_bits1->width();
      big_left = uint_bits1->big_value();
      signed_left = false;
    } else if (add_exp1_value->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(add_exp1_value);
      width_left = sint_bits1->width();
      big_left = sint_bits1->big_value();
      signed_left = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of left expression in ADD operation '%s'.\n", add_exp1_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_left == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of left expression value '%s' in ADD operation '%s'.\n", add_exp1_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // get bigint2
    if (add_exp2_value == NULL) {
      //fs_error("*ERROR*: The right expression in ADD operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_right = INT_MAX;
    BigInt* big_right = NULL;
    bool signed_right = false;
    if (add_exp2_value->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits2 = dynamic_cast<firExpUIntBits*>(add_exp2_value);
      width_right = uint_bits2->width();
      big_right = uint_bits2->big_value();
      signed_right = false;
    } else if (add_exp2_value->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits2 = dynamic_cast<firExpSIntBits*>(add_exp2_value);
      width_right = sint_bits2->width();
      big_right = sint_bits2->big_value();
      signed_right = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of right expression in ADD operation '%s'.\n", add_exp2_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_right == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of right expression value '%s' in ADD operation '%s'.\n", add_exp2_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // calculate value result
    std::string add_result_value = big_left->add(big_right);
    int add_width = std::max(width_left, width_right) + 1;
    firExp* add_result_exp = NULL;
    if (signed_left == true && signed_right == true) {
      add_result_exp = module->addExpSIntBits(add_result_value, add_width);
    } else if (signed_left == false && signed_right == false) {
      add_result_exp = module->addExpUIntBits(add_result_value, add_width);
    } else {
      fs_error("*ERROR*: The types of the two inputs in ADD operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
    }
    this->set_exp_val(add_result_exp);
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firAdd::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* add_exp1 = this->exp1();
    if (add_exp1 == NULL) {
      fs_error("*ERROR*: The left expression in ADD operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* add_exp2 = this->exp2();
    if (add_exp2 == NULL) {
      fs_error("*ERROR*: The right expression in ADD operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* add_exp1_value = add_exp1->getExpVal(module, domain);
      firExp* add_exp2_value = add_exp2->getExpVal(module, domain);
      this->updateExpVal(module, add_exp1_value, add_exp2_value);
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firAdd::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* add_exp1 = this->exp1();
    if (add_exp1 == NULL) {
      fs_error("*ERROR*: The left expression in ADD operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* add_exp2 = this->exp2();
    if (add_exp2 == NULL) {
      fs_error("*ERROR*: The right expression in ADD operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* add_exp1_value = add_exp1->inferExpVal(module, domain);
    firExp* add_exp2_value = add_exp2->inferExpVal(module, domain);
    this->updateExpVal(module, add_exp1_value, add_exp2_value);
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firSub::updateTypeData(firModule* module, firType* sub_exp1_type, firType* sub_exp2_type) {
    fs_assert(module != NULL);
    if (sub_exp1_type == NULL || sub_exp2_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (!sub_exp1_type->isEqual(sub_exp2_type)) {
      fs_error("*ERROR*: The types of the two inputs in 'sub' operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
      this->set_type_data(NULL);
    } else {
      if (sub_exp1_type->isUIntType()) {
        if (dynamic_cast<firTypeUInt*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeUInt(-1));
        }
        firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
        firTypeUInt* utype1 = dynamic_cast<firTypeUInt*>(sub_exp1_type);
        firTypeUInt* utype2 = dynamic_cast<firTypeUInt*>(sub_exp2_type);
        utype_data->reset();
        if (utype1->valid_width() && utype2->valid_width()) {
          int width = std::max(utype1->width(), utype2->width()) + 1;
          utype_data->set_width(width);
        } else if (utype1->valid_width() && !utype2->valid_width()) {
          int width = utype1->width() + 1;
          utype_data->set_width(width);
        } else if (!utype1->valid_width() && utype2->valid_width()) {
          int width = utype2->width() + 1;
          utype_data->set_width(width);
        }
      } else if (sub_exp1_type->isSIntType()) {
        if (dynamic_cast<firTypeSInt*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeSInt(-1));
        }
        firTypeSInt* stype_data = dynamic_cast<firTypeSInt*>(this->type_data());
        firTypeSInt* stype1 = dynamic_cast<firTypeSInt*>(sub_exp1_type);
        firTypeSInt* stype2 = dynamic_cast<firTypeSInt*>(sub_exp2_type);
        stype_data->reset();
        if (stype1->valid_width() && stype2->valid_width()) {
          int width = std::max(stype1->width(), stype2->width()) + 1;
          stype_data->set_width(width);
        } else if (stype1->valid_width() && !stype2->valid_width()) {
          int width = stype1->width() + 1;
          stype_data->set_width(width);
        } else if (!stype1->valid_width() && stype2->valid_width()) {
          int width = stype2->width() + 1;
          stype_data->set_width(width);
        }
      } else if (sub_exp1_type->isFixedType()) {
        if (dynamic_cast<firTypeFixed*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeFixed());
        }
        firTypeFixed* ftype_data = dynamic_cast<firTypeFixed*>(this->type_data());
        firTypeFixed* ftype1 = dynamic_cast<firTypeFixed*>(sub_exp1_type);
        firTypeFixed* ftype2 = dynamic_cast<firTypeFixed*>(sub_exp2_type);
        ftype_data->reset();
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
        int width = binary_point + std::max((w1 - bp1), (w2 - bp2)) + 1;
        ftype_data->set_binary_point(binary_point);
        if (width > 0) {
          ftype_data->set_width(width);
        }
      } else if (sub_exp1_type->isIntervalType()) {
        if (dynamic_cast<firTypeInterval*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeInterval());
        }
        firTypeInterval* itype_data = dynamic_cast<firTypeInterval*>(this->type_data());
        firTypeInterval* itype1 = dynamic_cast<firTypeInterval*>(sub_exp1_type);
        firTypeInterval* itype2 = dynamic_cast<firTypeInterval*>(sub_exp2_type);
        itype_data->reset();
        bool valid_value1 = itype1->trimInterval();
        bool valid_value2 = itype2->trimInterval();
        if (valid_value1 && valid_value2) {
          double lower = itype1->lower_value() - itype2->lower_value();
          double upper = itype1->upper_value() - itype2->upper_value();
          int binary = std::max(itype1->binary(), itype2->binary());
          itype_data->set_value('[', lower, upper, ']', binary);
        } else if (valid_value1 && !valid_value2) {
          double lower = itype1->lower_value();
          double upper = itype1->upper_value();
          int binary = itype1->binary();
          itype_data->set_value('[', lower, upper, ']', binary);
        } else if (!valid_value1 && valid_value2) {
          double lower = itype2->lower_value();
          double upper = itype2->upper_value();
          int binary = itype2->binary();
          itype_data->set_value('[', lower, upper, ']', binary);
        }
      } else {
        fs_error("*ERROR*: Failed to determine the type of the input in 'sub' expression '%s'.\n", this->toString().c_str());
        this->set_type_data(NULL);
      }
    }
    return;
  }
  firDB::firType* firDB::firExpPrimOperation::firSub::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* sub_exp1_type = this->exp1()->getTypeData(module, domain);
      firType* sub_exp2_type = this->exp2()->getTypeData(module, domain);
      updateTypeData(module, sub_exp1_type, sub_exp2_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firSub::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* sub_exp1_type = this->exp1()->inferDataType(module, domain);
    firType* sub_exp2_type = this->exp2()->inferDataType(module, domain);
    updateTypeData(module, sub_exp1_type, sub_exp2_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firSub::updateExpVal(firModule* module, firExp* sub_exp1_value, firExp* sub_exp2_value) {
    fs_assert(module);
    if (sub_exp1_value == NULL && sub_exp2_value == NULL) {
      firDB::firExp* sub_exp1 = this->exp1();
      firDB::firExp* sub_exp2 = this->exp2();
      if (sub_exp1->isSameExpression(sub_exp2)) {
        std::string sub_result_value = "h0";
        firDB::firType* sub_type = this->type_data();
        firDB::firExp* sub_result_exp = NULL;
        if (sub_type->isSIntType()) {
          firDB::firTypeSInt* s_sub_type = dynamic_cast<firDB::firTypeSInt*>(sub_type);
          fs_assert(s_sub_type != NULL);
          int sub_width = s_sub_type->width();
          sub_result_exp = module->addExpSIntBits(sub_result_value, sub_width);
        } else if (sub_type->isUIntType()) {
          firDB::firTypeUInt* u_sub_type = dynamic_cast<firDB::firTypeUInt*>(sub_type);
          fs_assert(u_sub_type != NULL);
          int sub_width = u_sub_type->width();
          sub_result_exp = module->addExpUIntBits(sub_result_value, sub_width);
        }
        this->set_exp_val(sub_result_exp);
        return;
      } else {
        this->set_exp_val(NULL);
        return;
      }
    }
    // get bigint1
    if (sub_exp1_value == NULL) {
      //fs_error("*ERROR*: The left expression in SUB operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_left = UINT_MAX;
    BigInt* big_left = NULL;
    bool signed_left = false;
    if (sub_exp1_value->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits1 = dynamic_cast<firExpUIntBits*>(sub_exp1_value);
      width_left = uint_bits1->width();
      big_left = uint_bits1->big_value();
      signed_left = false;
    } else if (sub_exp1_value->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(sub_exp1_value);
      width_left = sint_bits1->width();
      big_left = sint_bits1->big_value();
      signed_left = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of left expression in SUB operation '%s'.\n", sub_exp1_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_left == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of left expression value '%s' in SUB operation '%s'.\n", sub_exp1_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // get bigint2
    if (sub_exp2_value == NULL) {
      //fs_error("*ERROR*: The right expression in SUB operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_right = INT_MAX;
    BigInt* big_right = NULL;
    bool signed_right = false;
    if (sub_exp2_value->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits2 = dynamic_cast<firExpUIntBits*>(sub_exp2_value);
      width_right = uint_bits2->width();
      big_right = uint_bits2->big_value();
      signed_right = false;
    } else if (sub_exp2_value->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits2 = dynamic_cast<firExpSIntBits*>(sub_exp2_value);
      width_right = sint_bits2->width();
      big_right = sint_bits2->big_value();
      signed_right = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of right expression in SUB operation '%s'.\n", sub_exp2_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_right == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of right expression value '%s' in SUB operation '%s'.\n", sub_exp2_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // calculate value result
    std::string sub_result_value = big_left->sub(big_right);
    int sub_width = std::max(width_left, width_right) + 1;
    firExp* sub_result_exp = NULL;
    if (signed_left == true && signed_right == true) {
      sub_result_exp = module->addExpSIntBits(sub_result_value, sub_width);
    } else if (signed_left == false && signed_right == false) {
      sub_result_exp = module->addExpUIntBits(sub_result_value, sub_width);
    } else {
      fs_error("*ERROR*: The types of the two inputs in SUB operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
    }
    this->set_exp_val(sub_result_exp);
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firSub::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* sub_exp1 = this->exp1();
    if (sub_exp1 == NULL) {
      fs_error("*ERROR*: The left expression in SUB operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* sub_exp2 = this->exp2();
    if (sub_exp2 == NULL) {
      fs_error("*ERROR*: The right expression in SUB operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* sub_exp1_value = sub_exp1->getExpVal(module, domain);
      firExp* sub_exp2_value = sub_exp2->getExpVal(module, domain);
      this->updateExpVal(module, sub_exp1_value, sub_exp2_value);
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firSub::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* sub_exp1 = this->exp1();
    if (sub_exp1 == NULL) {
      fs_error("*ERROR*: The left expression in SUB operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* sub_exp2 = this->exp2();
    if (sub_exp2 == NULL) {
      fs_error("*ERROR*: The right expression in SUB operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* sub_exp1_value = sub_exp1->inferExpVal(module, domain);
    firExp* sub_exp2_value = sub_exp2->inferExpVal(module, domain);
    this->updateExpVal(module, sub_exp1_value, sub_exp2_value);
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firMul::updateTypeData(firModule* module, firType* mul_exp1_type, firType* mul_exp2_type) {
    fs_assert(module != NULL);
    if (mul_exp1_type == NULL || mul_exp2_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (!mul_exp1_type->isEqual(mul_exp2_type)) {
      fs_error("*ERROR*: The types of the two inputs in 'mul' operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
      this->set_type_data(NULL);
    } else {
      if (mul_exp1_type->isUIntType()) {
        if (dynamic_cast<firTypeUInt*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeUInt(-1));
        }
        firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
        firTypeUInt* utype1 = dynamic_cast<firTypeUInt*>(mul_exp1_type);
        firTypeUInt* utype2 = dynamic_cast<firTypeUInt*>(mul_exp2_type);
        utype_data->reset();
        if (utype1->valid_width() && utype2->valid_width()) {
          int width = utype1->width() + utype2->width();
          utype_data->set_width(width);
        } else if (utype1->valid_width() && !utype2->valid_width()) {
          int width = utype1->width();
          utype_data->set_width(width);
        } else if (!utype1->valid_width() && utype2->valid_width()) {
          int width = utype2->width();
          utype_data->set_width(width);
        }
      } else if (mul_exp1_type->isSIntType()) {
        if (dynamic_cast<firTypeSInt*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeSInt(-1));
        }
        firTypeSInt* stype_data = dynamic_cast<firTypeSInt*>(this->type_data());
        firTypeSInt* stype1 = dynamic_cast<firTypeSInt*>(mul_exp1_type);
        firTypeSInt* stype2 = dynamic_cast<firTypeSInt*>(mul_exp2_type);
        stype_data->reset();
        if (stype1->valid_width() && stype2->valid_width()) {
          int width = stype1->width() + stype2->width();
          stype_data->set_width(width);
        } else if (stype1->valid_width() && !stype2->valid_width()) {
          int width = stype1->width();
          stype_data->set_width(width);
        } else if (!stype1->valid_width() && stype2->valid_width()) {
          int width = stype2->width();
          stype_data->set_width(width);
        }
      } else if (mul_exp1_type->isFixedType()) {
        if (dynamic_cast<firTypeFixed*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeFixed());
        }
        firTypeFixed* ftype_data = dynamic_cast<firTypeFixed*>(this->type_data());
        firTypeFixed* ftype1 = dynamic_cast<firTypeFixed*>(mul_exp1_type);
        firTypeFixed* ftype2 = dynamic_cast<firTypeFixed*>(mul_exp2_type);
        ftype_data->reset();
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
        int binary_point = bp1 + bp2;
        int width = w1 + w2;
        ftype_data->set_binary_point(binary_point);
        if (width > 0) {
          ftype_data->set_width(width);
        }
      } else if (mul_exp1_type->isIntervalType()) {
        if (dynamic_cast<firTypeInterval*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeInterval());
        }
        firTypeInterval* itype_data = dynamic_cast<firTypeInterval*>(this->type_data());
        firTypeInterval* itype1 = dynamic_cast<firTypeInterval*>(mul_exp1_type);
        firTypeInterval* itype2 = dynamic_cast<firTypeInterval*>(mul_exp2_type);
        itype_data->reset();
        bool valid_value1 = itype1->trimInterval();
        bool valid_value2 = itype2->trimInterval();
        if (valid_value1 && valid_value2) {
          double l1 = itype1->lower_value();
          double u1 = itype1->upper_value();
          double l2 = itype2->lower_value();
          double u2 = itype2->upper_value();
          double lower = std::min({ l1*l2, l1*u2, u1*l2, u1*u2 });
          double upper = std::max({ l1*l2, l1*u2, u1*l2, u1*u2 });
          int binary = itype1->binary() + itype2->binary();
          itype_data->set_value('[', lower, upper, ']', binary);
        } else if (valid_value1 && !valid_value2) {
          double lower = itype1->lower_value();
          double upper = itype1->upper_value();
          int binary = itype1->binary();
          itype_data->set_value('[', lower, upper, ']', binary);
        } else if (!valid_value1 && valid_value2) {
          double lower = itype2->lower_value();
          double upper = itype2->upper_value();
          int binary = itype2->binary();
          itype_data->set_value('[', lower, upper, ']', binary);
        }
      } else {
        fs_error("*ERROR*: Failed to determine the type of the input in 'mul' expression '%s'.\n", this->toString().c_str());
        this->set_type_data(NULL);
      }
    }
    return;
  }
  firDB::firType* firDB::firExpPrimOperation::firMul::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* mul_exp1_type = this->exp1()->getTypeData(module, domain);
      firType* mul_exp2_type = this->exp2()->getTypeData(module, domain);
      updateTypeData(module, mul_exp1_type, mul_exp2_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firMul::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* mul_exp1_type = this->exp1()->inferDataType(module, domain);
    firType* mul_exp2_type = this->exp2()->inferDataType(module, domain);
    updateTypeData(module, mul_exp1_type, mul_exp2_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firMul::updateExpVal(firModule* module, firExp* mul_exp1_value, firExp* mul_exp2_value) {
    fs_assert(module);
    // get bigint1
    unsigned int width_left = UINT_MAX;
    BigInt* big_left = NULL;
    bool signed_left = false;
    if (mul_exp1_value != NULL) {
      if (mul_exp1_value->isUIntBitsExpression()) {
        firExpUIntBits* uint_bits1 = dynamic_cast<firExpUIntBits*>(mul_exp1_value);
        width_left = uint_bits1->width();
        big_left = uint_bits1->big_value();
        signed_left = false;
      } else if (mul_exp1_value->isSIntBitsExpression()) {
        firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(mul_exp1_value);
        width_left = sint_bits1->width();
        big_left = sint_bits1->big_value();
        signed_left = true;
      } else {
        fs_error("*ERROR*: Illegal value '%s' of left expression in MUL operation '%s'.\n", mul_exp1_value->toString().c_str(), this->toString().c_str());
        this->set_exp_val(NULL);
        return;
      }
      if (big_left == NULL) {
        fs_error("*ERROR*: Failed to get the BigInt value of left expression value '%s' in MUL operation '%s'.\n", mul_exp1_value->toString().c_str(), this->toString().c_str());
        this->set_exp_val(NULL);
        return;
      }
    }
    // get bigint2
    unsigned int width_right = INT_MAX;
    BigInt* big_right = NULL;
    bool signed_right = false;
    if (mul_exp2_value != NULL) {
      if (mul_exp2_value->isUIntBitsExpression()) {
        firExpUIntBits* uint_bits2 = dynamic_cast<firExpUIntBits*>(mul_exp2_value);
        width_right = uint_bits2->width();
        big_right = uint_bits2->big_value();
        signed_right = false;
      } else if (mul_exp2_value->isSIntBitsExpression()) {
        firExpSIntBits* sint_bits2 = dynamic_cast<firExpSIntBits*>(mul_exp2_value);
        width_right = sint_bits2->width();
        big_right = sint_bits2->big_value();
        signed_right = true;
      } else {
        fs_error("*ERROR*: Illegal value '%s' of right expression in MUL operation '%s'.\n", mul_exp2_value->toString().c_str(), this->toString().c_str());
        this->set_exp_val(NULL);
        return;
      }
      if (big_right == NULL) {
        fs_error("*ERROR*: Failed to get the BigInt value of right expression value '%s' in MUL operation '%s'.\n", mul_exp2_value->toString().c_str(), this->toString().c_str());
        this->set_exp_val(NULL);
        return;
      }
    }
    if (mul_exp1_value == NULL && mul_exp2_value == NULL) {
      this->set_exp_val(NULL);
      return;
    } else {
      // calculate value result
      std::string mul_result_value;
      int mul_width;
      if (mul_exp1_value == NULL && big_right->eq(0)) {
        mul_result_value = "h0";
        firDB::firType* mul_type = this->type_data();
        if (signed_right) {
          firDB::firTypeSInt* s_mul_type = dynamic_cast<firDB::firTypeSInt*>(mul_type);
          if (s_mul_type == NULL) {
            fs_assert(0);
            return;
          }
          fs_assert(s_mul_type->valid_width());
          mul_width = s_mul_type->width();
        } else {
          firDB::firTypeUInt* u_mul_type = dynamic_cast<firDB::firTypeUInt*>(mul_type);
          if (u_mul_type == NULL) {
            fs_assert(0);
            return;
          }
          fs_assert(u_mul_type->valid_width());
          mul_width = u_mul_type->width();
        }
        signed_left = signed_right;
      } else if (mul_exp2_value == NULL && big_left->eq(0)) {
        mul_result_value = "h0";
        firDB::firType* mul_type = this->type_data();
        if (signed_right) {
          firDB::firTypeSInt* s_mul_type = dynamic_cast<firDB::firTypeSInt*>(mul_type);
          if (s_mul_type == NULL) {
            fs_assert(0);
            return;
          }
          fs_assert(s_mul_type->valid_width());
          mul_width = s_mul_type->width();
        } else {
          firDB::firTypeUInt* u_mul_type = dynamic_cast<firDB::firTypeUInt*>(mul_type);
          if (u_mul_type == NULL) {
            fs_assert(0);
            return;
          }
          fs_assert(u_mul_type->valid_width());
          mul_width = u_mul_type->width();
        }
        signed_right = signed_left;
      } else if (mul_exp1_value != NULL && mul_exp2_value != NULL) {
        mul_width = width_left + width_right;
        mul_result_value = big_left->mul(big_right);
      } else {
        this->set_exp_val(NULL);
        return;
      }
      firExp* mul_result_exp = NULL;
      if (signed_left == true && signed_right == true) {
        mul_result_exp = module->addExpSIntBits(mul_result_value, mul_width);
      } else if (signed_left == false && signed_right == false) {
        mul_result_exp = module->addExpUIntBits(mul_result_value, mul_width);
      } else {
        fs_error("*ERROR*: The types of the two inputs in MUL operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
      }
      this->set_exp_val(mul_result_exp);
    }
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firMul::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* mul_exp1 = this->exp1();
    if (mul_exp1 == NULL) {
      fs_error("*ERROR*: The left expression in MUL operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* mul_exp2 = this->exp2();
    if (mul_exp2 == NULL) {
      fs_error("*ERROR*: The right expression in MUL operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* mul_exp1_value = mul_exp1->getExpVal(module, domain);
      firExp* mul_exp2_value = mul_exp2->getExpVal(module, domain);
      this->updateExpVal(module, mul_exp1_value, mul_exp2_value);
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firMul::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* exp1 = this->exp1();
    if (exp1 == NULL) {
      fs_error("*ERROR*: The left expression in MUL operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* exp2 = this->exp2();
    if (exp2 == NULL) {
      fs_error("*ERROR*: The right expression in MUL operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* mul_exp1_value = exp1->inferExpVal(module, domain);
    firExp* mul_exp2_value = exp2->inferExpVal(module, domain);
    this->updateExpVal(module, mul_exp1_value, mul_exp2_value);
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }

  void firDB::firExpPrimOperation::firDiv::updateTypeData(firModule* module, firType* div_num_type, firType* div_den_type) {
    fs_assert(module != NULL);
    if (div_num_type == NULL || div_den_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (!div_num_type->isEqual(div_den_type)) {
      fs_error("*ERROR*: The types of the two inputs in 'div' operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
      this->set_type_data(NULL);
    } else {
      if (div_num_type->isUIntType()) {
        if (dynamic_cast<firTypeUInt*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeUInt(-1));
        }
        firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
        firTypeUInt* u_num_type = dynamic_cast<firTypeUInt*>(div_num_type);
        utype_data->reset();
        if (u_num_type->valid_width()) {
          int width = u_num_type->width();
          utype_data->set_width(width);
        }
      } else if (div_num_type->isSIntType()) {
        if (dynamic_cast<firTypeSInt*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeSInt(-1));
        }
        firTypeSInt* stype_data = dynamic_cast<firTypeSInt*>(this->type_data());
        firTypeSInt* s_num_type = dynamic_cast<firTypeSInt*>(div_num_type);
        stype_data->reset();
        if (s_num_type->valid_width()) {
          int width = s_num_type->width() + 1;
          stype_data->set_width(width);
        }
      } else {
        fs_error("*ERROR*: Failed to determine the type of the input in 'div' expression '%s'.\n", this->toString().c_str());
        this->set_type_data(NULL);
      }
    }
    return;
  }
  firDB::firType* firDB::firExpPrimOperation::firDiv::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* div_num_type = this->num()->getTypeData(module, domain);
      firType* div_den_type = this->den()->getTypeData(module, domain);
      updateTypeData(module, div_num_type, div_den_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firDiv::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* div_num_type = this->num()->inferDataType(module, domain);
    firType* div_den_type = this->den()->inferDataType(module, domain);
    updateTypeData(module, div_num_type, div_den_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firDiv::updateExpVal(firModule* module, firExp* div_num_value, firExp* div_den_value) {
    fs_assert(module);
    if (div_num_value == NULL && div_den_value == NULL) {
      firDB::firExp* exp_num = this->num();
      firDB::firExp* exp_den = this->den();
      if (exp_num->isSameExpression(exp_den)) {
        std::string div_result_value = "h1";
        firDB::firExp* div_result_exp = NULL;
        firDB::firType* div_type = this->type_data();
        if (div_type->isSIntType()) {
          firDB::firTypeSInt* s_div_type = dynamic_cast<firDB::firTypeSInt*>(div_type);
          fs_assert(s_div_type != NULL);
          fs_assert(s_div_type->valid_width());
          int div_width = s_div_type->width() + 1;
          div_result_exp = module->addExpSIntBits(div_result_value, div_width);
        } else if (div_type->isUIntType()) {
          firDB::firTypeUInt* u_div_type = dynamic_cast<firDB::firTypeUInt*>(div_type);
          fs_assert(u_div_type != NULL);
          fs_assert(u_div_type->valid_width());
          int div_width = u_div_type->width();
          div_result_exp = module->addExpUIntBits(div_result_value, div_width);
        }
        this->set_exp_val(div_result_exp);
        return;
      } else {
        this->set_exp_val(NULL);
        return;
      }
    }
    // get bigint1
    if (div_num_value == NULL) {
      //fs_error("*ERROR*: The left expression in DIV operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_left = UINT_MAX;
    BigInt* big_left = NULL;
    bool signed_left = false;
    if (div_num_value->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits1 = dynamic_cast<firExpUIntBits*>(div_num_value);
      width_left = uint_bits1->width();
      big_left = uint_bits1->big_value();
      signed_left = false;
    } else if (div_num_value->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(div_num_value);
      width_left = sint_bits1->width();
      big_left = sint_bits1->big_value();
      signed_left = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of left expression in DIV operation '%s'.\n", div_num_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_left == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of left expression value '%s' in DIV operation '%s'.\n", div_num_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // get bigint2
    if (div_den_value == NULL) {
      //fs_error("*ERROR*: The right expression in DIV operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_right = INT_MAX;
    BigInt* big_right = NULL;
    bool signed_right = false;
    if (div_den_value->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits2 = dynamic_cast<firExpUIntBits*>(div_den_value);
      width_right = uint_bits2->width();
      big_right = uint_bits2->big_value();
      signed_right = false;
    } else if (div_den_value->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits2 = dynamic_cast<firExpSIntBits*>(div_den_value);
      width_right = sint_bits2->width();
      big_right = sint_bits2->big_value();
      signed_right = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of right expression in DIV operation '%s'.\n", div_den_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_right == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of right expression value '%s' in DIV operation '%s'.\n", div_den_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // calculate value result
    std::string div_result_value = big_left->div(big_right);
    firExp* div_result_exp = NULL;
    if (signed_left == true && signed_right == true) {
      int div_width = width_left + 1;
      div_result_exp = module->addExpSIntBits(div_result_value, div_width);
    } else if (signed_left == false && signed_right == false) {
      int div_width = width_left;
      div_result_exp = module->addExpUIntBits(div_result_value, div_width);
    } else {
      fs_error("*ERROR*: The types of the two inputs in DIV operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
    }
    this->set_exp_val(div_result_exp);
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firDiv::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* div_num = this->num();
    if (div_num == NULL) {
      fs_error("*ERROR*: The left expression in DIV operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* div_den = this->den();
    if (div_den == NULL) {
      fs_error("*ERROR*: The right expression in DIV operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* div_num_value = div_num->getExpVal(module, domain);
      firExp* div_den_value = div_den->getExpVal(module, domain);
      this->updateExpVal(module, div_num_value, div_den_value);
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firDiv::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* div_num = this->num();
    if (div_num == NULL) {
      fs_error("*ERROR*: The left expression in DIV operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* div_den = this->den();
    if (div_den == NULL) {
      fs_error("*ERROR*: The right expression in DIV operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* div_num_value = div_num->inferExpVal(module, domain);
    firExp* div_den_value = div_den->inferExpVal(module, domain);
    this->updateExpVal(module, div_num_value, div_den_value);
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firMod::updateTypeData(firModule* module, firType* mod_num_type, firType* mod_den_type) {
    fs_assert(module != NULL);
    if (mod_num_type == NULL || mod_den_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (!mod_num_type->isEqual(mod_den_type)) {
      fs_error("*ERROR*: The types of the two inputs in 'mod' operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
      this->set_type_data(NULL);
    } else {
      if (mod_num_type->isUIntType()) {
        if (dynamic_cast<firTypeUInt*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeUInt(-1));
        }
        firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
        firTypeUInt* u_num_type = dynamic_cast<firTypeUInt*>(mod_num_type);
        firTypeUInt* u_den_type = dynamic_cast<firTypeUInt*>(mod_den_type);
        utype_data->reset();
        bool valid_num_type = u_num_type->valid_width();
        bool valid_den_type = u_den_type->valid_width();
        if (valid_num_type && valid_den_type) {
          int width1 = u_num_type->width();
          int width2 = u_den_type->width();
          utype_data->set_width(std::min(width1, width2));
        } else if (valid_num_type && !valid_den_type) {
          int width = u_num_type->width();
          utype_data->set_width(width);
        } else if (!valid_num_type && valid_den_type) {
          int width = u_den_type->width();
          utype_data->set_width(width);
        }
      } else if (mod_num_type->isSIntType()) {
        if (dynamic_cast<firTypeSInt*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeSInt(-1));
        }
        firTypeSInt* stype_data = dynamic_cast<firTypeSInt*>(this->type_data());
        firTypeSInt* s_num_type = dynamic_cast<firTypeSInt*>(mod_num_type);
        firTypeSInt* s_den_type = dynamic_cast<firTypeSInt*>(mod_den_type);
        stype_data->reset();
        bool valid_num_type = s_num_type->valid_width();
        bool valid_den_type = s_den_type->valid_width();
        if (valid_num_type && valid_den_type) {
          int width1 = s_num_type->width();
          int width2 = s_den_type->width();
          stype_data->set_width(std::min(width1, width2));
        } else if (valid_num_type && !valid_den_type) {
          int width = s_num_type->width();
          stype_data->set_width(width);
        } else if (!valid_num_type && valid_den_type) {
          int width = s_den_type->width();
          stype_data->set_width(width);
        }
      } else {
        fs_error("*ERROR*: Failed to determine the type of the input in 'mod' expression '%s'.\n", this->toString().c_str());
        this->set_type_data(NULL);
      }
    }
    return;
  }
  firDB::firType* firDB::firExpPrimOperation::firMod::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* mod_num_type = this->num()->getTypeData(module, domain);
      firType* mod_den_type = this->den()->getTypeData(module, domain);
      updateTypeData(module, mod_num_type, mod_den_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firMod::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* mod_num_type = this->num()->inferDataType(module, domain);
    firType* mod_den_type = this->den()->inferDataType(module, domain);
    updateTypeData(module, mod_num_type, mod_den_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firMod::updateExpVal(firModule* module, firExp* mod_num_value, firExp* mod_den_value) {
    fs_assert(module);
    if (mod_num_value == NULL && mod_den_value == NULL) {
      firDB::firExp* num_exp = this->num();
      firDB::firExp* den_exp = this->den();
      if (num_exp->isSameExpression(den_exp)) {
        std::string mod_result_value = "h0";
        firDB::firExp* mod_result_exp = NULL;
        firDB::firType* mod_type = this->type_data();
        fs_assert(mod_type != NULL);
        if (mod_type->isSIntType()) {
          firDB::firTypeSInt* s_mod_type = dynamic_cast<firDB::firTypeSInt*>(mod_type);
          fs_assert(s_mod_type != NULL);
          int mod_width = s_mod_type->width();
          mod_result_exp = module->addExpSIntBits(mod_result_value, mod_width);
        } else if (mod_type->isUIntType()) {
          firDB::firTypeUInt* u_mod_type = dynamic_cast<firDB::firTypeUInt*>(mod_type);
          fs_assert(u_mod_type != NULL);
          int mod_width = u_mod_type->width();
          mod_result_exp = module->addExpUIntBits(mod_result_value, mod_width);
        }
        this->set_exp_val(mod_result_exp);
        return;
      } else {
        this->set_exp_val(NULL);
        return;
      }
    }
    // get bigint1
    if (mod_num_value == NULL) {
      //fs_error("*ERROR*: The left expression in MOD operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_left = UINT_MAX;
    BigInt* big_left = NULL;
    bool signed_left = false;
    if (mod_num_value->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits1 = dynamic_cast<firExpUIntBits*>(mod_num_value);
      width_left = uint_bits1->width();
      big_left = uint_bits1->big_value();
      signed_left = false;
    } else if (mod_num_value->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(mod_num_value);
      width_left = sint_bits1->width();
      big_left = sint_bits1->big_value();
      signed_left = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of left expression in MOD operation '%s'.\n", mod_num_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_left == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of left expression value '%s' in MOD operation '%s'.\n", mod_num_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // get bigint2
    if (mod_den_value == NULL) {
      //fs_error("*ERROR*: The right expression in MOD operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_right = INT_MAX;
    BigInt* big_right = NULL;
    bool signed_right = false;
    if (mod_den_value->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits2 = dynamic_cast<firExpUIntBits*>(mod_den_value);
      width_right = uint_bits2->width();
      big_right = uint_bits2->big_value();
      signed_right = false;
    } else if (mod_den_value->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits2 = dynamic_cast<firExpSIntBits*>(mod_den_value);
      width_right = sint_bits2->width();
      big_right = sint_bits2->big_value();
      signed_right = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of right expression in MOD operation '%s'.\n", mod_den_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_right == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of right expression value '%s' in MOD operation '%s'.\n", mod_den_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // calculate value result
    std::string mod_result_value = big_left->mod(big_right);
    int mod_width = width_left + 1;
    firExp* mod_result_exp = NULL;
    if (signed_left == true && signed_right == true) {
      mod_result_exp = module->addExpSIntBits(mod_result_value, mod_width);
    } else if (signed_left == false && signed_right == false) {
      mod_result_exp = module->addExpUIntBits(mod_result_value, mod_width);
    } else {
      fs_error("*ERROR*: The types of the two inputs in MOD operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
    }
    this->set_exp_val(mod_result_exp);
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firMod::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* mod_num = this->num();
    if (mod_num == NULL) {
      fs_error("*ERROR*: The left expression in MOD operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* mod_den = this->den();
    if (mod_den == NULL) {
      fs_error("*ERROR*: The right expression in MOD operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* mod_num_value = mod_num->getExpVal(module, domain);
      firExp* mod_den_value = mod_den->getExpVal(module, domain);
      this->updateExpVal(module, mod_num_value, mod_den_value);
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firMod::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* mod_num = this->num();
    if (mod_num == NULL) {
      fs_error("*ERROR*: The left expression in MOD operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* mod_den = this->den();
    if (mod_den == NULL) {
      fs_error("*ERROR*: The right expression in MOD operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* mod_num_value = mod_num->inferExpVal(module, domain);
    firExp* mod_den_value = mod_den->inferExpVal(module, domain);
    this->updateExpVal(module, mod_num_value, mod_den_value);
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firLt::updateTypeData(firModule* module, firType* lt_exp1_type, firType* lt_exp2_type) {
    fs_assert(module != NULL);
    if (lt_exp1_type == NULL || lt_exp2_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (!lt_exp1_type->isEqual(lt_exp2_type)) {
      fs_error("*ERROR*: The types of the two inputs in 'lt' operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
      this->set_type_data(NULL);
    } else {
      if (lt_exp1_type->isUIntType() || lt_exp1_type->isSIntType() || lt_exp1_type->isFixedType() || lt_exp1_type->isIntervalType()) {
        firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
        if (utype_data == NULL) {
          this->set_type_data(module->addTypeUInt(1));
        } else {
          utype_data->set_width(1);
        }
      } else {
        fs_error("*ERROR*: Failed to determine the type of the input in 'lt' expression '%s'.\n", this->toString().c_str());
        this->set_type_data(NULL);
      }
    }
    return;
  }
  firDB::firType* firDB::firExpPrimOperation::firLt::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* lt_exp1_type = this->exp1()->getTypeData(module, domain);
      firType* lt_exp2_type = this->exp2()->getTypeData(module, domain);
      updateTypeData(module, lt_exp1_type, lt_exp2_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firLt::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* lt_exp1_type = this->exp1()->inferDataType(module, domain);
    firType* lt_exp2_type = this->exp2()->inferDataType(module, domain);
    updateTypeData(module, lt_exp1_type, lt_exp2_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firLt::updateExpVal(firModule* module, firExp* lt_exp1_value, firExp* lt_exp2_value) {
    fs_assert(module);
    if (lt_exp1_value == NULL && lt_exp2_value == NULL) {
      firDB::firExp* exp1 = this->exp1();
      firDB::firExp* exp2 = this->exp2();
      if (exp1->isSameExpression(exp2)) {
        std::string lt_result_value = "h0";
        firDB::firExp* lt_result_exp = module->addExpUIntBits(lt_result_value, 1);
        this->set_exp_val(lt_result_exp);
        return;
      } else {
        this->set_exp_val(NULL);
        return;
      }
    }
    // get bigint1
    if (lt_exp1_value == NULL) {
      //fs_error("*ERROR*: The left expression in LT operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_left = UINT_MAX;
    BigInt* big_left = NULL;
    bool signed_left = false;
    if (lt_exp1_value->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits1 = dynamic_cast<firExpUIntBits*>(lt_exp1_value);
      width_left = uint_bits1->width();
      big_left = uint_bits1->big_value();
      signed_left = false;
    } else if (lt_exp1_value->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(lt_exp1_value);
      width_left = sint_bits1->width();
      big_left = sint_bits1->big_value();
      signed_left = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of left expression in LT operation '%s'.\n", lt_exp1_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_left == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of left expression value '%s' in LT operation '%s'.\n", lt_exp1_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // get bigint2
    if (lt_exp2_value == NULL) {
      //fs_error("*ERROR*: The right expression in LT operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_right = INT_MAX;
    BigInt* big_right = NULL;
    bool signed_right = false;
    if (lt_exp2_value->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits2 = dynamic_cast<firExpUIntBits*>(lt_exp2_value);
      width_right = uint_bits2->width();
      big_right = uint_bits2->big_value();
      signed_right = false;
    } else if (lt_exp2_value->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits2 = dynamic_cast<firExpSIntBits*>(lt_exp2_value);
      width_right = sint_bits2->width();
      big_right = sint_bits2->big_value();
      signed_right = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of right expression in LT operation '%s'.\n", lt_exp2_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_right == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of right expression value '%s' in LT operation '%s'.\n", lt_exp2_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // calculate value result
    std::string lt_result_value = big_left->lt(big_right);
    int lt_width = 1;
    firExp* lt_result_exp = NULL;
    if (signed_left == true && signed_right == true) {
      lt_result_exp = module->addExpUIntBits(lt_result_value, lt_width);
    } else if (signed_left == false && signed_right == false) {
      lt_result_exp = module->addExpUIntBits(lt_result_value, lt_width);
    } else {
      fs_error("*ERROR*: The types of the two inputs in LT operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
    }
    this->set_exp_val(lt_result_exp);
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firLt::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* lt_exp1 = this->exp1();
    if (lt_exp1 == NULL) {
      fs_error("*ERROR*: The left expression in LT operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* lt_exp2 = this->exp2();
    if (lt_exp2 == NULL) {
      fs_error("*ERROR*: The right expression in LT operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* lt_exp1_value = lt_exp1->getExpVal(module, domain);
      firExp* lt_exp2_value = lt_exp2->getExpVal(module, domain);
      this->updateExpVal(module, lt_exp1_value, lt_exp2_value);
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firLt::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* lt_exp1 = this->exp1();
    if (lt_exp1 == NULL) {
      fs_error("*ERROR*: The left expression in LT operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* lt_exp2 = this->exp2();
    if (lt_exp2 == NULL) {
      fs_error("*ERROR*: The right expression in LT operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* lt_exp1_value = lt_exp1->inferExpVal(module, domain);
    firExp* lt_exp2_value = lt_exp2->inferExpVal(module, domain);
    this->updateExpVal(module, lt_exp1_value, lt_exp2_value);
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firLeq::updateTypeData(firModule* module, firType* leq_exp1_type, firType* leq_exp2_type) {
    fs_assert(module != NULL);
    if (leq_exp1_type == NULL || leq_exp2_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (!leq_exp1_type->isEqual(leq_exp2_type)) {
      fs_error("*ERROR*: The types of the two inputs in 'leq' operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
      this->set_type_data(NULL);
    } else {
      if (leq_exp1_type->isUIntType() || leq_exp1_type->isSIntType() || leq_exp1_type->isFixedType() || leq_exp1_type->isIntervalType()) {
        firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
        if (utype_data == NULL) {
          this->set_type_data(module->addTypeUInt(1));
        } else {
          utype_data->set_width(1);
        }
      } else {
        fs_error("*ERROR*: Failed to determine the type of the input in 'leq' expression '%s'.\n", this->toString().c_str());
        this->set_type_data(NULL);
      }
    }
    return;
  }
  firDB::firType* firDB::firExpPrimOperation::firLeq::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* leq_exp1_type = this->exp1()->getTypeData(module, domain);
      firType* leq_exp2_type = this->exp2()->getTypeData(module, domain);
      updateTypeData(module, leq_exp1_type, leq_exp2_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firLeq::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* leq_exp1_type = this->exp1()->inferDataType(module, domain);
    firType* leq_exp2_type = this->exp2()->inferDataType(module, domain);
    updateTypeData(module, leq_exp1_type, leq_exp2_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firLeq::updateExpVal(firModule* module, firExp* leq_exp1_value, firExp* leq_exp2_value) {
    fs_assert(module);
    if (leq_exp1_value == NULL && leq_exp2_value == NULL) {
      if (this->exp1()->isSameExpression(this->exp2())) {
        std::string leq_result_value = "h1";
        firDB::firExp* leq_result_exp = module->addExpUIntBits(leq_result_value, 1);
        this->set_exp_val(leq_result_exp);
        return;
      } else {
        this->set_exp_val(NULL);
        return;
      }
    }
    // get bigint1
    if (leq_exp1_value == NULL) {
      //fs_error("*ERROR*: The left expression in LEQ operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_left = UINT_MAX;
    BigInt* big_left = NULL;
    bool signed_left = false;
    if (leq_exp1_value->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits1 = dynamic_cast<firExpUIntBits*>(leq_exp1_value);
      width_left = uint_bits1->width();
      big_left = uint_bits1->big_value();
      signed_left = false;
    } else if (leq_exp1_value->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(leq_exp1_value);
      width_left = sint_bits1->width();
      big_left = sint_bits1->big_value();
      signed_left = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of left expression in LEQ operation '%s'.\n", leq_exp1_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_left == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of left expression value '%s' in LEQ operation '%s'.\n", leq_exp1_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // get bigint2
    if (leq_exp2_value == NULL) {
      //fs_error("*ERROR*: The right expression in LEQ operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_right = INT_MAX;
    BigInt* big_right = NULL;
    bool signed_right = false;
    if (leq_exp2_value->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits2 = dynamic_cast<firExpUIntBits*>(leq_exp2_value);
      width_right = uint_bits2->width();
      big_right = uint_bits2->big_value();
      signed_right = false;
    } else if (leq_exp2_value->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits2 = dynamic_cast<firExpSIntBits*>(leq_exp2_value);
      width_right = sint_bits2->width();
      big_right = sint_bits2->big_value();
      signed_right = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of right expression in LEQ operation '%s'.\n", leq_exp2_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_right == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of right expression value '%s' in LEQ operation '%s'.\n", leq_exp2_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // calculate value result
    std::string leq_result_value = big_left->leq(big_right);
    int leq_width = 1;
    firExp* leq_result_exp = NULL;
    if (signed_left == true && signed_right == true) {
      leq_result_exp = module->addExpUIntBits(leq_result_value, leq_width);
    } else if (signed_left == false && signed_right == false) {
      leq_result_exp = module->addExpUIntBits(leq_result_value, leq_width);
    } else {
      fs_error("*ERROR*: The types of the two inputs in LEQ operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
    }
    this->set_exp_val(leq_result_exp);
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firLeq::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* leq_exp1 = this->exp1();
    if (leq_exp1 == NULL) {
      fs_error("*ERROR*: The left expression in LEQ operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* leq_exp2 = this->exp2();
    if (leq_exp2 == NULL) {
      fs_error("*ERROR*: The right expression in LEQ operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* leq_exp1_value = leq_exp1->getExpVal(module, domain);
      firExp* leq_exp2_value = leq_exp2->getExpVal(module, domain);
      this->updateExpVal(module, leq_exp1_value, leq_exp2_value);
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firLeq::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* leq_exp1 = this->exp1();
    if (leq_exp1 == NULL) {
      fs_error("*ERROR*: The left expression in LEQ operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* leq_exp2 = this->exp2();
    if (leq_exp2 == NULL) {
      fs_error("*ERROR*: The right expression in LEQ operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* leq_exp1_value = leq_exp1->inferExpVal(module, domain);
    firExp* leq_exp2_value = leq_exp2->inferExpVal(module, domain);
    this->updateExpVal(module, leq_exp1_value, leq_exp2_value);
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firGt::updateTypeData(firModule* module, firType* gt_exp1_type, firType* gt_exp2_type) {
    fs_assert(module != NULL);
    if (gt_exp1_type == NULL || gt_exp2_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (!gt_exp1_type->isEqual(gt_exp2_type)) {
      fs_error("*ERROR*: The types of the two inputs in 'gt' operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
      this->set_type_data(NULL);
    } else {
      if (gt_exp1_type->isUIntType() || gt_exp1_type->isSIntType() || gt_exp1_type->isFixedType() || gt_exp1_type->isIntervalType()) {
        firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
        if (utype_data == NULL) {
          this->set_type_data(module->addTypeUInt(1));
        } else {
          utype_data->set_width(1);
        }
      } else {
        fs_error("*ERROR*: Failed to determine the type of the input in 'gt' expression '%s'.\n", this->toString().c_str());
        this->set_type_data(NULL);
      }
    }
    return;
  }
  firDB::firType* firDB::firExpPrimOperation::firGt::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* gt_exp1_type = this->exp1()->getTypeData(module, domain);
      firType* gt_exp2_type = this->exp2()->getTypeData(module, domain);
      updateTypeData(module, gt_exp1_type, gt_exp2_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firGt::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* gt_exp1_type = this->exp1()->inferDataType(module, domain);
    firType* gt_exp2_type = this->exp2()->inferDataType(module, domain);
    updateTypeData(module, gt_exp1_type, gt_exp2_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firGt::updateExpVal(firModule* module, firExp* gt_exp1_value, firExp* gt_exp2_value) {
    fs_assert(module);
    if (gt_exp1_value == NULL && gt_exp2_value == NULL) {
      if (this->exp1()->isSameExpression(this->exp2())) {
        std::string gt_result_value = "h0";
        firDB::firExp* gt_result_exp = module->addExpUIntBits(gt_result_value, 1);
        this->set_exp_val(gt_result_exp);
        return;
      } else {
        this->set_exp_val(NULL);
        return;
      }
    }
    // get bigint1
    if (gt_exp1_value == NULL) {
      //fs_error("*ERROR*: The left expression in GT operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_left = UINT_MAX;
    BigInt* big_left = NULL;
    bool signed_left = false;
    if (gt_exp1_value->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits1 = dynamic_cast<firExpUIntBits*>(gt_exp1_value);
      width_left = uint_bits1->width();
      big_left = uint_bits1->big_value();
      signed_left = false;
    } else if (gt_exp1_value->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(gt_exp1_value);
      width_left = sint_bits1->width();
      big_left = sint_bits1->big_value();
      signed_left = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of left expression in GT operation '%s'.\n", gt_exp1_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_left == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of left expression value '%s' in GT operation '%s'.\n", gt_exp1_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // get bigint2
    if (gt_exp2_value == NULL) {
      //fs_error("*ERROR*: The right expression in GT operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_right = INT_MAX;
    BigInt* big_right = NULL;
    bool signed_right = false;
    if (gt_exp2_value->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits2 = dynamic_cast<firExpUIntBits*>(gt_exp2_value);
      width_right = uint_bits2->width();
      big_right = uint_bits2->big_value();
      signed_right = false;
    } else if (gt_exp2_value->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits2 = dynamic_cast<firExpSIntBits*>(gt_exp2_value);
      width_right = sint_bits2->width();
      big_right = sint_bits2->big_value();
      signed_right = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of right expression in GT operation '%s'.\n", gt_exp2_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_right == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of right expression value '%s' in GT operation '%s'.\n", gt_exp2_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // calculate value result
    std::string gt_result_value = big_left->gt(big_right);
    int gt_width = 1;
    firExp* gt_result_exp = NULL;
    if (signed_left == true && signed_right == true) {
      gt_result_exp = module->addExpUIntBits(gt_result_value, gt_width);
    } else if (signed_left == false && signed_right == false) {
      gt_result_exp = module->addExpUIntBits(gt_result_value, gt_width);
    } else {
      fs_error("*ERROR*: The types of the two inputs in GT operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
    }
    this->set_exp_val(gt_result_exp);
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firGt::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* gt_exp1 = this->exp1();
    if (gt_exp1 == NULL) {
      fs_error("*ERROR*: The left expression in GT operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* gt_exp2 = this->exp2();
    if (gt_exp2 == NULL) {
      fs_error("*ERROR*: The right expression in GT operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* gt_exp1_value = gt_exp1->getExpVal(module, domain);
      firExp* gt_exp2_value = gt_exp2->getExpVal(module, domain);
      this->updateExpVal(module, gt_exp1_value, gt_exp2_value);
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firGt::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* gt_exp1 = this->exp1();
    if (gt_exp1 == NULL) {
      fs_error("*ERROR*: The left expression in GT operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* gt_exp2 = this->exp2();
    if (gt_exp2 == NULL) {
      fs_error("*ERROR*: The right expression in GT operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* gt_exp1_value = gt_exp1->inferExpVal(module, domain);
    firExp* gt_exp2_value = gt_exp2->inferExpVal(module, domain);
    this->updateExpVal(module, gt_exp1_value, gt_exp2_value);
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firGeq::updateTypeData(firModule* module, firType* geq_exp1_type, firType* geq_exp2_type) {
    fs_assert(module != NULL);
    if (geq_exp1_type == NULL || geq_exp2_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (!geq_exp1_type->isEqual(geq_exp2_type)) {
      fs_error("*ERROR*: The types of the two inputs in 'geq' operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
      this->set_type_data(NULL);
    } else {
      if (geq_exp1_type->isUIntType() || geq_exp1_type->isSIntType() || geq_exp1_type->isFixedType() || geq_exp1_type->isIntervalType()) {
        firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
        if (utype_data == NULL) {
          this->set_type_data(module->addTypeUInt(1));
        } else {
          utype_data->set_width(1);
        }
      } else {
        fs_error("*ERROR*: Failed to determine the type of the input in 'geq' expression '%s'.\n", this->toString().c_str());
        this->set_type_data(NULL);
      }
    }
    return;
  }
  firDB::firType* firDB::firExpPrimOperation::firGeq::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* geq_exp1_type = this->exp1()->getTypeData(module, domain);
      firType* geq_exp2_type = this->exp2()->getTypeData(module, domain);
      updateTypeData(module, geq_exp1_type, geq_exp2_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firGeq::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* geq_exp1_type = this->exp1()->inferDataType(module, domain);
    firType* geq_exp2_type = this->exp2()->inferDataType(module, domain);
    updateTypeData(module, geq_exp1_type, geq_exp2_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firGeq::updateExpVal(firModule* module, firExp* geq_exp1_value, firExp* geq_exp2_value) {
    fs_assert(module);
    if (geq_exp1_value == NULL && geq_exp2_value == NULL) {
      if (this->exp1()->isSameExpression(this->exp2())) {
        std::string geq_result_value = "h1";
        firDB::firExp* geq_result_exp = module->addExpUIntBits(geq_result_value, 1);
        this->set_exp_val(geq_result_exp);
        return;
      } else {
        this->set_exp_val(NULL);
        return;
      }
    }
    // get bigint1
    if (geq_exp1_value == NULL) {
      //fs_error("*ERROR*: The left expression in GEQ operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_left = UINT_MAX;
    BigInt* big_left = NULL;
    bool signed_left = false;
    if (geq_exp1_value->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits1 = dynamic_cast<firExpUIntBits*>(geq_exp1_value);
      width_left = uint_bits1->width();
      big_left = uint_bits1->big_value();
      signed_left = false;
    } else if (geq_exp1_value->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(geq_exp1_value);
      width_left = sint_bits1->width();
      big_left = sint_bits1->big_value();
      signed_left = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of left expression in GEQ operation '%s'.\n", geq_exp1_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_left == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of left expression value '%s' in GEQ operation '%s'.\n", geq_exp1_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // get bigint2
    if (geq_exp2_value == NULL) {
      //fs_error("*ERROR*: The right expression in GEQ operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_right = INT_MAX;
    BigInt* big_right = NULL;
    bool signed_right = false;
    if (geq_exp2_value->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits2 = dynamic_cast<firExpUIntBits*>(geq_exp2_value);
      width_right = uint_bits2->width();
      big_right = uint_bits2->big_value();
      signed_right = false;
    } else if (geq_exp2_value->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits2 = dynamic_cast<firExpSIntBits*>(geq_exp2_value);
      width_right = sint_bits2->width();
      big_right = sint_bits2->big_value();
      signed_right = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of right expression in GEQ operation '%s'.\n", geq_exp2_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_right == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of right expression value '%s' in GEQ operation '%s'.\n", geq_exp2_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // calculate value result
    std::string geq_result_value = big_left->geq(big_right);
    int geq_width = 1;
    firExp* geq_result_exp = NULL;
    if (signed_left == true && signed_right == true) {
      geq_result_exp = module->addExpUIntBits(geq_result_value, geq_width);
    } else if (signed_left == false && signed_right == false) {
      geq_result_exp = module->addExpUIntBits(geq_result_value, geq_width);
    } else {
      fs_error("*ERROR*: The types of the two inputs in GEQ operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
    }
    this->set_exp_val(geq_result_exp);
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firGeq::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* geq_exp1 = this->exp1();
    if (geq_exp1 == NULL) {
      fs_error("*ERROR*: The left expression in GEQ operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* geq_exp2 = this->exp2();
    if (geq_exp2 == NULL) {
      fs_error("*ERROR*: The right expression in GEQ operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* geq_exp1_value = geq_exp1->getExpVal(module, domain);
      firExp* geq_exp2_value = geq_exp2->getExpVal(module, domain);
      this->updateExpVal(module, geq_exp1_value, geq_exp2_value);
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firGeq::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* geq_exp1 = this->exp1();
    if (geq_exp1 == NULL) {
      fs_error("*ERROR*: The left expression in GEQ operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* geq_exp2 = this->exp2();
    if (geq_exp2 == NULL) {
      fs_error("*ERROR*: The right expression in GEQ operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* geq_exp1_value = geq_exp1->inferExpVal(module, domain);
    firExp* geq_exp2_value = geq_exp2->inferExpVal(module, domain);
    this->updateExpVal(module, geq_exp1_value, geq_exp2_value);
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firEq::updateTypeData(firModule* module, firType* eq_exp1_type, firType* eq_exp2_type) {
    fs_assert(module != NULL);
    if (eq_exp1_type == NULL || eq_exp2_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (!eq_exp1_type->isEqual(eq_exp2_type)) {
      fs_error("*ERROR*: The types of the two inputs in 'eq' operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
      this->set_type_data(NULL);
    } else {
      if (eq_exp1_type->isUIntType() || eq_exp1_type->isSIntType() || eq_exp1_type->isFixedType() || eq_exp1_type->isIntervalType()) {
        firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
        if (utype_data == NULL) {
          this->set_type_data(module->addTypeUInt(1));
        } else {
          utype_data->set_width(1);
        }
      } else {
        fs_error("*ERROR*: Failed to determine the type of the input in 'eq' expression '%s'.\n", this->toString().c_str());
        this->set_type_data(NULL);
      }
    }
    return;
  }
  firDB::firType* firDB::firExpPrimOperation::firEq::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* eq_exp1_type = this->exp1()->getTypeData(module, domain);
      firType* eq_exp2_type = this->exp2()->getTypeData(module, domain);
      updateTypeData(module, eq_exp1_type, eq_exp2_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firEq::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* eq_exp1_type = this->exp1()->inferDataType(module, domain);
    firType* eq_exp2_type = this->exp2()->inferDataType(module, domain);
    updateTypeData(module, eq_exp1_type, eq_exp2_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firEq::updateExpVal(firModule* module, firExp* eq_exp1_value, firExp* eq_exp2_value) {
    fs_assert(module);
    if (eq_exp1_value == NULL && eq_exp2_value == NULL) {
      if (this->exp1()->isSameExpression(this->exp2())) {
        std::string eq_result_value = "h1";
        firDB::firExp* eq_result_exp = module->addExpUIntBits(eq_result_value, 1);
        this->set_exp_val(eq_result_exp);
        return;
      } else {
        this->set_exp_val(NULL);
        return;
      }
    }
    // get bigint1
    if (eq_exp1_value == NULL) {
      //fs_error("*ERROR*: The left expression in EQ operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_left = UINT_MAX;
    BigInt* big_left = NULL;
    bool signed_left = false;
    if (eq_exp1_value->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits1 = dynamic_cast<firExpUIntBits*>(eq_exp1_value);
      width_left = uint_bits1->width();
      big_left = uint_bits1->big_value();
      signed_left = false;
    } else if (eq_exp1_value->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(eq_exp1_value);
      width_left = sint_bits1->width();
      big_left = sint_bits1->big_value();
      signed_left = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of left expression in EQ operation '%s'.\n", eq_exp1_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_left == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of left expression value '%s' in EQ operation '%s'.\n", eq_exp1_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // get bigint2
    if (eq_exp2_value == NULL) {
      //fs_error("*ERROR*: The right expression in EQ operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_right = INT_MAX;
    BigInt* big_right = NULL;
    bool signed_right = false;
    if (eq_exp2_value->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits2 = dynamic_cast<firExpUIntBits*>(eq_exp2_value);
      width_right = uint_bits2->width();
      big_right = uint_bits2->big_value();
      signed_right = false;
    } else if (eq_exp2_value->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits2 = dynamic_cast<firExpSIntBits*>(eq_exp2_value);
      width_right = sint_bits2->width();
      big_right = sint_bits2->big_value();
      signed_right = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of right expression in EQ operation '%s'.\n", eq_exp2_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_right == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of right expression value '%s' in EQ operation '%s'.\n", eq_exp2_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // calculate value result
    std::string eq_result_value = big_left->eq(big_right);
    int eq_width = 1;
    firExp* eq_result_exp = NULL;
    if (signed_left == true && signed_right == true) {
      eq_result_exp = module->addExpUIntBits(eq_result_value, eq_width);
    } else if (signed_left == false && signed_right == false) {
      eq_result_exp = module->addExpUIntBits(eq_result_value, eq_width);
    } else {
      fs_error("*ERROR*: The types of the two inputs in EQ operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
    }
    this->set_exp_val(eq_result_exp);
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firEq::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* eq_exp1 = this->exp1();
    if (eq_exp1 == NULL) {
      fs_error("*ERROR*: The left expression in EQ operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* eq_exp2 = this->exp2();
    if (eq_exp2 == NULL) {
      fs_error("*ERROR*: The right expression in EQ operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* eq_exp1_value = eq_exp1->getExpVal(module, domain);
      firExp* eq_exp2_value = eq_exp2->getExpVal(module, domain);
      this->updateExpVal(module, eq_exp1_value, eq_exp2_value);
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firEq::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* eq_exp1 = this->exp1();
    if (eq_exp1 == NULL) {
      fs_error("*ERROR*: The left expression in EQ operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* eq_exp2 = this->exp2();
    if (eq_exp2 == NULL) {
      fs_error("*ERROR*: The right expression in EQ operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* eq_exp1_value = eq_exp1->inferExpVal(module, domain);
    firExp* eq_exp2_value = eq_exp2->inferExpVal(module, domain);
    this->updateExpVal(module, eq_exp1_value, eq_exp2_value);
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firNeq::updateTypeData(firModule* module, firType* neq_exp1_type, firType* neq_exp2_type) {
    fs_assert(module != NULL);
    if (neq_exp1_type == NULL || neq_exp2_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (!neq_exp1_type->isEqual(neq_exp2_type)) {
      fs_error("*ERROR*: The types of the two inputs in 'neq' operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
      this->set_type_data(NULL);
    } else {
      if (neq_exp1_type->isUIntType() || neq_exp1_type->isSIntType() || neq_exp1_type->isFixedType() || neq_exp1_type->isIntervalType()) {
        firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
        if (utype_data == NULL) {
          this->set_type_data(module->addTypeUInt(1));
        } else {
          utype_data->set_width(1);
        }
      } else {
        fs_error("*ERROR*: Failed to determine the type of the input in 'neq' expression '%s'.\n", this->toString().c_str());
        this->set_type_data(NULL);
      }
    }
    return;
  }
  firDB::firType* firDB::firExpPrimOperation::firNeq::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* neq_exp1_type = this->exp1()->getTypeData(module, domain);
      firType* neq_exp2_type = this->exp2()->getTypeData(module, domain);
      updateTypeData(module, neq_exp1_type, neq_exp2_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firNeq::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* neq_exp1_type = this->exp1()->inferDataType(module, domain);
    firType* neq_exp2_type = this->exp2()->inferDataType(module, domain);
    updateTypeData(module, neq_exp1_type, neq_exp2_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firNeq::updateExpVal(firModule* module, firExp* neq_exp1_value, firExp* neq_exp2_value) {
    fs_assert(module);
    if (neq_exp1_value == NULL && neq_exp2_value == NULL) {
      if (this->exp1()->isSameExpression(this->exp2())) {
        std::string neq_result_value = "h0";
        firDB::firExp* neq_result_exp = module->addExpUIntBits(neq_result_value, 1);
        this->set_exp_val(neq_result_exp);
        return;
      } else {
        this->set_exp_val(NULL);
        return;
      }
    }
    // get bigint1
    if (neq_exp1_value == NULL) {
      //fs_error("*ERROR*: The left expression in NEQ operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_left = UINT_MAX;
    BigInt* big_left = NULL;
    bool signed_left = false;
    if (neq_exp1_value->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits1 = dynamic_cast<firExpUIntBits*>(neq_exp1_value);
      width_left = uint_bits1->width();
      big_left = uint_bits1->big_value();
      signed_left = false;
    } else if (neq_exp1_value->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(neq_exp1_value);
      width_left = sint_bits1->width();
      big_left = sint_bits1->big_value();
      signed_left = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of left expression in NEQ operation '%s'.\n", neq_exp1_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_left == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of left expression value '%s' in NEQ operation '%s'.\n", neq_exp1_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // get bigint2
    if (neq_exp2_value == NULL) {
      //fs_error("*ERROR*: The right expression in NEQ operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_right = INT_MAX;
    BigInt* big_right = NULL;
    bool signed_right = false;
    if (neq_exp2_value->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits2 = dynamic_cast<firExpUIntBits*>(neq_exp2_value);
      width_right = uint_bits2->width();
      big_right = uint_bits2->big_value();
      signed_right = false;
    } else if (neq_exp2_value->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits2 = dynamic_cast<firExpSIntBits*>(neq_exp2_value);
      width_right = sint_bits2->width();
      big_right = sint_bits2->big_value();
      signed_right = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of right expression in NEQ operation '%s'.\n", neq_exp2_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_right == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of right expression value '%s' in NEQ operation '%s'.\n", neq_exp2_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // calculate value result
    std::string neq_result_value = big_left->neq(big_right);
    int neq_width = 1;
    firExp* neq_result_exp = NULL;
    if (signed_left == true && signed_right == true) {
      neq_result_exp = module->addExpUIntBits(neq_result_value, neq_width);
    } else if (signed_left == false && signed_right == false) {
      neq_result_exp = module->addExpUIntBits(neq_result_value, neq_width);
    } else {
      fs_error("*ERROR*: The types of the two inputs in NEQ operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
    }
    this->set_exp_val(neq_result_exp);
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firNeq::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* neq_exp1 = this->exp1();
    if (neq_exp1 == NULL) {
      fs_error("*ERROR*: The left expression in NEQ operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* neq_exp2 = this->exp2();
    if (neq_exp2 == NULL) {
      fs_error("*ERROR*: The right expression in NEQ operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* neq_exp1_value = neq_exp1->getExpVal(module, domain);
      firExp* neq_exp2_value = neq_exp2->getExpVal(module, domain);
      this->updateExpVal(module, neq_exp1_value, neq_exp2_value);
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firNeq::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* neq_exp1 = this->exp1();
    if (neq_exp1 == NULL) {
      fs_error("*ERROR*: The left expression in NEQ operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* neq_exp2 = this->exp2();
    if (neq_exp2 == NULL) {
      fs_error("*ERROR*: The right expression in NEQ operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* neq_exp1_value = neq_exp1->inferExpVal(module, domain);
    firExp* neq_exp2_value = neq_exp2->inferExpVal(module, domain);
    this->updateExpVal(module, neq_exp1_value, neq_exp2_value);
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firPad::updateTypeData(firModule* module, firType* pad_exp_type, unsigned int pad_n) {
    fs_assert(module != NULL);
    if (pad_exp_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (pad_exp_type->isUIntType()) {
      if (dynamic_cast<firTypeUInt*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeUInt(-1));
      }
      firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
      firTypeUInt* u_exp_type = dynamic_cast<firTypeUInt*>(pad_exp_type);
      utype_data->reset();
      if (u_exp_type->valid_width()) {
        int width = std::max(u_exp_type->width(), static_cast<int>(pad_n));
        utype_data->set_width(width);
      }
    } else if (pad_exp_type->isSIntType()) {
      if (dynamic_cast<firTypeSInt*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeSInt(-1));
      }
      firTypeSInt* stype_data = dynamic_cast<firTypeSInt*>(this->type_data());
      firTypeSInt* s_exp_type = dynamic_cast<firTypeSInt*>(pad_exp_type);
      stype_data->reset();
      if (s_exp_type->valid_width()) {
        int width = std::max(s_exp_type->width(), static_cast<int>(pad_n));
        stype_data->set_width(width);
      }
    } else if (pad_exp_type->isFixedType()) {
      if (dynamic_cast<firTypeFixed*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeFixed());
      }
      firTypeFixed* ftype_data = dynamic_cast<firTypeFixed*>(this->type_data());
      firTypeFixed* f_exp_type = dynamic_cast<firTypeFixed*>(pad_exp_type);
      ftype_data->reset();
      if (f_exp_type->valid_binary()) {
        ftype_data->set_binary_point(f_exp_type->binary_point());
      }
      if (f_exp_type->valid_width()) {
        int width = std::max(f_exp_type->width(), static_cast<int>(pad_n));
        ftype_data->set_width(width);
      }
    } else {
      fs_error("*ERROR*: Failed to determine the type of the input in 'pad' expression '%s'.\n", this->toString().c_str());
      this->set_type_data(NULL);
    }
    return;
  }
  firDB::firType* firDB::firExpPrimOperation::firPad::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* pad_exp_type = this->exp()->getTypeData(module, domain);
      updateTypeData(module, pad_exp_type, this->n());
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firPad::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* pad_exp_type = this->exp()->inferDataType(module, domain);
    updateTypeData(module, pad_exp_type, this->n());
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firPad::updateExpVal(firModule* module, firExp* pad_exp_val, unsigned int pad_n) {
    fs_assert(module);
    // get pad exp val
    if (pad_exp_val == NULL) {
      //fs_error("*ERROR*: The pad expression in PAD operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_exp = UINT_MAX;
    BigInt* big_exp = NULL;
    bool signed_exp = false;
    if (pad_exp_val->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits1 = dynamic_cast<firExpUIntBits*>(pad_exp_val);
      width_exp = uint_bits1->width();
      big_exp = uint_bits1->big_value();
      signed_exp = false;
    } else if (pad_exp_val->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(pad_exp_val);
      width_exp = sint_bits1->width();
      big_exp = sint_bits1->big_value();
      signed_exp = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of expression in PAD operation '%s'.\n", pad_exp_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_exp == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of expression value '%s' in PAD operation '%s'.\n", pad_exp_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // calculate value result
    std::string pad_result_value = big_exp->pad(pad_n);
    int pad_width = std::max(width_exp, pad_n);
    firExp* pad_result_exp = NULL;
    if (signed_exp) {
      pad_result_exp = module->addExpSIntBits(pad_result_value, pad_width);
    } else {
      pad_result_exp = module->addExpUIntBits(pad_result_value, pad_width);
    }
    this->set_exp_val(pad_result_exp);
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firPad::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* pad_exp = this->exp();
    if (pad_exp == NULL) {
      fs_error("*ERROR*: The expression in PAD operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* pad_exp_value = pad_exp->getExpVal(module, domain);
      this->updateExpVal(module, pad_exp_value, this->n());
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firPad::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* pad_exp = this->exp();
    if (pad_exp == NULL) {
      fs_error("*ERROR*: The expression in PAD operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* pad_exp_value = pad_exp->inferExpVal(module, domain);
    this->updateExpVal(module, pad_exp_value, this->n());
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firAsUInt::updateTypeData(firModule* module, firType* asuint_exp_type) {
    fs_assert(module != NULL);
    if (asuint_exp_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (dynamic_cast<firTypeUInt*>(this->type_data()) == NULL) {
      this->set_type_data(module->addTypeUInt(-1));
    }
    firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
    utype_data->reset();
    if (asuint_exp_type->isUIntType()) {
      firTypeUInt* u_exp_type = dynamic_cast<firTypeUInt*>(asuint_exp_type);
      if (u_exp_type->valid_width()) {
        int width = u_exp_type->width();
        utype_data->set_width(width);
      }
    } else if (asuint_exp_type->isSIntType()) {
      firTypeSInt* s_exp_type = dynamic_cast<firTypeSInt*>(asuint_exp_type);
      if (s_exp_type->valid_width()) {
        int width = s_exp_type->width();
        utype_data->set_width(width);
      }
    } else if (asuint_exp_type->isFixedType()) {
      firTypeFixed* f_exp_type = dynamic_cast<firTypeFixed*>(asuint_exp_type);
      if (f_exp_type->valid_width()) {
        int width = f_exp_type->width();
        utype_data->set_width(width);
      }
    } else if (asuint_exp_type->isIntervalType()) {
      firTypeInterval* i_exp_type = dynamic_cast<firTypeInterval*>(asuint_exp_type);
      int bitwidth = 0;
      if (i_exp_type->getWidth(bitwidth)) {
        utype_data->set_width(bitwidth);
      }
    } else if (asuint_exp_type->isAnalogType()) {
      firTypeAnalog* a_exp_type = dynamic_cast<firTypeAnalog*>(asuint_exp_type);
      if (a_exp_type->valid_width()) {
        int width = a_exp_type->width();
        utype_data->set_width(width);
      }
    } else if (asuint_exp_type->isAsyncResetType()) {
      utype_data->set_width(1);
    } else if (asuint_exp_type->isClockType()) {
      utype_data->set_width(1);
    } else if (asuint_exp_type->isResetType()) {
      utype_data->set_width(1);
    } else {
      fs_error("*ERROR*: Failed to determine the type of the input in 'asuint' expression '%s'.\n", this->toString().c_str());
      this->set_type_data(NULL);
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firAsUInt::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* asuint_exp_type = this->exp()->getTypeData(module, domain);
      updateTypeData(module, asuint_exp_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firAsUInt::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* asuint_exp_type = this->exp()->inferDataType(module, domain);
    updateTypeData(module, asuint_exp_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firAsUInt::updateExpVal(firModule* module, firExp* asuint_exp_val) {
    fs_assert(module);
    // get pad exp val
    if (asuint_exp_val == NULL) {
      //fs_error("*ERROR*: The pad expression in ASUINT operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width = UINT_MAX;
    BigInt* bigint = NULL;
    if (asuint_exp_val->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits = dynamic_cast<firExpUIntBits*>(asuint_exp_val);
      width = uint_bits->width();
      bigint = uint_bits->big_value();
    } else if (asuint_exp_val->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits = dynamic_cast<firExpSIntBits*>(asuint_exp_val);
      width = sint_bits->width();
      bigint = sint_bits->big_value();
    } else {
      fs_error("*ERROR*: Illegal value '%s' of expression in ASUINT operation '%s'.\n", asuint_exp_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (bigint == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of expression value '%s' in ASUINT operation '%s'.\n", asuint_exp_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // calculate value result
    std::string asuint_result = bigint->asuint(width);
    firExp* asuint_result_exp = module->addExpUIntBits(asuint_result, width);
    this->set_exp_val(asuint_result_exp);
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firAsUInt::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* asuint_exp = this->exp();
    if (asuint_exp == NULL) {
      fs_error("*ERROR*: The expression in ASUINT operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* asuint_exp_value = asuint_exp->getExpVal(module, domain);
      this->updateExpVal(module, asuint_exp_value);
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firAsUInt::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* asuint_exp = this->exp();
    if (asuint_exp == NULL) {
      fs_error("*ERROR*: The expression in ASUINT operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* asuint_exp_value = asuint_exp->inferExpVal(module, domain);
    this->updateExpVal(module, asuint_exp_value);
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firAsSInt::updateTypeData(firModule* module, firType* assint_exp_type) {
    fs_assert(module != NULL);
    if (assint_exp_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (dynamic_cast<firTypeSInt*>(this->type_data()) == NULL) {
      this->set_type_data(module->addTypeSInt(-1));
    }
    firTypeSInt* stype_data = dynamic_cast<firTypeSInt*>(this->type_data());
    stype_data->reset();
    if (assint_exp_type->isUIntType()) {
      firTypeUInt* u_exp_type = dynamic_cast<firTypeUInt*>(assint_exp_type);
      if (u_exp_type->valid_width()) {
        int width = u_exp_type->width();
        stype_data->set_width(width);
      }
    } else if (assint_exp_type->isSIntType()) {
      firTypeSInt* s_exp_type = dynamic_cast<firTypeSInt*>(assint_exp_type);
      if (s_exp_type->valid_width()) {
        int width = s_exp_type->width();
        stype_data->set_width(width);
      }
    } else if (assint_exp_type->isFixedType()) {
      firTypeFixed* f_exp_type = dynamic_cast<firTypeFixed*>(assint_exp_type);
      if (f_exp_type->valid_width()) {
        int width = f_exp_type->width();
        stype_data->set_width(width);
      }
    } else if (assint_exp_type->isIntervalType()) {
      firTypeInterval* i_exp_type = dynamic_cast<firTypeInterval*>(assint_exp_type);
      int bitwidth = 0;
      if (i_exp_type->getWidth(bitwidth)) {
        stype_data->set_width(bitwidth);
      }
    } else if (assint_exp_type->isAnalogType()) {
      firTypeAnalog* a_exp_type = dynamic_cast<firTypeAnalog*>(assint_exp_type);
      if (a_exp_type->valid_width()) {
        int width = a_exp_type->width();
        stype_data->set_width(width);
      }
    } else if (assint_exp_type->isAsyncResetType()) {
      stype_data->set_width(1);
    } else if (assint_exp_type->isClockType()) {
      stype_data->set_width(1);
    } else if (assint_exp_type->isResetType()) {
      stype_data->set_width(1);
    } else {
      fs_error("*ERROR*: Failed to determine the type of the input in 'assint' expression '%s'.\n", this->toString().c_str());
      this->set_type_data(NULL);
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firAsSInt::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* assint_exp_type = this->exp()->getTypeData(module, domain);
      updateTypeData(module, assint_exp_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firAsSInt::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* assint_exp_type = this->exp()->inferDataType(module, domain);
    updateTypeData(module, assint_exp_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firAsSInt::updateExpVal(firModule* module, firExp* assint_exp_val) {
    fs_assert(module);
    // get pad exp val
    if (assint_exp_val == NULL) {
      //fs_error("*ERROR*: The pad expression in ASSINT operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width = UINT_MAX;
    BigInt* bigint = NULL;
    if (assint_exp_val->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits = dynamic_cast<firExpUIntBits*>(assint_exp_val);
      width = uint_bits->width();
      bigint = uint_bits->big_value();
    } else if (assint_exp_val->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits = dynamic_cast<firExpSIntBits*>(assint_exp_val);
      width = sint_bits->width();
      bigint = sint_bits->big_value();
    } else {
      fs_error("*ERROR*: Illegal value '%s' of expression in ASSINT operation '%s'.\n", assint_exp_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (bigint == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of expression value '%s' in ASSINT operation '%s'.\n", assint_exp_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // calculate value result
    std::string assint_result = bigint->assint(width);
    firExp* assint_result_exp = module->addExpSIntBits(assint_result, width);
    this->set_exp_val(assint_result_exp);
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firAsSInt::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* assint_exp = this->exp();
    if (assint_exp == NULL) {
      fs_error("*ERROR*: The expression in ASSINT operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* assint_exp_value = assint_exp->getExpVal(module, domain);
      this->updateExpVal(module, assint_exp_value);
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firAsSInt::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* assint_exp = this->exp();
    if (assint_exp == NULL) {
      fs_error("*ERROR*: The expression in ASSINT operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* assint_exp_value = assint_exp->inferExpVal(module, domain);
    this->updateExpVal(module, assint_exp_value);
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firAsClock::updateTypeData(firModule* module, firType* asclock_exp_type) {
    fs_assert(module != NULL);
    if (asclock_exp_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (asclock_exp_type->isUIntType()) {
      firTypeUInt* u_exp_type = dynamic_cast<firTypeUInt*>(asclock_exp_type);
      if (u_exp_type->valid_width() && u_exp_type->width() > 1) {
        fs_error("*ERROR*: The type of the input in 'asClock' operation '%s' was not single-bit UInt type. Correct the input and rerun.\n", this->toString().c_str());
        this->set_type_data(NULL);
      } else {
        if (dynamic_cast<firTypeClock*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeClock());
        }
      }
    } else if (asclock_exp_type->isClockType()) {
      if (dynamic_cast<firTypeClock*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeClock());
      }
    } else {
      fs_error("*ERROR*: The type of the input was not 'UInt' or 'Clock' in 'asClock' operation '%s'. Correct the input and rerun.\n", this->toString().c_str());
      this->set_type_data(NULL);
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firAsClock::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* asclock_exp_type = this->exp()->getTypeData(module, domain);
      updateTypeData(module, asclock_exp_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firAsClock::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* asclock_exp_type = this->exp()->inferDataType(module, domain);
    updateTypeData(module, asclock_exp_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firExp* firDB::firExpPrimOperation::firAsClock::getExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module);
    fs_assert(this->exp_val() == NULL);
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firAsClock::inferExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module);
    fs_assert(this->exp_val() == NULL);
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firAsFixed::updateTypeData(firModule* module, firType* asfixed_exp_type, int asfixed_bp) {
    fs_assert(module != NULL);
    if (asfixed_exp_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (dynamic_cast<firTypeFixed*>(this->type_data()) == NULL) {
      this->set_type_data(module->addTypeFixed());
    }
    firTypeFixed* ftype_data = dynamic_cast<firTypeFixed*>(this->type_data());
    ftype_data->reset();
    ftype_data->set_binary_point(asfixed_bp);
    if (asfixed_exp_type->isUIntType()) {
      firTypeUInt* u_exp_type = dynamic_cast<firTypeUInt*>(asfixed_exp_type);
      if (u_exp_type->valid_width()) {
        int width = u_exp_type->width();
        ftype_data->set_width(width);
      }
    } else if (asfixed_exp_type->isSIntType()) {
      firTypeSInt* s_exp_type = dynamic_cast<firTypeSInt*>(asfixed_exp_type);
      if (s_exp_type->valid_width()) {
        int width = s_exp_type->width();
        ftype_data->set_width(width);
      }
    } else if (asfixed_exp_type->isFixedType()) {
      firTypeFixed* f_exp_type = dynamic_cast<firTypeFixed*>(asfixed_exp_type);
      if (f_exp_type->valid_width()) {
        int width = f_exp_type->width();
        ftype_data->set_width(width);
      }
    } else if (asfixed_exp_type->isIntervalType()) {
      firTypeInterval* i_exp_type = dynamic_cast<firTypeInterval*>(asfixed_exp_type);
      int bitwidth = 0;
      if (i_exp_type->getWidth(bitwidth)) {
        ftype_data->set_width(bitwidth);
      }
    } else if (asfixed_exp_type->isAnalogType()) {
      firTypeAnalog* a_exp_type = dynamic_cast<firTypeAnalog*>(asfixed_exp_type);
      if (a_exp_type->valid_width()) {
        int width = a_exp_type->width();
        ftype_data->set_width(width);
      }
    } else if (asfixed_exp_type->isAsyncResetType() || asfixed_exp_type->isResetType() || asfixed_exp_type->isClockType()) {
      ftype_data->set_width(1);
    } else {
      fs_error("*ERROR*: Failed to determine the type of the input in 'asfixed' expression '%s'.\n", this->toString().c_str());
      this->set_type_data(NULL);
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firAsFixed::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* asfixed_exp_type = this->exp()->getTypeData(module, domain);
      updateTypeData(module, asfixed_exp_type, this->binary_point());
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firAsFixed::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* asfixed_exp_type = this->exp()->inferDataType(module, domain);
    updateTypeData(module, asfixed_exp_type, this->binary_point());
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firExp* firDB::firExpPrimOperation::firAsFixed::getExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module);
    fs_assert(this->exp_val() == NULL);
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firAsFixed::inferExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module);
    fs_assert(this->exp_val() == NULL);
    return this->exp_val();
  }

  void firDB::firExpPrimOperation::firAsAsyncReset::updateTypeData(firModule* module, firType* asasyncreset_exp_type) {
    fs_assert(module != NULL);
    if (asasyncreset_exp_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (asasyncreset_exp_type->isUIntType()) {
      firTypeUInt* u_exp_type = dynamic_cast<firTypeUInt*>(asasyncreset_exp_type);
      if (u_exp_type->valid_width() && u_exp_type->width() > 1) {
        fs_error("*ERROR*: The type of the input in 'asAsyncReset' operation '%s' was not single-bit 'UInt' type. Correct the input and rerun.\n", this->toString().c_str());
        this->set_type_data(NULL);
      } else {
        if (dynamic_cast<firTypeAsyncReset*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeAsyncReset());
        }
      }
    } else if (asasyncreset_exp_type->isResetType() || asasyncreset_exp_type->isAsyncResetType()) {
      if (dynamic_cast<firTypeAsyncReset*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeAsyncReset());
      }
    } else {
      fs_error("*ERROR*: The type of the input was not 'UInt', 'Reset' or 'AsyncReset' in 'asAsyncReset' operation '%s'. Correct the input and rerun.\n", this->toString().c_str());
      this->set_type_data(NULL);
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firAsAsyncReset::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* asasyncreset_exp_type = this->exp()->getTypeData(module, domain);
      updateTypeData(module, asasyncreset_exp_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firAsAsyncReset::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* asasyncreset_exp_type = this->exp()->inferDataType(module, domain);
    updateTypeData(module, asasyncreset_exp_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firExp* firDB::firExpPrimOperation::firAsAsyncReset::getExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module);
    fs_assert(this->exp_val() == NULL);
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firAsAsyncReset::inferExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module);
    fs_assert(this->exp_val() == NULL);
    return this->exp_val();
  }

  void firDB::firExpPrimOperation::firAsInterval::updateTypeData(firModule* module, firType* asreset_exp_type, int left, int right, unsigned int binary) {
    fs_assert(module != NULL);
    if (asreset_exp_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (!asreset_exp_type->isGroundType()) {
      fs_error("*ERROR*: The type of the input was not a ground type in 'asInterval' operation '%s'. Correct the input and rerun.\n", this->toString().c_str());
      this->set_type_data(NULL);
    } else {
      if (dynamic_cast<firTypeInterval*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeInterval());
      }
      firTypeInterval* i_exp_type = dynamic_cast<firTypeInterval*>(this->type_data());
      i_exp_type->reset();
      double lower = static_cast<double>(left / (1 << binary));
      double upper = static_cast<double>(right / (1 << binary));
      i_exp_type->set_value('[', lower, upper, ']', binary);
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firAsInterval::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* asreset_exp_type = this->exp()->getTypeData(module, domain);
      updateTypeData(module, asreset_exp_type, this->left(), this->right(), this->bit_width());
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firAsInterval::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* asreset_exp_type = this->exp()->inferDataType(module, domain);
    updateTypeData(module, asreset_exp_type, this->left(), this->right(), this->bit_width());
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firExp* firDB::firExpPrimOperation::firAsInterval::getExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module);
    fs_assert(this->exp_val() == NULL);
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firAsInterval::inferExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_assert(module);
    fs_assert(this->exp_val() == NULL);
    return this->exp_val();
  }

  void firDB::firExpPrimOperation::firShl::updateTypeData(firModule* module, firType* shl_exp_type, unsigned int shl_n) {
    fs_assert(module != NULL);
    if (shl_exp_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (shl_exp_type->isUIntType()) {
      if (dynamic_cast<firTypeUInt*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeUInt(-1));
      }
      firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
      firTypeUInt* u_exp_type = dynamic_cast<firTypeUInt*>(shl_exp_type);
      utype_data->reset();
      if (u_exp_type->valid_width()) {
        int width = u_exp_type->width() + static_cast<int>(shl_n);
        utype_data->set_width(width);
      }
    } else if (shl_exp_type->isSIntType()) {
      if (dynamic_cast<firTypeSInt*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeSInt(-1));
      }
      firTypeSInt* stype_data = dynamic_cast<firTypeSInt*>(this->type_data());
      firTypeSInt* s_exp_type = dynamic_cast<firTypeSInt*>(shl_exp_type);
      stype_data->reset();
      if (s_exp_type->valid_width()) {
        int width = s_exp_type->width() + static_cast<int>(shl_n);
        stype_data->set_width(width);
      }
    } else if (shl_exp_type->isFixedType()) {
      if (dynamic_cast<firTypeFixed*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeFixed());
      }
      firTypeFixed* ftype_data = dynamic_cast<firTypeFixed*>(this->type_data());
      firTypeFixed* f_exp_type = dynamic_cast<firTypeFixed*>(shl_exp_type);
      ftype_data->reset();
      if (f_exp_type->valid_binary()) {
        int bp = f_exp_type->binary_point();
        ftype_data->set_binary_point(bp);
      }
      if (f_exp_type->valid_width()) {
        int width = f_exp_type->width() + static_cast<int>(shl_n);
        ftype_data->set_width(width);
      }
    } else if (shl_exp_type->isIntervalType()) {
      if (dynamic_cast<firTypeInterval*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeInterval());
      }
      firTypeInterval* itype_data = dynamic_cast<firTypeInterval*>(this->type_data());
      firTypeInterval* i_exp_type = dynamic_cast<firTypeInterval*>(shl_exp_type);
      itype_data->reset();
      if (i_exp_type->trimInterval()) {
        double lower = i_exp_type->lower_value()*(static_cast<double>(1 << shl_n));
        double upper = i_exp_type->upper_value()*(static_cast<double>(1 << shl_n));
        itype_data->set_value('[', lower, upper, ']', i_exp_type->binary());
      }
    } else {
      fs_error("*ERROR*: Failed to determine the type of the input in 'shl' expression '%s'.\n", this->toString().c_str());
      this->set_type_data(NULL);
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firShl::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* shl_exp_type = this->exp()->getTypeData(module, domain);
      updateTypeData(module, shl_exp_type, this->n());
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firShl::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* shl_exp_type = this->exp()->inferDataType(module, domain);
    updateTypeData(module, shl_exp_type, this->n());
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firShl::updateExpVal(firModule* module, firExp* shl_exp_val, unsigned int shl_n) {
    fs_assert(module);
    // get shl exp val
    if (shl_exp_val == NULL) {
      //fs_error("*ERROR*: The expression in SHL operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_exp = UINT_MAX;
    BigInt* big_exp = NULL;
    bool signed_exp = false;
    if (shl_exp_val->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits1 = dynamic_cast<firExpUIntBits*>(shl_exp_val);
      width_exp = uint_bits1->width();
      big_exp = uint_bits1->big_value();
      signed_exp = false;
    } else if (shl_exp_val->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(shl_exp_val);
      width_exp = sint_bits1->width();
      big_exp = sint_bits1->big_value();
      signed_exp = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of expression in SHL operation '%s'.\n", shl_exp_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_exp == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of expression value '%s' in SHL operation '%s'.\n", shl_exp_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // calculate value result
    unsigned int result_width = width_exp + shl_n;
    std::string shl_result_value = big_exp->shl(shl_n, result_width);
    firExp* shl_result_exp = NULL;
    if (signed_exp) {
      shl_result_exp = module->addExpSIntBits(shl_result_value, result_width);
    } else {
      shl_result_exp = module->addExpUIntBits(shl_result_value, result_width);
    }
    this->set_exp_val(shl_result_exp);
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firShl::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* shl_exp = this->exp();
    if (shl_exp == NULL) {
      fs_error("*ERROR*: The expression in SHL operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* shl_exp_value = shl_exp->getExpVal(module, domain);
      this->updateExpVal(module, shl_exp_value, this->n());
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firShl::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* shl_exp = this->exp();
    if (shl_exp == NULL) {
      fs_error("*ERROR*: The expression in SHL operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* shl_exp_value = shl_exp->inferExpVal(module, domain);
    this->updateExpVal(module, shl_exp_value, this->n());
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firShr::updateTypeData(firModule* module, firType* shr_exp_type, unsigned int shr_n) {
    fs_assert(module != NULL);
    if (shr_exp_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (shr_exp_type->isUIntType()) {
      if (dynamic_cast<firTypeUInt*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeUInt(-1));
      }
      firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
      firTypeUInt* u_exp_type = dynamic_cast<firTypeUInt*>(shr_exp_type);
      utype_data->reset();
      if (u_exp_type->valid_width()) {
        int width = std::max(u_exp_type->width() - static_cast<int>(shr_n), 1);
        utype_data->set_width(width);
      }
    } else if (shr_exp_type->isSIntType()) {
      if (dynamic_cast<firTypeSInt*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeSInt(-1));
      }
      firTypeSInt* stype_data = dynamic_cast<firTypeSInt*>(this->type_data());
      firTypeSInt* s_exp_type = dynamic_cast<firTypeSInt*>(shr_exp_type);
      stype_data->reset();
      if (s_exp_type->valid_width()) {
        int width = std::max(s_exp_type->width() - static_cast<int>(shr_n), 1);
        stype_data->set_width(width);
      }
    } else if (shr_exp_type->isFixedType()) {
      if (dynamic_cast<firTypeFixed*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeFixed());
      }
      firTypeFixed* ftype_data = dynamic_cast<firTypeFixed*>(this->type_data());
      firTypeFixed* f_exp_type = dynamic_cast<firTypeFixed*>(shr_exp_type);
      ftype_data->reset();
      int bp = 0;
      if (f_exp_type->valid_binary()) {
        bp = f_exp_type->binary_point();
        ftype_data->set_binary_point(bp);
      }
      if (f_exp_type->valid_width()) {
        int width = std::max(std::max(f_exp_type->width() - static_cast<int>(shr_n), 1), bp);
        ftype_data->set_width(width);
      }
    } else if (shr_exp_type->isIntervalType()) {
      if (dynamic_cast<firTypeInterval*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeInterval());
      }
      firTypeInterval* itype_data = dynamic_cast<firTypeInterval*>(this->type_data());
      firTypeInterval* i_exp_type = dynamic_cast<firTypeInterval*>(shr_exp_type);
      itype_data->reset();
      if (i_exp_type->trimInterval()) {
        int bp = i_exp_type->binary();
        double shiftMul = static_cast<double>(1 / 1 << shr_n);
        double bpRes = static_cast<double>(1 / 1 << bp);
        double bpResInv = static_cast<double>(1 << bp);
        double lower = floor(i_exp_type->lower_value() * shiftMul * bpResInv) * bpRes;
        double upper = floor(i_exp_type->upper_value() * shiftMul * bpResInv) * bpRes;
        itype_data->set_value('[', lower, upper, ']', i_exp_type->binary());
      }
    } else {
      fs_error("*ERROR*: Failed to determine the type of the input in 'shr' expression '%s'.\n", this->toString().c_str());
      this->set_type_data(NULL);
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firShr::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* shr_exp_type = this->exp()->getTypeData(module, domain);
      updateTypeData(module, shr_exp_type, this->n());
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firShr::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* shr_exp_type = this->exp()->inferDataType(module, domain);
    updateTypeData(module, shr_exp_type, this->n());
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firShr::updateExpVal(firModule* module, firExp* shr_exp_val, unsigned int shr_n) {
    fs_assert(module);
    // get shl exp val
    if (shr_exp_val == NULL) {
      //fs_error("*ERROR*: The expression in SHL operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_exp = UINT_MAX;
    BigInt* big_exp = NULL;
    bool signed_exp = false;
    if (shr_exp_val->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits1 = dynamic_cast<firExpUIntBits*>(shr_exp_val);
      width_exp = uint_bits1->width();
      big_exp = uint_bits1->big_value();
      signed_exp = false;
    } else if (shr_exp_val->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(shr_exp_val);
      width_exp = sint_bits1->width();
      big_exp = sint_bits1->big_value();
      signed_exp = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of expression in SHR operation '%s'.\n", shr_exp_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_exp == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of expression value '%s' in SHR operation '%s'.\n", shr_exp_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // calculate value result
    unsigned int result_width = (unsigned int)std::max((int)width_exp - (int)shr_n, 1);
    std::string shr_result_value = big_exp->shr(shr_n, result_width);
    firExp* shr_result_exp = NULL;
    if (signed_exp) {
      shr_result_exp = module->addExpSIntBits(shr_result_value, result_width);
    } else {
      shr_result_exp = module->addExpUIntBits(shr_result_value, result_width);
    }
    this->set_exp_val(shr_result_exp);
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firShr::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* shr_exp = this->exp();
    if (shr_exp == NULL) {
      fs_error("*ERROR*: The expression in SHR operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* shr_exp_value = shr_exp->getExpVal(module, domain);
      this->updateExpVal(module, shr_exp_value, this->n());
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firShr::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* shr_exp = this->exp();
    if (shr_exp == NULL) {
      fs_error("*ERROR*: The expression in SHR operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* shr_exp_value = shr_exp->inferExpVal(module, domain);
    this->updateExpVal(module, shr_exp_value, this->n());
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firDshl::updateTypeData(firModule* module, firType* dshl_exp1_type, firType* dshl_exp2_type) {
    fs_assert(module != NULL);
    if (dshl_exp1_type == NULL || dshl_exp2_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (!dshl_exp2_type->isUIntType()) {
      fs_error("*ERROR*: The second input of 'dshl' operation '%s' must be UInt.\n", this->toString().c_str());
      this->set_type_data(NULL);
    } else {
      firTypeUInt* u_exp2_type = dynamic_cast<firTypeUInt*>(dshl_exp2_type);
      if (dshl_exp1_type->isUIntType()) {
        if (dynamic_cast<firTypeUInt*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeUInt(-1));
        }
        firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
        firTypeUInt* u_exp1_type = dynamic_cast<firTypeUInt*>(dshl_exp1_type);
        utype_data->reset();
        if (u_exp1_type->valid_width() && u_exp2_type->valid_width()) {
          int width = u_exp1_type->width() + static_cast<int>(pow(2, u_exp2_type->width()) - 1);
          utype_data->set_width(width);
        }
      } else if (dshl_exp1_type->isSIntType()) {
        if (dynamic_cast<firTypeSInt*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeSInt(-1));
        }
        firTypeSInt* stype_data = dynamic_cast<firTypeSInt*>(this->type_data());
        firTypeSInt* s_exp1_type = dynamic_cast<firTypeSInt*>(dshl_exp1_type);
        stype_data->reset();
        if (s_exp1_type->valid_width() && u_exp2_type->valid_width()) {
          int width = s_exp1_type->width() + static_cast<int>(pow(2, u_exp2_type->width())) - 1;
          stype_data->set_width(width);
        }
      } else if (dshl_exp1_type->isFixedType()) {
        if (dynamic_cast<firTypeFixed*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeFixed());
        }
        firTypeFixed* ftype_data = dynamic_cast<firTypeFixed*>(this->type_data());
        firTypeFixed* f_exp1_type = dynamic_cast<firTypeFixed*>(dshl_exp1_type);
        ftype_data->reset();
        if (f_exp1_type->valid_binary()) {
          ftype_data->set_binary_point(f_exp1_type->binary_point());
        }
        if (f_exp1_type->valid_width() && u_exp2_type->valid_width()) {
          int width = f_exp1_type->width() + static_cast<int>(pow(2, u_exp2_type->width())) - 1;
          ftype_data->set_width(width);
        }
      } else if (dshl_exp1_type->isIntervalType()) {
        if (dynamic_cast<firTypeInterval*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeInterval());
        }
        firTypeInterval* itype_data = dynamic_cast<firTypeInterval*>(this->type_data());
        firTypeInterval* i_exp1_type = dynamic_cast<firTypeInterval*>(dshl_exp1_type);
        itype_data->reset();
        if (i_exp1_type->trimInterval() && u_exp2_type->valid_width()) {
          double maxShiftAmt = pow(2, u_exp2_type->width()) - 1;
          double shiftMul = pow(2, maxShiftAmt);
          double newL = std::min(i_exp1_type->lower_value(), (i_exp1_type->lower_value() * shiftMul));
          double newU = std::min(i_exp1_type->upper_value(), (i_exp1_type->upper_value() * shiftMul));
          itype_data->set_value('[', newL, newU, ']', i_exp1_type->binary());
        }
      } else {
        fs_error("*ERROR*: Failed to determine the type of the first option in 'dshl' expression '%s'.\n", this->toString().c_str());
        this->set_type_data(NULL);
      }
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firDshl::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* dshl_exp1_type = this->exp1()->getTypeData(module, domain);
      firType* dshl_exp2_type = this->exp2()->getTypeData(module, domain);
      updateTypeData(module, dshl_exp1_type, dshl_exp2_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firDshl::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* dshl_exp1_type = this->exp1()->inferDataType(module, domain);
    firType* dshl_exp2_type = this->exp2()->inferDataType(module, domain);
    updateTypeData(module, dshl_exp1_type, dshl_exp2_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firDshl::updateExpVal(firModule* module, firExp* dshl_exp1_val, firExp* dshl_exp2_val) {
    fs_assert(module);
    if (dshl_exp1_val == NULL) {
      //fs_error("*ERROR*: The left expression in DSHL operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (dshl_exp2_val == NULL) {
      //fs_error("*ERROR*: The right expression in DSHL operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    BigInt* dshl_exp2_bigint = NULL;
    unsigned int dshl_exp2_width = UINT_MAX;
    if (dshl_exp2_val->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits2 = dynamic_cast<firExpUIntBits*>(dshl_exp2_val);
      dshl_exp2_bigint = uint_bits2->big_value();
      dshl_exp2_width = uint_bits2->width();
    } else {
      fs_error("*ERROR*: The second value in DSHL expression '%s' was not 'UIntBits' type.\n", dshl_exp2_val->toString().c_str());
      this->set_type_data(NULL);
      return;
    }
    unsigned int width_exp1 = UINT_MAX;
    BigInt* big_exp1 = NULL;
    bool signed_exp1 = false;
    if (dshl_exp1_val->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits1 = dynamic_cast<firExpUIntBits*>(dshl_exp1_val);
      width_exp1 = uint_bits1->width();
      big_exp1 = uint_bits1->big_value();
      signed_exp1 = false;
    } else if (dshl_exp1_val->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(dshl_exp1_val);
      width_exp1 = sint_bits1->width();
      big_exp1 = sint_bits1->big_value();
      signed_exp1 = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of first expression in DSHL operation '%s'.\n", dshl_exp1_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_exp1 == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of first expression value '%s' in DSHL operation '%s'.\n", dshl_exp1_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // calculate value result
    unsigned int result_width = width_exp1 + (int)std::pow(2, dshl_exp2_width) - 1;
    std::string dshl_result_value = big_exp1->dshl(dshl_exp2_bigint, result_width);
    firExp* dshl_result_exp = NULL;
    if (signed_exp1) {
      dshl_result_exp = module->addExpSIntBits(dshl_result_value, result_width);
    } else {
      dshl_result_exp = module->addExpUIntBits(dshl_result_value, result_width);
    }
    this->set_exp_val(dshl_result_exp);
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firDshl::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* dshl_exp1 = this->exp1();
    if (dshl_exp1 == NULL) {
      fs_error("*ERROR*: The expression in DSHL operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* dshl_exp2 = this->exp2();
    if (dshl_exp2 == NULL) {
      fs_error("*ERROR*: The expression in DSHL operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* dshl_exp1_value = dshl_exp1->getExpVal(module, domain);
      firExp* dshl_exp2_value = dshl_exp2->getExpVal(module, domain);
      this->updateExpVal(module, dshl_exp1_value, dshl_exp2_value);
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firDshl::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* dshl_exp1 = this->exp1();
    if (dshl_exp1 == NULL) {
      fs_error("*ERROR*: The first expression in DSHL operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* dshl_exp2 = this->exp2();
    if (dshl_exp2 == NULL) {
      fs_error("*ERROR*: The second expression in DSHL operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* dshl_exp1_value = dshl_exp1->inferExpVal(module, domain);
    firExp* dshl_exp2_value = dshl_exp2->inferExpVal(module, domain);
    this->updateExpVal(module, dshl_exp1_value, dshl_exp2_value);
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firDshr::updateTypeData(firModule* module, firType* dshr_exp1_type, firType* dshr_exp2_type) {
    fs_assert(module != NULL);
    if (dshr_exp1_type == NULL || dshr_exp2_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (!dshr_exp2_type->isUIntType()) {
      fs_error("*ERROR*: The second input of 'dshr' operation '%s' must be UInt.\n", this->toString().c_str());
      this->set_type_data(NULL);
    } else {
      if (dshr_exp1_type->isUIntType()) {
        if (dynamic_cast<firTypeUInt*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeUInt(-1));
        }
        firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
        firTypeUInt* u_exp1_type = dynamic_cast<firTypeUInt*>(dshr_exp1_type);
        utype_data->reset();
        if (u_exp1_type->valid_width()) {
          int width = u_exp1_type->width();
          utype_data->set_width(width);
        }
      } else if (dshr_exp1_type->isSIntType()) {
        if (dynamic_cast<firTypeSInt*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeSInt(-1));
        }
        firTypeSInt* stype_data = dynamic_cast<firTypeSInt*>(this->type_data());
        firTypeSInt* s_exp1_type = dynamic_cast<firTypeSInt*>(dshr_exp1_type);
        stype_data->reset();
        if (s_exp1_type->valid_width()) {
          int width = s_exp1_type->width();
          stype_data->set_width(width);
        }
      } else if (dshr_exp1_type->isFixedType()) {
        if (dynamic_cast<firTypeFixed*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeFixed());
        }
        firTypeFixed* ftype_data = dynamic_cast<firTypeFixed*>(this->type_data());
        firTypeFixed* f_exp1_type = dynamic_cast<firTypeFixed*>(dshr_exp1_type);
        ftype_data->reset();
        if (f_exp1_type->valid_binary()) {
          ftype_data->set_binary_point(f_exp1_type->binary_point());
        }
        if (f_exp1_type->valid_width()) {
          int width = f_exp1_type->width();
          ftype_data->set_width(width);
        }
      } else if (dshr_exp1_type->isIntervalType()) {
        if (dynamic_cast<firTypeInterval*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeInterval());
        }
        firTypeInterval* itype_data = dynamic_cast<firTypeInterval*>(this->type_data());
        firTypeInterval* i_exp1_type = dynamic_cast<firTypeInterval*>(dshr_exp1_type);
        itype_data->reset();
        if (i_exp1_type->trimInterval()) {
          double lower = i_exp1_type->lower_value();
          double upper = i_exp1_type->upper_value();
          int binary = i_exp1_type->binary();
          itype_data->set_value('[', lower, upper, ']', binary);
        }
      } else {
        fs_error("*ERROR*: Failed to determine the type of the first option in 'dshr' expression '%s'.\n", this->toString().c_str());
        this->set_type_data(NULL);
      }
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firDshr::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* dshr_exp1_type = this->exp1()->getTypeData(module, domain);
      firType* dshr_exp2_type = this->exp2()->getTypeData(module, domain);
      updateTypeData(module, dshr_exp1_type, dshr_exp2_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firDshr::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* dshr_exp1_type = this->exp1()->inferDataType(module, domain);
    firType* dshr_exp2_type = this->exp2()->inferDataType(module, domain);
    updateTypeData(module, dshr_exp1_type, dshr_exp2_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firDshr::updateExpVal(firModule* module, firExp* dshr_exp1_val, firExp* dshr_exp2_val) {
    fs_assert(module);
    if (dshr_exp1_val == NULL) {
      //fs_error("*ERROR*: The left expression in DSHR operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (dshr_exp2_val == NULL) {
      //fs_error("*ERROR*: The right expression in DSHR operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    BigInt* dshr_exp2_bigint = NULL;
    unsigned int dshr_exp2_width = UINT_MAX;
    if (dshr_exp2_val->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits2 = dynamic_cast<firExpUIntBits*>(dshr_exp2_val);
      dshr_exp2_bigint = uint_bits2->big_value();
      dshr_exp2_width = uint_bits2->width();
    } else {
      fs_error("*ERROR*: The second value in DSHR expression '%s' was not 'UIntBits' type.\n", dshr_exp2_val->toString().c_str());
      this->set_type_data(NULL);
      return;
    }
    unsigned int width_exp1 = UINT_MAX;
    BigInt* big_exp1 = NULL;
    bool signed_exp1 = false;
    if (dshr_exp1_val->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits1 = dynamic_cast<firExpUIntBits*>(dshr_exp1_val);
      width_exp1 = uint_bits1->width();
      big_exp1 = uint_bits1->big_value();
      signed_exp1 = false;
    } else if (dshr_exp1_val->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(dshr_exp1_val);
      width_exp1 = sint_bits1->width();
      big_exp1 = sint_bits1->big_value();
      signed_exp1 = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of first expression in DSHR operation '%s'.\n", dshr_exp1_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_exp1 == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of first expression value '%s' in DSHR operation '%s'.\n", dshr_exp1_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // calculate value result
    unsigned int result_width = width_exp1;
    std::string dshr_result_value = big_exp1->dshr(dshr_exp2_bigint, result_width);
    firExp* dshr_result_exp = NULL;
    if (signed_exp1) {
      dshr_result_exp = module->addExpSIntBits(dshr_result_value, result_width);
    } else {
      dshr_result_exp = module->addExpUIntBits(dshr_result_value, result_width);
    }
    this->set_exp_val(dshr_result_exp);
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firDshr::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* dshr_exp1 = this->exp1();
    if (dshr_exp1 == NULL) {
      fs_error("*ERROR*: The expression in DSHR operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* dshr_exp2 = this->exp2();
    if (dshr_exp2 == NULL) {
      fs_error("*ERROR*: The expression in DSHR operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* dshr_exp1_value = dshr_exp1->getExpVal(module, domain);
      firExp* dshr_exp2_value = dshr_exp2->getExpVal(module, domain);
      this->updateExpVal(module, dshr_exp1_value, dshr_exp2_value);
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firDshr::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* dshr_exp1 = this->exp1();
    if (dshr_exp1 == NULL) {
      fs_error("*ERROR*: The first expression in DSHL operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* dshr_exp2 = this->exp2();
    if (dshr_exp2 == NULL) {
      fs_error("*ERROR*: The second expression in DSHL operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* dshr_exp1_value = dshr_exp1->inferExpVal(module, domain);
    firExp* dshr_exp2_value = dshr_exp2->inferExpVal(module, domain);
    this->updateExpVal(module, dshr_exp1_value, dshr_exp2_value);
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firCvt::updateTypeData(firModule* module, firType* cvt_exp_type) {
    fs_assert(module != NULL);
    if (cvt_exp_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (dynamic_cast<firTypeSInt*>(this->type_data()) == NULL) {
      this->set_type_data(module->addTypeSInt(-1));
    }
    firTypeSInt* stype_data = dynamic_cast<firTypeSInt*>(this->type_data());
    stype_data->reset();
    if (cvt_exp_type->isUIntType()) {
      firTypeUInt* u_exp_type = dynamic_cast<firTypeUInt*>(cvt_exp_type);
      if (u_exp_type->valid_width()) {
        int width = u_exp_type->width() + 1;
        stype_data->set_width(width);
      }
    } else if (cvt_exp_type->isSIntType()) {
      firTypeSInt* s_exp_type = dynamic_cast<firTypeSInt*>(cvt_exp_type);
      if (s_exp_type->valid_width()) {
        int width = s_exp_type->width();
        stype_data->set_width(width);
      }
    } else {
      fs_error("*ERROR*: Failed to determine the type of the input in 'cvt' expression '%s'.\n", this->toString().c_str());
      this->set_type_data(NULL);
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firCvt::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* cvt_exp_type = this->exp()->getTypeData(module, domain);
      updateTypeData(module, cvt_exp_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firCvt::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* cvt_exp_type = this->exp()->inferDataType(module, domain);
    updateTypeData(module, cvt_exp_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firCvt::updateExpVal(firModule* module, firExp* cvt_exp_val) {
    fs_assert(module);
    // get cvt exp val
    if (cvt_exp_val == NULL) {
      //fs_error("*ERROR*: The pad expression in CVT operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int cvt_result_width = UINT_MAX;
    BigInt* big_exp = NULL;
    if (cvt_exp_val->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits1 = dynamic_cast<firExpUIntBits*>(cvt_exp_val);
      cvt_result_width = uint_bits1->width() + 1;
      big_exp = uint_bits1->big_value();
    } else if (cvt_exp_val->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(cvt_exp_val);
      cvt_result_width = sint_bits1->width();
      big_exp = sint_bits1->big_value();
    } else {
      fs_error("*ERROR*: Illegal value '%s' of expression in CVT operation '%s'.\n", cvt_exp_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_exp == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of expression value '%s' in CVT operation '%s'.\n", cvt_exp_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // calculate value result
    std::string cvt_result_value = big_exp->cvt();
    firExp* cvt_result_exp = module->addExpSIntBits(cvt_result_value, cvt_result_width);
    this->set_exp_val(cvt_result_exp);
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firCvt::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* cvt_exp = this->exp();
    if (cvt_exp == NULL) {
      fs_error("*ERROR*: The expression in CVT operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* cvt_exp_value = cvt_exp->getExpVal(module, domain);
      this->updateExpVal(module, cvt_exp_value);
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firCvt::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* cvt_exp = this->exp();
    if (cvt_exp == NULL) {
      fs_error("*ERROR*: The expression in CVT operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* cvt_exp_value = cvt_exp->inferExpVal(module, domain);
    this->updateExpVal(module, cvt_exp_value);
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firNeg::updateTypeData(firModule* module, firType* neg_exp_type) {
    fs_assert(module != NULL);
    if (neg_exp_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (dynamic_cast<firTypeSInt*>(this->type_data()) == NULL) {
      this->set_type_data(module->addTypeSInt(-1));
    }
    firTypeSInt* stype_data = dynamic_cast<firTypeSInt*>(this->type_data());
    stype_data->reset();
    if (neg_exp_type->isUIntType()) {
      firTypeUInt* u_exp_type = dynamic_cast<firTypeUInt*>(neg_exp_type);
      if (u_exp_type->valid_width()) {
        int width = u_exp_type->width() + 1;
        stype_data->set_width(width);
      }
    } else if (neg_exp_type->isSIntType()) {
      firTypeSInt* s_exp_type = dynamic_cast<firTypeSInt*>(neg_exp_type);
      if (s_exp_type->valid_width()) {
        int width = s_exp_type->width() + 1;
        stype_data->set_width(width);
      }
    } else {
      fs_error("*ERROR*: Failed to determine the type of the input in 'neg' expression '%s'.\n", this->toString().c_str());
      this->set_type_data(NULL);
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firNeg::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* neg_exp_type = this->exp()->getTypeData(module, domain);
      updateTypeData(module, neg_exp_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firNeg::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* neg_exp_type = this->exp()->inferDataType(module, domain);
    updateTypeData(module, neg_exp_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firNeg::updateExpVal(firModule* module, firExp* neg_exp_val) {
    fs_assert(module);
    if (neg_exp_val == NULL) {
      //fs_error("*ERROR*: The expression in NEG operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int exp_width = UINT_MAX;
    BigInt* exp_big = NULL;
    //bool exp_signed = false;
    if (neg_exp_val->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits = dynamic_cast<firExpUIntBits*>(neg_exp_val);
      exp_width = uint_bits->width();
      exp_big = uint_bits->big_value();
      //exp_signed = false;
    } else if (neg_exp_val->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(neg_exp_val);
      exp_width = sint_bits1->width();
      exp_big = sint_bits1->big_value();
      //exp_signed = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of expression in NEG operation '%s'.\n", neg_exp_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (exp_big == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of expression value '%s' in NEG operation '%s'.\n", neg_exp_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // calculate value result
    std::string neg_result_value = exp_big->neg();
    int neg_result_width = exp_width + 1;
    firExp* neg_result_exp = module->addExpSIntBits(neg_result_value, neg_result_width);
    this->set_exp_val(neg_result_exp);
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firNeg::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* neg_exp = this->exp();
    if (neg_exp == NULL) {
      fs_error("*ERROR*: The expression in NEG operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* neg_exp_value = neg_exp->getExpVal(module, domain);
      this->updateExpVal(module, neg_exp_value);
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firNeg::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* neg_exp = this->exp();
    if (neg_exp == NULL) {
      fs_error("*ERROR*: The expression in NEG operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* neg_exp_value = neg_exp->inferExpVal(module, domain);
    this->updateExpVal(module, neg_exp_value);
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firNot::updateTypeData(firModule* module, firType* not_exp_type) {
    fs_assert(module != NULL);
    if (not_exp_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (dynamic_cast<firTypeUInt*>(this->type_data()) == NULL) {
      this->set_type_data(module->addTypeUInt(-1));
    }
    firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
    utype_data->reset();
    if (not_exp_type->isUIntType()) {
      firTypeUInt* u_exp_type = dynamic_cast<firTypeUInt*>(not_exp_type);
      if (u_exp_type->valid_width()) {
        int width = u_exp_type->width();
        utype_data->set_width(width);
      }
    } else if (not_exp_type->isSIntType()) {
      firTypeSInt* s_exp_type = dynamic_cast<firTypeSInt*>(not_exp_type);
      if (s_exp_type->valid_width()) {
        int width = s_exp_type->width();
        utype_data->set_width(width);
      }
    } else {
      fs_error("*ERROR*: Failed to determine the type of the input in 'not' expression '%s'.\n", this->toString().c_str());
      this->set_type_data(NULL);
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firNot::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* not_exp_type = this->exp()->getTypeData(module, domain);
      updateTypeData(module, not_exp_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firNot::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* not_exp_type = this->exp()->inferDataType(module, domain);
    updateTypeData(module, not_exp_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firNot::updateExpVal(firModule* module, firExp* not_exp_val) {
    fs_assert(module);
    if (not_exp_val == NULL) {
      //fs_error("*ERROR*: The expression in NOT operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int exp_width = UINT_MAX;
    BigInt* exp_big = NULL;
    if (not_exp_val->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits = dynamic_cast<firExpUIntBits*>(not_exp_val);
      exp_width = uint_bits->width();
      exp_big = uint_bits->big_value();
    } else if (not_exp_val->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(not_exp_val);
      exp_width = sint_bits1->width();
      exp_big = sint_bits1->big_value();
    } else {
      fs_error("*ERROR*: Illegal value '%s' of expression in NOT operation '%s'.\n", not_exp_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (exp_big == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of expression value '%s' in NOT operation '%s'.\n", not_exp_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // calculate value result
    std::string not_result_value = exp_big->not_op(exp_width);
    int not_result_width = exp_width;
    firExp* not_result_exp = module->addExpUIntBits(not_result_value, not_result_width);
    this->set_exp_val(not_result_exp);
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firNot::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* not_exp = this->exp();
    if (not_exp == NULL) {
      fs_error("*ERROR*: The expression in NOT operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* not_exp_value = not_exp->getExpVal(module, domain);
      this->updateExpVal(module, not_exp_value);
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firNot::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* not_exp = this->exp();
    if (not_exp == NULL) {
      fs_error("*ERROR*: The expression in NOT operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* not_exp_value = not_exp->inferExpVal(module, domain);
    this->updateExpVal(module, not_exp_value);
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firAnd::updateTypeData(firModule* module, firType* and_exp1_type, firType* and_exp2_type) {
    fs_assert(module != NULL);
    if (and_exp1_type == NULL || and_exp2_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (!and_exp1_type->isEqual(and_exp2_type)) {
      fs_error("*ERROR*: The types of the two inputs in 'and' operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
      this->set_type_data(NULL);
    } else {
      if (dynamic_cast<firTypeUInt*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeUInt(-1));
      }
      firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
      utype_data->reset();
      if (and_exp1_type->isUIntType()) {
        firTypeUInt* utype1 = dynamic_cast<firTypeUInt*>(and_exp1_type);
        firTypeUInt* utype2 = dynamic_cast<firTypeUInt*>(and_exp2_type);
        if (utype1->valid_width() && utype2->valid_width()) {
          int width = std::max(utype1->width(), utype2->width());
          utype_data->set_width(width);
        } else if (utype1->valid_width() && !utype2->valid_width()) {
          int width = utype1->width();
          utype_data->set_width(width);
        } else if (!utype1->valid_width() && utype2->valid_width()) {
          int width = utype2->width();
          utype_data->set_width(width);
        }
      } else if (and_exp1_type->isSIntType()) {
        firTypeSInt* stype1 = dynamic_cast<firTypeSInt*>(and_exp1_type);
        firTypeSInt* stype2 = dynamic_cast<firTypeSInt*>(and_exp2_type);
        if (stype1->valid_width() && stype2->valid_width()) {
          int width = std::max(stype1->width(), stype2->width());
          utype_data->set_width(width);
        } else if (stype1->valid_width() && !stype2->valid_width()) {
          int width = stype1->width();
          utype_data->set_width(width);
        } else if (!stype1->valid_width() && stype2->valid_width()) {
          int width = stype2->width();
          utype_data->set_width(width);
        }
      } else {
        fs_error("*ERROR*: Failed to determine the type of the input in 'and' expression '%s'.\n", this->toString().c_str());
        this->set_type_data(NULL);
      }
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firAnd::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* and_exp1_type = this->exp1()->getTypeData(module, domain);
      firType* and_exp2_type = this->exp2()->getTypeData(module, domain);
      updateTypeData(module, and_exp1_type, and_exp2_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firAnd::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* and_exp1_type = this->exp1()->inferDataType(module, domain);
    firType* and_exp2_type = this->exp2()->inferDataType(module, domain);
    updateTypeData(module, and_exp1_type, and_exp2_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firAnd::updateExpVal(firModule* module, firExp* and_exp1_value, firExp* and_exp2_value) {
    fs_assert(module);
    // get bigint1
    unsigned int width_left = UINT_MAX;
    BigInt* big_left = NULL;
    bool signed_left = false;
    if (and_exp1_value != NULL) {
      if (and_exp1_value->isUIntBitsExpression()) {
        firExpUIntBits* uint_bits1 = dynamic_cast<firExpUIntBits*>(and_exp1_value);
        width_left = uint_bits1->width();
        big_left = uint_bits1->big_value();
        signed_left = false;
      } else if (and_exp1_value->isSIntBitsExpression()) {
        firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(and_exp1_value);
        width_left = sint_bits1->width();
        big_left = sint_bits1->big_value();
        signed_left = true;
      } else {
        fs_error("*ERROR*: Illegal value '%s' of left expression in AND operation '%s'.\n", and_exp1_value->toString().c_str(), this->toString().c_str());
        this->set_exp_val(NULL);
        return;
      }
      if (big_left == NULL) {
        fs_error("*ERROR*: Failed to get the BigInt value of left expression value '%s' in AND operation '%s'.\n", and_exp1_value->toString().c_str(), this->toString().c_str());
        this->set_exp_val(NULL);
        return;
      }
    }
    // get bigint2
    unsigned int width_right = INT_MAX;
    BigInt* big_right = NULL;
    bool signed_right = false;
    if (and_exp2_value != NULL) {
      if (and_exp2_value->isUIntBitsExpression()) {
        firExpUIntBits* uint_bits2 = dynamic_cast<firExpUIntBits*>(and_exp2_value);
        width_right = uint_bits2->width();
        big_right = uint_bits2->big_value();
        signed_right = false;
      } else if (and_exp2_value->isSIntBitsExpression()) {
        firExpSIntBits* sint_bits2 = dynamic_cast<firExpSIntBits*>(and_exp2_value);
        width_right = sint_bits2->width();
        big_right = sint_bits2->big_value();
        signed_right = true;
      } else {
        fs_error("*ERROR*: Illegal value '%s' of right expression in AND operation '%s'.\n", and_exp2_value->toString().c_str(), this->toString().c_str());
        this->set_exp_val(NULL);
        return;
      }
      if (big_right == NULL) {
        fs_error("*ERROR*: Failed to get the BigInt value of right expression value '%s' in AND operation '%s'.\n", and_exp2_value->toString().c_str(), this->toString().c_str());
        this->set_exp_val(NULL);
        return;
      }
    }
    // calculate value result
    std::string and_result_value;
    int and_width;
    if (and_exp2_value == NULL && and_exp1_value == NULL) {
      this->set_exp_val(NULL);
      return;
    } else {
      if (and_exp1_value == NULL && big_right->eq(0)) {
        and_result_value = "h0";
        firDB::firType* and_type = this->type_data();
        firDB::firTypeUInt* u_and_type = dynamic_cast<firDB::firTypeUInt*>(and_type);
        fs_assert(u_and_type != NULL);
        and_width = u_and_type->width();
      } else if (and_exp2_value == NULL && big_left->eq(0)) {
        and_result_value = "h0";
        firDB::firType* and_type = this->type_data();
        firDB::firTypeUInt* u_and_type = dynamic_cast<firDB::firTypeUInt*>(and_type);
        fs_assert(u_and_type != NULL);
        and_width = u_and_type->width();
      } else if (and_exp1_value != NULL && and_exp2_value != NULL) {
        if (signed_left != signed_right) {
          fs_error("*ERROR*: The types of the two inputs in AND operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
          return;
        }
        and_result_value = big_left->and_op(big_right);
        and_width = std::max(width_left, width_right);
      } else {
        this->set_exp_val(NULL);
        return;
      }
      firExp* and_result_exp = module->addExpUIntBits(and_result_value, and_width);
      this->set_exp_val(and_result_exp);
    }
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firAnd::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* and_exp1 = this->exp1();
    if (and_exp1 == NULL) {
      fs_error("*ERROR*: The left expression in AND operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* and_exp2 = this->exp2();
    if (and_exp2 == NULL) {
      fs_error("*ERROR*: The right expression in AND operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* and_exp1_value = and_exp1->getExpVal(module, domain);
      firExp* and_exp2_value = and_exp2->getExpVal(module, domain);
      this->updateExpVal(module, and_exp1_value, and_exp2_value);
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firAnd::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* and_exp1 = this->exp1();
    if (and_exp1 == NULL) {
      fs_error("*ERROR*: The left expression in AND operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* and_exp2 = this->exp2();
    if (and_exp2 == NULL) {
      fs_error("*ERROR*: The right expression in ADD operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* and_exp1_value = and_exp1->inferExpVal(module, domain);
    firExp* and_exp2_value = and_exp2->inferExpVal(module, domain);
    this->updateExpVal(module, and_exp1_value, and_exp2_value);
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firOr::updateTypeData(firModule* module, firType* or_exp1_type, firType* or_exp2_type) {
    fs_assert(module != NULL);
    if (or_exp1_type == NULL || or_exp2_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (!or_exp1_type->isEqual(or_exp2_type)) {
      fs_error("*ERROR*: The types of the two inputs in 'or' operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
      this->set_type_data(NULL);
    } else {
      if (dynamic_cast<firTypeUInt*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeUInt(-1));
      }
      firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
      utype_data->reset();
      if (or_exp1_type->isUIntType()) {
        firTypeUInt* utype1 = dynamic_cast<firTypeUInt*>(or_exp1_type);
        firTypeUInt* utype2 = dynamic_cast<firTypeUInt*>(or_exp2_type);
        if (utype1->valid_width() && utype2->valid_width()) {
          int width = std::max(utype1->width(), utype2->width());
          utype_data->set_width(width);
        } else if (utype1->valid_width() && !utype2->valid_width()) {
          int width = utype1->width();
          utype_data->set_width(width);
        } else if (!utype1->valid_width() && utype2->valid_width()) {
          int width = utype2->width();
          utype_data->set_width(width);
        }
      } else if (or_exp1_type->isSIntType()) {
        firTypeSInt* stype1 = dynamic_cast<firTypeSInt*>(or_exp1_type);
        firTypeSInt* stype2 = dynamic_cast<firTypeSInt*>(or_exp2_type);
        if (stype1->valid_width() && stype2->valid_width()) {
          int width = std::max(stype1->width(), stype2->width());
          utype_data->set_width(width);
        } else if (stype1->valid_width() && !stype2->valid_width()) {
          int width = stype1->width();
          utype_data->set_width(width);
        } else if (!stype1->valid_width() && stype2->valid_width()) {
          int width = stype2->width();
          utype_data->set_width(width);
        }
      } else {
        fs_error("*ERROR*: Failed to determine the type of the input in 'or' expression '%s'.\n", this->toString().c_str());
        this->set_type_data(NULL);
      }
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firOr::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* or_exp1_type = this->exp1()->getTypeData(module, domain);
      firType* or_exp2_type = this->exp2()->getTypeData(module, domain);
      updateTypeData(module, or_exp1_type, or_exp2_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firOr::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* or_exp1_type = this->exp1()->inferDataType(module, domain);
    firType* or_exp2_type = this->exp2()->inferDataType(module, domain);
    updateTypeData(module, or_exp1_type, or_exp2_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firOr::updateExpVal(firModule* module, firExp* or_exp1_value, firExp* or_exp2_value) {
    fs_assert(module);
    // get bigint1
    unsigned int width_left = UINT_MAX;
    BigInt* big_left = NULL;
    bool signed_left = false;
    if (or_exp1_value != NULL) {
      if (or_exp1_value->isUIntBitsExpression()) {
        firExpUIntBits* uint_bits1 = dynamic_cast<firExpUIntBits*>(or_exp1_value);
        width_left = uint_bits1->width();
        big_left = uint_bits1->big_value();
        signed_left = false;
      } else if (or_exp1_value->isSIntBitsExpression()) {
        firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(or_exp1_value);
        width_left = sint_bits1->width();
        big_left = sint_bits1->big_value();
        signed_left = true;
      } else {
        fs_error("*ERROR*: Illegal value '%s' of left expression in OR operation '%s'.\n", or_exp1_value->toString().c_str(), this->toString().c_str());
        this->set_exp_val(NULL);
        return;
      }
      if (big_left == NULL) {
        fs_error("*ERROR*: Failed to get the BigInt value of left expression value '%s' in OR operation '%s'.\n", or_exp1_value->toString().c_str(), this->toString().c_str());
        this->set_exp_val(NULL);
        return;
      }
    }
    // get bigint2
    unsigned int width_right = INT_MAX;
    BigInt* big_right = NULL;
    bool signed_right = false;
    if (or_exp2_value != NULL) {
      if (or_exp2_value->isUIntBitsExpression()) {
        firExpUIntBits* uint_bits2 = dynamic_cast<firExpUIntBits*>(or_exp2_value);
        width_right = uint_bits2->width();
        big_right = uint_bits2->big_value();
        signed_right = false;
      } else if (or_exp2_value->isSIntBitsExpression()) {
        firExpSIntBits* sint_bits2 = dynamic_cast<firExpSIntBits*>(or_exp2_value);
        width_right = sint_bits2->width();
        big_right = sint_bits2->big_value();
        signed_right = true;
      } else {
        fs_error("*ERROR*: Illegal value '%s' of right expression in OR operation '%s'.\n", or_exp2_value->toString().c_str(), this->toString().c_str());
        this->set_exp_val(NULL);
        return;
      }
      if (big_right == NULL) {
        fs_error("*ERROR*: Failed to get the BigInt value of right expression value '%s' in OR operation '%s'.\n", or_exp2_value->toString().c_str(), this->toString().c_str());
        this->set_exp_val(NULL);
        return;
      }
    }
    // calculate value result
    std::string or_result_value;
    int or_width;
    if (or_exp1_value == NULL && or_exp2_value == NULL) {
      this->set_exp_val(NULL);
      return;
    } else {
      if (or_exp1_value == NULL && or_exp2_value != NULL) {
        //or_result_value = "h1";
        firDB::firType* or_type = this->type_data();
        firDB::firTypeUInt* u_or_type = dynamic_cast<firDB::firTypeUInt*>(or_type);
        if (u_or_type == NULL) {
          fs_assert(0);
          this->set_exp_val(NULL);
          return;
        }
        fs_assert(u_or_type->valid_width());
        or_width = u_or_type->width();
        if (big_right->andr(or_width) == "h1") {
          or_result_value = "h1";
          firExp* or_result_exp = module->addExpUIntBits(or_result_value, or_width);
          this->set_exp_val(or_result_exp);
          return;
        } else {
          this->set_exp_val(NULL);
          return;
        }
      } else if (or_exp2_value == NULL && or_exp1_value != NULL) {
        //or_result_value = "h1";
        firDB::firType* or_type = this->type_data();
        firDB::firTypeUInt* u_or_type = dynamic_cast<firDB::firTypeUInt*>(or_type);
        if (u_or_type == NULL) {
          fs_assert(0);
          this->set_exp_val(NULL);
          return;
        }
        fs_assert(u_or_type->valid_width());
        or_width = u_or_type->width();
        if (big_left->andr(or_width) == "h1") {
          or_result_value = "h1";
          firExp* or_result_exp = module->addExpUIntBits(or_result_value, or_width);
          this->set_exp_val(or_result_exp);
          return;
        } else {
          this->set_exp_val(NULL);
          return;
        }
      } else if (or_exp1_value != NULL && or_exp2_value != NULL) {
        if (signed_left != signed_right) {
          fs_error("*ERROR*: The types of the two inputs in AND operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
          this->set_exp_val(NULL);
          return;
        }
        or_result_value = big_left->or_op(big_right);
        or_width = std::max(width_left, width_right);
        firExp* or_result_exp = module->addExpUIntBits(or_result_value, or_width);
        this->set_exp_val(or_result_exp);
        return;
      } else {
        this->set_exp_val(NULL);
        return;
      }
    }
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firOr::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* or_exp1 = this->exp1();
    if (or_exp1 == NULL) {
      fs_error("*ERROR*: The left expression in OR operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* or_exp2 = this->exp2();
    if (or_exp2 == NULL) {
      fs_error("*ERROR*: The right expression in OR operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* or_exp1_value = or_exp1->getExpVal(module, domain);
      firExp* or_exp2_value = or_exp2->getExpVal(module, domain);
      this->updateExpVal(module, or_exp1_value, or_exp2_value);
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firOr::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* or_exp1 = this->exp1();
    if (or_exp1 == NULL) {
      fs_error("*ERROR*: The left expression in OR operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* or_exp2 = this->exp2();
    if (or_exp2 == NULL) {
      fs_error("*ERROR*: The right expression in OR operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* or_exp1_value = or_exp1->inferExpVal(module, domain);
    firExp* or_exp2_value = or_exp2->inferExpVal(module, domain);
    this->updateExpVal(module, or_exp1_value, or_exp2_value);
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firXor::updateTypeData(firModule* module, firType* xor_exp1_type, firType* xor_exp2_type) {
    fs_assert(module != NULL);
    if (xor_exp1_type == NULL || xor_exp2_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (!xor_exp1_type->isEqual(xor_exp2_type)) {
      fs_error("*ERROR*: The types of the two inputs in 'xor' operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
      this->set_type_data(NULL);
    } else {
      if (dynamic_cast<firTypeUInt*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeUInt(-1));
      }
      firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
      utype_data->reset();
      if (xor_exp1_type->isUIntType()) {
        firTypeUInt* utype1 = dynamic_cast<firTypeUInt*>(xor_exp1_type);
        firTypeUInt* utype2 = dynamic_cast<firTypeUInt*>(xor_exp2_type);
        if (utype1->valid_width() && utype2->valid_width()) {
          int width = std::max(utype1->width(), utype2->width());
          utype_data->set_width(width);
        } else if (utype1->valid_width() && !utype2->valid_width()) {
          int width = utype1->width();
          utype_data->set_width(width);
        } else if (!utype1->valid_width() && utype2->valid_width()) {
          int width = utype2->width();
          utype_data->set_width(width);
        }
      } else if (xor_exp1_type->isSIntType()) {
        firTypeSInt* stype1 = dynamic_cast<firTypeSInt*>(xor_exp1_type);
        firTypeSInt* stype2 = dynamic_cast<firTypeSInt*>(xor_exp2_type);
        if (stype1->valid_width() && stype2->valid_width()) {
          int width = std::max(stype1->width(), stype2->width());
          utype_data->set_width(width);
        } else if (stype1->valid_width() && !stype2->valid_width()) {
          int width = stype1->width();
          utype_data->set_width(width);
        } else if (!stype1->valid_width() && stype2->valid_width()) {
          int width = stype2->width();
          utype_data->set_width(width);
        }
      } else {
        fs_error("*ERROR*: Failed to determine the type of the input in 'xor' expression '%s'.\n", this->toString().c_str());
        this->set_type_data(NULL);
      }
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firXor::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* xor_exp1_type = this->exp1()->getTypeData(module, domain);
      firType* xor_exp2_type = this->exp2()->getTypeData(module, domain);
      updateTypeData(module, xor_exp1_type, xor_exp2_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firXor::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* xor_exp1_type = this->exp1()->inferDataType(module, domain);
    firType* xor_exp2_type = this->exp2()->inferDataType(module, domain);
    updateTypeData(module, xor_exp1_type, xor_exp2_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firXor::updateExpVal(firModule* module, firExp* xor_exp1_value, firExp* xor_exp2_value) {
    fs_assert(module);
    if (xor_exp1_value == NULL && xor_exp2_value == NULL) {
      firDB::firExp* exp1 = this->exp1();
      firDB::firExp* exp2 = this->exp2();
      if (exp1->isSameExpression(exp2)) {
        std::string xor_result_value = "h0";
        firDB::firExp* xor_result_exp = NULL;
        firDB::firType* xor_type = this->type_data();
        firDB::firTypeUInt* u_xor_type = dynamic_cast<firDB::firTypeUInt*>(xor_type);
        fs_assert(u_xor_type != NULL);
        int xor_width = u_xor_type->width();
        xor_result_exp = module->addExpUIntBits(xor_result_value, xor_width);
        this->set_exp_val(xor_result_exp);
        return;
      } else {
        this->set_exp_val(NULL);
        return;
      }
    }
    // get bigint1
    if (xor_exp1_value == NULL) {
      //fs_error("*ERROR*: The left expression in XOR operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_left = UINT_MAX;
    BigInt* big_left = NULL;
    bool signed_left = false;
    if (xor_exp1_value->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits1 = dynamic_cast<firExpUIntBits*>(xor_exp1_value);
      width_left = uint_bits1->width();
      big_left = uint_bits1->big_value();
      signed_left = false;
    } else if (xor_exp1_value->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(xor_exp1_value);
      width_left = sint_bits1->width();
      big_left = sint_bits1->big_value();
      signed_left = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of left expression in XOR operation '%s'.\n", xor_exp1_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_left == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of left expression value '%s' in XOR operation '%s'.\n", xor_exp1_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // get bigint2
    if (xor_exp2_value == NULL) {
      //fs_error("*ERROR*: The right expression in XOR operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_right = INT_MAX;
    BigInt* big_right = NULL;
    bool signed_right = false;
    if (xor_exp2_value->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits2 = dynamic_cast<firExpUIntBits*>(xor_exp2_value);
      width_right = uint_bits2->width();
      big_right = uint_bits2->big_value();
      signed_right = false;
    } else if (xor_exp2_value->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits2 = dynamic_cast<firExpSIntBits*>(xor_exp2_value);
      width_right = sint_bits2->width();
      big_right = sint_bits2->big_value();
      signed_right = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of right expression in XOR operation '%s'.\n", xor_exp2_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_right == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of right expression value '%s' in XOR operation '%s'.\n", xor_exp2_value->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (signed_left != signed_right) {
      fs_error("*ERROR*: The types of the two inputs in XOR operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
      return;
    }
    // calculate value result
    std::string xor_result_value = big_left->xor_op(big_right);
    int xor_width = std::max(width_left, width_right);
    firExp* xor_result_exp = module->addExpUIntBits(xor_result_value, xor_width);
    this->set_exp_val(xor_result_exp);
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firXor::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* xor_exp1 = this->exp1();
    if (xor_exp1 == NULL) {
      fs_error("*ERROR*: The left expression in XOR operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* xor_exp2 = this->exp2();
    if (xor_exp2 == NULL) {
      fs_error("*ERROR*: The right expression in XOR operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* xor_exp1_value = xor_exp1->getExpVal(module, domain);
      firExp* xor_exp2_value = xor_exp2->getExpVal(module, domain);
      this->updateExpVal(module, xor_exp1_value, xor_exp2_value);
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firXor::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* xor_exp1 = this->exp1();
    if (xor_exp1 == NULL) {
      fs_error("*ERROR*: The left expression in XOR operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* xor_exp2 = this->exp2();
    if (xor_exp2 == NULL) {
      fs_error("*ERROR*: The right expression in XOR operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* xor_exp1_value = xor_exp1->inferExpVal(module, domain);
    firExp* xor_exp2_value = xor_exp2->inferExpVal(module, domain);
    this->updateExpVal(module, xor_exp1_value, xor_exp2_value);
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firAndr::updateTypeData(firModule* module, firType* andr_exp_type) {
    fs_assert(module != NULL);
    if (andr_exp_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (andr_exp_type->isUIntType()) {
      if (dynamic_cast<firTypeUInt*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeUInt(-1));
      }
      firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
      utype_data->set_width(1);
    } else {
      fs_error("*ERROR*: Failed to determine the type of the input in 'andr' operation '%s'.\n", this->toString().c_str());
      this->set_type_data(NULL);
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firAndr::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* andr_exp_type = this->exp()->getTypeData(module, domain);
      updateTypeData(module, andr_exp_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firAndr::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* andr_exp_type = this->exp()->inferDataType(module, domain);
    updateTypeData(module, andr_exp_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firAndr::updateExpVal(firModule* module, firExp* andr_exp_val) {
    fs_assert(module);
    if (andr_exp_val == NULL) {
      //fs_error("*ERROR*: The expression in ANDR operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_exp = UINT_MAX;
    BigInt* big_exp = NULL;
    if (andr_exp_val->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits1 = dynamic_cast<firExpUIntBits*>(andr_exp_val);
      width_exp = uint_bits1->width();
      big_exp = uint_bits1->big_value();
    } else if (andr_exp_val->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(andr_exp_val);
      width_exp = sint_bits1->width();
      big_exp = sint_bits1->big_value();
    } else {
      fs_error("*ERROR*: Illegal value '%s' of expression in ANDR operation '%s'.\n", andr_exp_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_exp == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of expression value '%s' in ANDR operation '%s'.\n", andr_exp_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // calculate value result
    std::string andr_result_value = big_exp->andr(width_exp);
    firExp* andr_result_exp = module->addExpUIntBits(andr_result_value, 1);
    this->set_exp_val(andr_result_exp);
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firAndr::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* andr_exp = this->exp();
    if (andr_exp == NULL) {
      fs_error("*ERROR*: The expression in ANDR operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* andr_exp_value = andr_exp->getExpVal(module, domain);
      this->updateExpVal(module, andr_exp_value);
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firAndr::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* andr_exp = this->exp();
    if (andr_exp == NULL) {
      fs_error("*ERROR*: The left expression in ANDR operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* andr_exp_value = andr_exp->inferExpVal(module, domain);
    this->updateExpVal(module, andr_exp_value);
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firOrr::updateTypeData(firModule* module, firType* orr_exp_type) {
    fs_assert(module != NULL);
    if (orr_exp_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (orr_exp_type->isUIntType()) {
      if (dynamic_cast<firTypeUInt*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeUInt(-1));
      }
      firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
      utype_data->set_width(1);
    } else {
      fs_error("*ERROR*: Failed to determine the type of the input in 'orr' operation '%s'.\n", this->toString().c_str());
      this->set_type_data(NULL);
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firOrr::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* orr_exp_type = this->exp()->getTypeData(module, domain);
      updateTypeData(module, orr_exp_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firOrr::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* orr_exp_type = this->exp()->inferDataType(module, domain);
    updateTypeData(module, orr_exp_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firOrr::updateExpVal(firModule* module, firExp* orr_exp_val) {
    fs_assert(module);
    if (orr_exp_val == NULL) {
      //fs_error("*ERROR*: The expression in ORR operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_exp = UINT_MAX;
    BigInt* big_exp = NULL;
    if (orr_exp_val->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits1 = dynamic_cast<firExpUIntBits*>(orr_exp_val);
      width_exp = uint_bits1->width();
      big_exp = uint_bits1->big_value();
    } else if (orr_exp_val->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(orr_exp_val);
      width_exp = sint_bits1->width();
      big_exp = sint_bits1->big_value();
    } else {
      fs_error("*ERROR*: Illegal value '%s' of expression in ORR operation '%s'.\n", orr_exp_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_exp == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of expression value '%s' in ORR operation '%s'.\n", orr_exp_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // calculate value result
    std::string orr_result_value = big_exp->orr(width_exp);
    firExp* orr_result_exp = module->addExpUIntBits(orr_result_value, 1);
    this->set_exp_val(orr_result_exp);
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firOrr::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* orr_exp = this->exp();
    if (orr_exp == NULL) {
      fs_error("*ERROR*: The expression in ORR operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* orr_exp_value = orr_exp->getExpVal(module, domain);
      this->updateExpVal(module, orr_exp_value);
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firOrr::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* orr_exp = this->exp();
    if (orr_exp == NULL) {
      fs_error("*ERROR*: The left expression in ORR operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* orr_exp_value = orr_exp->inferExpVal(module, domain);
    this->updateExpVal(module, orr_exp_value);
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firXorr::updateTypeData(firModule* module, firType* xorr_exp_type) {
    fs_assert(module != NULL);
    if (xorr_exp_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (xorr_exp_type->isUIntType()) {
      if (dynamic_cast<firTypeUInt*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeUInt(-1));
      }
      firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
      utype_data->set_width(1);
    } else {
      fs_error("*ERROR*: Failed to determine the type of the input in 'xorr' operation '%s'.\n", this->toString().c_str());
      this->set_type_data(NULL);
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firXorr::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* xorr_exp_type = this->exp()->getTypeData(module, domain);
      updateTypeData(module, xorr_exp_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firXorr::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* xorr_exp_type = this->exp()->inferDataType(module, domain);
    updateTypeData(module, xorr_exp_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firXorr::updateExpVal(firModule* module, firExp* xorr_exp_val) {
    fs_assert(module);
    if (xorr_exp_val == NULL) {
      //fs_error("*ERROR*: The expression in XORR operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_exp = UINT_MAX;
    BigInt* big_exp = NULL;
    if (xorr_exp_val->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits1 = dynamic_cast<firExpUIntBits*>(xorr_exp_val);
      width_exp = uint_bits1->width();
      big_exp = uint_bits1->big_value();
    } else if (xorr_exp_val->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(xorr_exp_val);
      width_exp = sint_bits1->width();
      big_exp = sint_bits1->big_value();
    } else {
      fs_error("*ERROR*: Illegal value '%s' of expression in XORR operation '%s'.\n", xorr_exp_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_exp == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of expression value '%s' in XORR operation '%s'.\n", xorr_exp_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // calculate value result
    std::string xorr_result_value = big_exp->xorr(width_exp);
    firExp* xorr_result_exp = module->addExpUIntBits(xorr_result_value, 1);
    this->set_exp_val(xorr_result_exp);
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firXorr::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* xorr_exp = this->exp();
    if (xorr_exp == NULL) {
      fs_error("*ERROR*: The expression in XORR operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* xorr_exp_value = xorr_exp->getExpVal(module, domain);
      this->updateExpVal(module, xorr_exp_value);
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firXorr::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* xorr_exp = this->exp();
    if (xorr_exp == NULL) {
      fs_error("*ERROR*: The left expression in XORR operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* xorr_exp_value = xorr_exp->inferExpVal(module, domain);
    this->updateExpVal(module, xorr_exp_value);
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firCat::updateTypeData(firModule* module, firType* cat_exp1_type, firType* cat_exp2_type) {
    fs_assert(module != NULL);
    if (cat_exp1_type == NULL || cat_exp2_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (!cat_exp1_type->isEqual(cat_exp2_type)) {
      fs_error("*ERROR*: The types of the two inputs in 'cat' operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
      this->set_type_data(NULL);
    } else {
      if (dynamic_cast<firTypeUInt*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeUInt(-1));
      }
      firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
      utype_data->reset();
      if (cat_exp1_type->isUIntType()) {
        firTypeUInt* utype1 = dynamic_cast<firTypeUInt*>(cat_exp1_type);
        firTypeUInt* utype2 = dynamic_cast<firTypeUInt*>(cat_exp2_type);
        if (utype1->valid_width() && utype2->valid_width()) {
          int width = utype1->width() + utype2->width();
          utype_data->set_width(width);
        } else if (utype1->valid_width() && !utype2->valid_width()) {
          int width = utype1->width();
          utype_data->set_width(width);
        } else if (!utype1->valid_width() && utype2->valid_width()) {
          int width = utype2->width();
          utype_data->set_width(width);
        }
      } else if (cat_exp1_type->isSIntType()) {
        firTypeSInt* stype1 = dynamic_cast<firTypeSInt*>(cat_exp1_type);
        firTypeSInt* stype2 = dynamic_cast<firTypeSInt*>(cat_exp2_type);
        if (stype1->valid_width() && stype2->valid_width()) {
          int width = stype1->width() + stype2->width();
          utype_data->set_width(width);
        } else if (stype1->valid_width() && !stype2->valid_width()) {
          int width = stype1->width();
          utype_data->set_width(width);
        } else if (!stype1->valid_width() && stype2->valid_width()) {
          int width = stype2->width();
          utype_data->set_width(width);
        }
      } else if (cat_exp1_type->isFixedType()) {
        firTypeFixed* ftype1 = dynamic_cast<firTypeFixed*>(cat_exp1_type);
        firTypeFixed* ftype2 = dynamic_cast<firTypeFixed*>(cat_exp2_type);
        int w1 = 0;
        int w2 = 0;
        if (ftype1->valid_width()) {
          w1 = ftype1->width();
        }
        if (ftype2->valid_width()) {
          w2 = ftype2->width();
        }
        int width = w1 + w2;
        if (width > 0) {
          utype_data->set_width(width);
        }
      } else if (cat_exp1_type->isIntervalType()) {
        firTypeInterval* itype1 = dynamic_cast<firTypeInterval*>(cat_exp1_type);
        firTypeInterval* itype2 = dynamic_cast<firTypeInterval*>(cat_exp2_type);
        int width1 = 0;
        int width2 = 0;
        itype1->getWidth(width1);
        itype2->getWidth(width2);
        int width = width1 + width2;
        if (width > 0) {
          utype_data->set_width(width);
        }
      } else {
        fs_error("*ERROR*: Failed to determine the type of the input in 'cat' expression '%s'.\n", this->toString().c_str());
        this->set_type_data(NULL);
      }
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firCat::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* cat_exp1_type = this->exp1()->getTypeData(module, domain);
      firType* cat_exp2_type = this->exp2()->getTypeData(module, domain);
      updateTypeData(module, cat_exp1_type, cat_exp2_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firCat::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* cat_exp1_type = this->exp1()->inferDataType(module, domain);
    firType* cat_exp2_type = this->exp2()->inferDataType(module, domain);
    updateTypeData(module, cat_exp1_type, cat_exp2_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firCat::updateExpVal(firModule* module, firExp* cat_exp1_val, firExp* cat_exp2_val) {
    fs_assert(module);
    // get bigint1
    if (cat_exp1_val == NULL) {
      //fs_error("*ERROR*: The left expression in CAT operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_left = UINT_MAX;
    BigInt* big_left = NULL;
    bool signed_left = false;
    if (cat_exp1_val->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits1 = dynamic_cast<firExpUIntBits*>(cat_exp1_val);
      width_left = uint_bits1->width();
      big_left = uint_bits1->big_value();
      signed_left = false;
    } else if (cat_exp1_val->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(cat_exp1_val);
      width_left = sint_bits1->width();
      big_left = sint_bits1->big_value();
      signed_left = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of left expression in CAT operation '%s'.\n", cat_exp1_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_left == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of left expression value '%s' in CAT operation '%s'.\n", cat_exp1_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // get bigint2
    if (cat_exp2_val == NULL) {
      //fs_error("*ERROR*: The right expression in CAT operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_right = INT_MAX;
    BigInt* big_right = NULL;
    bool signed_right = false;
    if (cat_exp2_val->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits2 = dynamic_cast<firExpUIntBits*>(cat_exp2_val);
      width_right = uint_bits2->width();
      big_right = uint_bits2->big_value();
      signed_right = false;
    } else if (cat_exp2_val->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits2 = dynamic_cast<firExpSIntBits*>(cat_exp2_val);
      width_right = sint_bits2->width();
      big_right = sint_bits2->big_value();
      signed_right = true;
    } else {
      fs_error("*ERROR*: Illegal value '%s' of right expression in CAT operation '%s'.\n", cat_exp2_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_right == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of right expression value '%s' in CAT operation '%s'.\n", cat_exp2_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (signed_left != signed_right) {
      fs_error("*ERROR*: The types of the two inputs in CAT operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
      return;
    }
    // calculate value result
    std::string cat_result_value = big_left->cat(big_right, width_left, width_right);
    int cat_result_width = width_left + width_right;
    firExp* cat_result_exp = module->addExpUIntBits(cat_result_value, cat_result_width);
    this->set_exp_val(cat_result_exp);
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firCat::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* cat_exp1 = this->exp1();
    if (cat_exp1 == NULL) {
      fs_error("*ERROR*: The left expression in CAT operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* cat_exp2 = this->exp2();
    if (cat_exp2 == NULL) {
      fs_error("*ERROR*: The right expression in CAT operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* cat_exp1_value = cat_exp1->getExpVal(module, domain);
      firExp* cat_exp2_value = cat_exp2->getExpVal(module, domain);
      this->updateExpVal(module, cat_exp1_value, cat_exp2_value);
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firCat::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* cat_exp1 = this->exp1();
    if (cat_exp1 == NULL) {
      fs_error("*ERROR*: The left expression in CAT operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* cat_exp2 = this->exp2();
    if (cat_exp2 == NULL) {
      fs_error("*ERROR*: The right expression in CAT operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* cat_exp1_value = cat_exp1->inferExpVal(module, domain);
    firExp* cat_exp2_value = cat_exp2->inferExpVal(module, domain);
    this->updateExpVal(module, cat_exp1_value, cat_exp2_value);
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firBits::updateTypeData(firModule* module, firType* bits_exp_type, unsigned int bits_hi, unsigned int bits_lo) {
    fs_assert(module != NULL);
    if (bits_exp_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (bits_hi < bits_lo) {
      fs_error("*ERROR*: The 'high' index (%u) was smaller than the 'low' index (%u) in 'bits' operation '%s'.\n", bits_hi, bits_lo, this->toString().c_str());
      this->set_type_data(NULL);
    } else {
      if (dynamic_cast<firTypeUInt*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeUInt(-1));
      }
      firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
      utype_data->reset();
      if (bits_exp_type->isUIntType() || bits_exp_type->isSIntType() || bits_exp_type->isFixedType() || bits_exp_type->isIntervalType()) {
        utype_data->set_width(bits_hi - bits_lo + 1);
      } else {
        fs_error("*ERROR*: Failed to determine the type of the input in 'bits' expression '%s'.\n", this->toString().c_str());
        this->set_type_data(NULL);
      }
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firBits::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* bits_exp_type = this->exp()->getTypeData(module, domain);
      updateTypeData(module, bits_exp_type, this->hi(), this->lo());
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firBits::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* bits_exp_type = this->exp()->inferDataType(module, domain);
    updateTypeData(module, bits_exp_type, this->hi(), this->lo());
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firBits::updateExpVal(firModule* module, firExp* bits_exp_val, unsigned int bits_hi, unsigned int bits_lo) {
    fs_assert(module);
    if (bits_exp_val == NULL) {
      //fs_error("*ERROR*: The expression in BITS operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_exp = UINT_MAX;
    BigInt* big_exp = NULL;
    if (bits_exp_val->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits1 = dynamic_cast<firExpUIntBits*>(bits_exp_val);
      width_exp = uint_bits1->width();
      big_exp = uint_bits1->big_value();
    } else if (bits_exp_val->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(bits_exp_val);
      width_exp = sint_bits1->width();
      big_exp = sint_bits1->big_value();
    } else {
      fs_error("*ERROR*: Illegal value '%s' of expression in BITS operation '%s'.\n", bits_exp_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_exp == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of expression value '%s' in BITS operation '%s'.\n", bits_exp_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // calculate value result
    std::string bits_result_value = big_exp->bits(width_exp, bits_hi, bits_lo);
    int bits_result_width = bits_hi - bits_lo + 1;
    firExp* bits_result_exp = module->addExpUIntBits(bits_result_value, bits_result_width);
    this->set_exp_val(bits_result_exp);
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firBits::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* bits_exp = this->exp();
    if (bits_exp == NULL) {
      fs_error("*ERROR*: The expression in BITS operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* bits_exp_value = bits_exp->getExpVal(module, domain);
      this->updateExpVal(module, bits_exp_value, this->hi(), this->lo());
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firBits::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* bits_exp = this->exp();
    if (bits_exp == NULL) {
      fs_error("*ERROR*: The expression in BITS operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* bits_exp_value = bits_exp->inferExpVal(module, domain);
    this->updateExpVal(module, bits_exp_value, this->hi(), this->lo());
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firHead::updateTypeData(firModule* module, firType* head_exp_type, unsigned int head_n) {
    fs_assert(module != NULL);
    if (head_exp_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (dynamic_cast<firTypeUInt*>(this->type_data()) == NULL) {
      this->set_type_data(module->addTypeUInt(-1));
    }
    firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
    utype_data->reset();
    if (head_exp_type->isUIntType() || head_exp_type->isSIntType() || head_exp_type->isFixedType() || head_exp_type->isIntervalType()) {
      utype_data->set_width(static_cast<int>(head_n));
    } else {
      fs_error("*ERROR*: Failed to determine the type of the input in 'head' expression '%s'.\n", this->toString().c_str());
      this->set_type_data(NULL);
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firHead::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* head_exp_type = this->exp()->getTypeData(module, domain);
      updateTypeData(module, head_exp_type, this->n());
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firHead::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* head_exp_type = this->exp()->inferDataType(module, domain);
    updateTypeData(module, head_exp_type, this->n());
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firHead::updateExpVal(firModule* module, firExp* head_exp_val, unsigned int head_n) {
    fs_assert(module);
    if (head_exp_val == NULL) {
      //fs_error("*ERROR*: The expression in HEAD operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_exp = UINT_MAX;
    BigInt* big_exp = NULL;
    if (head_exp_val->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits1 = dynamic_cast<firExpUIntBits*>(head_exp_val);
      width_exp = uint_bits1->width();
      big_exp = uint_bits1->big_value();
    } else if (head_exp_val->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(head_exp_val);
      width_exp = sint_bits1->width();
      big_exp = sint_bits1->big_value();
    } else {
      fs_error("*ERROR*: Illegal value '%s' of expression in HEAD operation '%s'.\n", head_exp_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_exp == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of expression value '%s' in HEAD operation '%s'.\n", head_exp_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // calculate value result
    std::string head_result_value = big_exp->head(width_exp, head_n);
    firExp* head_result_exp = module->addExpUIntBits(head_result_value, head_n);
    this->set_exp_val(head_result_exp);
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firHead::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* head_exp = this->exp();
    if (head_exp == NULL) {
      fs_error("*ERROR*: The expression in HEAD operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* head_exp_value = head_exp->getExpVal(module, domain);
      this->updateExpVal(module, head_exp_value, this->n());
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firHead::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* head_exp = this->exp();
    if (head_exp == NULL) {
      fs_error("*ERROR*: The expression in HEAD operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* head_exp_value = head_exp->inferExpVal(module, domain);
    this->updateExpVal(module, head_exp_value, this->n());
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  
  void firDB::firExpPrimOperation::firTail::updateTypeData(firModule* module, firType* tail_exp_type, unsigned int tail_n) {
    fs_assert(module != NULL);
    if (tail_exp_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (dynamic_cast<firTypeUInt*>(this->type_data()) == NULL) {
      this->set_type_data(module->addTypeUInt(-1));
    }
    firTypeUInt* utype_data = dynamic_cast<firTypeUInt*>(this->type_data());
    utype_data->reset();
    if (tail_exp_type->isUIntType()) {
      firTypeUInt* u_exp_type = dynamic_cast<firTypeUInt*>(tail_exp_type);
      if (u_exp_type->valid_width()) {
        int width = u_exp_type->width();
        if (width < (int)tail_n) {
          fs_error("*ERROR*: The parameter 'n' (%u) was larger than the width of the data (%u) in 'tail' operation '%s'.\n", tail_n, width, this->toString().c_str());
          this->set_type_data(NULL);
        } else {
          utype_data->set_width(width - tail_n);
        }
      }
    } else if (tail_exp_type->isSIntType()) {
      firTypeSInt* s_exp_type = dynamic_cast<firTypeSInt*>(tail_exp_type);
      if (s_exp_type->valid_width()) {
        int width = s_exp_type->width();
        if (width < (int)tail_n) {
          fs_error("*ERROR*: The parameter 'n' (%u) was larger than the width of the data (%u) in 'tail' operation '%s'.\n", tail_n, width, this->toString().c_str());
          this->set_type_data(NULL);
        } else {
          utype_data->set_width(width - tail_n);
        }
      }
    } else if (tail_exp_type->isFixedType()) {
      firTypeFixed* f_exp_type = dynamic_cast<firTypeFixed*>(tail_exp_type);
      if (f_exp_type->valid_width()) {
        int width = f_exp_type->width();
        if (width < (int)tail_n) {
          fs_error("*ERROR*: The parameter 'n' (%u) was larger than the width of the data (%u) in 'tail' operation '%s'.\n", tail_n, width, this->toString().c_str());
          this->set_type_data(NULL);
        } else {
          utype_data->set_width(width - tail_n);
        }
      }
    } else if (tail_exp_type->isIntervalType()) {
      firTypeInterval* i_exp_type = dynamic_cast<firTypeInterval*>(tail_exp_type);
      int width = 0;
      if (i_exp_type->getWidth(width)) {
        if (width < (int)tail_n) {
          fs_error("*ERROR*: The parameter 'n' (%u) was larger than the width of the data (%u) in 'tail' operation '%s'.\n", tail_n, width, this->toString().c_str());
          this->set_type_data(NULL);
        } else {
          utype_data->set_width(width - tail_n);
        }
      }
    } else {
      fs_error("*ERROR*: Failed to determine the type of the input in 'tail' expression '%s'.\n", this->toString().c_str());
      this->set_type_data(NULL);
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firTail::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* tail_exp_type = this->exp()->getTypeData(module, domain);
      updateTypeData(module, tail_exp_type, this->n());
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firTail::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* tail_exp_type = this->exp()->inferDataType(module, domain);
    updateTypeData(module, tail_exp_type, this->n());
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  void firDB::firExpPrimOperation::firTail::updateExpVal(firModule* module, firExp* tail_exp_val, unsigned int tail_n) {
    fs_assert(module);
    if (tail_exp_val == NULL) {
      //fs_error("*ERROR*: The expression in TAIL operation '%s' has empty value.\n", this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    unsigned int width_exp = UINT_MAX;
    BigInt* big_exp = NULL;
    if (tail_exp_val->isUIntBitsExpression()) {
      firExpUIntBits* uint_bits1 = dynamic_cast<firExpUIntBits*>(tail_exp_val);
      width_exp = uint_bits1->width();
      big_exp = uint_bits1->big_value();
    } else if (tail_exp_val->isSIntBitsExpression()) {
      firExpSIntBits* sint_bits1 = dynamic_cast<firExpSIntBits*>(tail_exp_val);
      width_exp = sint_bits1->width();
      big_exp = sint_bits1->big_value();
    } else {
      fs_error("*ERROR*: Illegal value '%s' of expression in TAIL operation '%s'.\n", tail_exp_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    if (big_exp == NULL) {
      fs_error("*ERROR*: Failed to get the BigInt value of expression value '%s' in TAIL operation '%s'.\n", tail_exp_val->toString().c_str(), this->toString().c_str());
      this->set_exp_val(NULL);
      return;
    }
    // calculate value result
    std::string tail_result_value = big_exp->tail(width_exp, tail_n);
    unsigned int tail_result_width = width_exp - tail_n;
    firExp* tail_result_exp = module->addExpUIntBits(tail_result_value, tail_result_width);
    this->set_exp_val(tail_result_exp);
    return;
  }
  firDB::firExp* firDB::firExpPrimOperation::firTail::getExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* tail_exp = this->exp();
    if (tail_exp == NULL) {
      fs_error("*ERROR*: The expression in TAIL operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    if (this->exp_val() == NULL) {
      firExp* tail_exp_value = tail_exp->getExpVal(module, domain);
      this->updateExpVal(module, tail_exp_value, this->n());
    }
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to get the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }
  firDB::firExp* firDB::firExpPrimOperation::firTail::inferExpVal(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firExp* tail_exp = this->exp();
    if (tail_exp == NULL) {
      fs_error("*ERROR*: The expression in TAIL operation '%s' is empty.\n", this->toString().c_str());
      return NULL;
    }
    firExp* tail_exp_value = tail_exp->inferExpVal(module, domain);
    this->updateExpVal(module, tail_exp_value, this->n());
    //if (this->exp_val() == NULL) {
    //  fs_error("*ERROR*: Failed to infer the value of expression '%s'.\n", this->toString().c_str());
    //}
    return this->exp_val();
  }

  void firDB::firExpPrimOperation::firIncp::updateTypeData(firModule* module, firType* incp_exp_type, unsigned int incp_n) {
    fs_assert(module != NULL);
    if (incp_exp_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (incp_exp_type->isFixedType()) {
      if (dynamic_cast<firTypeFixed*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeFixed());
      }
      firTypeFixed* ftype_data = dynamic_cast<firTypeFixed*>(this->type_data());
      firTypeFixed* f_exp_type = dynamic_cast<firTypeFixed*>(incp_exp_type);
      ftype_data->reset();
      if (f_exp_type->valid_binary()) {
        int bp = f_exp_type->binary_point() + static_cast<int>(incp_n);
        ftype_data->set_binary_point(bp);
      }
      if (f_exp_type->valid_width()) {
        int width = f_exp_type->width() + static_cast<int>(incp_n);
        ftype_data->set_width(width);
      }
    } else if (incp_exp_type->isIntervalType()) {
      if (dynamic_cast<firTypeInterval*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeInterval());
      }
      firTypeInterval* itype_data = dynamic_cast<firTypeInterval*>(this->type_data());
      firTypeInterval* i_exp_type = dynamic_cast<firTypeInterval*>(incp_exp_type);
      itype_data->reset();
      if (i_exp_type->trimInterval()) {
        double lower = i_exp_type->lower_value();
        double upper = i_exp_type->upper_value();
        int binary = i_exp_type->binary() + static_cast<int>(incp_n);
        itype_data->set_value('[', lower, upper, ']', binary);
      }
    } else {
      fs_error("*ERROR*: Failed to determine the type of the input in 'incp' expression '%s'.\n", this->toString().c_str());
      this->set_type_data(NULL);
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firIncp::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* incp_exp_type = this->exp()->getTypeData(module, domain);
      updateTypeData(module, incp_exp_type, this->n());
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firIncp::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* incp_exp_type = this->exp()->inferDataType(module, domain);
    updateTypeData(module, incp_exp_type, this->n());
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firExp* firDB::firExpPrimOperation::firIncp::getExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_warning("*WARNING*: The expression value inference for 'incp' operation has not been supported in this version.\n");
    fs_assert(module);
    return NULL;
  }
  firDB::firExp* firDB::firExpPrimOperation::firIncp::inferExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_warning("*WARNING*: The expression value inference for 'incp' operation has not been supported in this version.\n");
    fs_assert(module);
    return NULL;
  }

  void firDB::firExpPrimOperation::firDecp::updateTypeData(firModule* module, firType* decp_exp_type, unsigned int decp_n) {
    fs_assert(module != NULL);
    if (decp_exp_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (decp_exp_type->isFixedType()) {
      if (dynamic_cast<firTypeFixed*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeFixed());
      }
      firTypeFixed* ftype_data = dynamic_cast<firTypeFixed*>(this->type_data());
      firTypeFixed* f_exp_type = dynamic_cast<firTypeFixed*>(decp_exp_type);
      ftype_data->reset();
      if (f_exp_type->valid_binary()) {
        int bp = f_exp_type->binary_point() - static_cast<int>(decp_n);
        ftype_data->set_binary_point(bp);
      }
      if (f_exp_type->valid_width()) {
        int f_exp_type_width = f_exp_type->width();
        if (f_exp_type_width < (int)decp_n) {
          fs_error("*ERROR*: The parameter 'n' (%u) was larger than the width of the data (%u) in 'decp' operation '%s'.\n", decp_n, f_exp_type_width, this->toString().c_str());
          this->set_type_data(NULL);
        } else {
          int width = f_exp_type_width - static_cast<int>(decp_n);
          ftype_data->set_width(width);
        }
      }
    } else if (decp_exp_type->isIntervalType()) {
      if (dynamic_cast<firTypeInterval*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeInterval());
      }
      firTypeInterval* itype_data = dynamic_cast<firTypeInterval*>(this->type_data());
      firTypeInterval* i_exp_type = dynamic_cast<firTypeInterval*>(decp_exp_type);
      itype_data->reset();
      int width = 0;
      if (i_exp_type->getWidth(width)) {
        double shiftMul = static_cast<double>(1 / (1 << decp_n));
        double newBPRes = static_cast<double>((1 << decp_n) / (1 << i_exp_type->binary()));
        double bpResInv = static_cast<double>(1 << i_exp_type->binary());
        double newL = floor(i_exp_type->lower_value() * shiftMul * bpResInv) * newBPRes;
        double newU = floor(i_exp_type->upper_value() * shiftMul * bpResInv) * newBPRes;
        itype_data->set_value('[', newL, newU, ']', width - decp_n);
      }
    } else {
      fs_error("*ERROR*: Failed to determine the type of the input in 'decp' expression '%s'.\n", this->toString().c_str());
      this->set_type_data(NULL);
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firDecp::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* decp_exp_type = this->exp()->getTypeData(module, domain);
      updateTypeData(module, decp_exp_type, this->n());
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firDecp::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* decp_exp_type = this->exp()->inferDataType(module, domain);
    updateTypeData(module, decp_exp_type, this->n());
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firExp* firDB::firExpPrimOperation::firDecp::getExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_warning("*WARNING*: The expression value inference for 'decp' operation has not been supported in this version.\n");
    fs_assert(module);
    return NULL;
  }
  firDB::firExp* firDB::firExpPrimOperation::firDecp::inferExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_warning("*WARNING*: The expression value inference for 'decp' operation has not been supported in this version.\n");
    fs_assert(module);
    return NULL;
  }

  void firDB::firExpPrimOperation::firSetp::updateTypeData(firModule* module, firType* setp_exp_type, unsigned int setp_n) {
    fs_assert(module != NULL);
    if (setp_exp_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (setp_exp_type->isFixedType()) {
      if (dynamic_cast<firTypeFixed*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeFixed());
      }
      firTypeFixed* ftype_data = dynamic_cast<firTypeFixed*>(this->type_data());
      firTypeFixed* f_exp_type = dynamic_cast<firTypeFixed*>(setp_exp_type);
      ftype_data->reset();
      ftype_data->set_binary_point(setp_n);
      if (f_exp_type->valid_width() && f_exp_type->valid_binary()) {
        int width = setp_n + f_exp_type->width() - f_exp_type->binary_point();
        ftype_data->set_width(width);
      }
    } else if (setp_exp_type->isIntervalType()) {
      if (dynamic_cast<firTypeInterval*>(this->type_data()) == NULL) {
        this->set_type_data(module->addTypeInterval());
      }
      firTypeInterval* itype_data = dynamic_cast<firTypeInterval*>(this->type_data());
      firTypeInterval* i_exp_type = dynamic_cast<firTypeInterval*>(setp_exp_type);
      itype_data->reset();
      if (i_exp_type->trimInterval()) {
        double newBPResInv = static_cast<double>(1 << setp_n);
        double newBPRes = static_cast<double>(1 / (1 << setp_n));
        double newL = floor(i_exp_type->lower_value() * newBPResInv) * newBPRes;
        double newU = floor(i_exp_type->upper_value() * newBPResInv) * newBPRes;
        itype_data->set_value('[', newL, newU, ']', setp_n);
      }
    } else {
      fs_error("*ERROR*: Failed to determine the type of the input in 'setp' expression '%s'.\n", this->toString().c_str());
      this->set_type_data(NULL);
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firSetp::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* setp_exp_type = this->exp()->getTypeData(module, domain);
      updateTypeData(module, setp_exp_type, this->n());
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firSetp::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* setp_exp_type = this->exp()->inferDataType(module, domain);
    updateTypeData(module, setp_exp_type, this->n());
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firExp* firDB::firExpPrimOperation::firSetp::getExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_warning("*WARNING*: The expression value inference for 'setp' operation has not been supported in this version.\n");
    fs_assert(module);
    return NULL;
  }
  firDB::firExp* firDB::firExpPrimOperation::firSetp::inferExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_warning("*WARNING*: The expression value inference for 'setp' operation has not been supported in this version.\n");
    fs_assert(module);
    return NULL;
  }

  void firDB::firExpPrimOperation::firWrap::updateTypeData(firModule* module, firType* wrap_exp1_type, firType* wrap_exp2_type) {
    fs_assert(module != NULL);
    if (wrap_exp1_type == NULL || wrap_exp2_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (!wrap_exp1_type->isEqual(wrap_exp2_type)) {
      fs_error("*ERROR*: The types of the two inputs in 'wrap' operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
      this->set_type_data(NULL);
    } else {
      if (wrap_exp1_type->isIntervalType()) {
        if (dynamic_cast<firTypeInterval*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeInterval());
        }
        firTypeInterval* itype_data = dynamic_cast<firTypeInterval*>(this->type_data());
        firTypeInterval* i_exp_type1 = dynamic_cast<firTypeInterval*>(wrap_exp1_type);
        firTypeInterval* i_exp_type2 = dynamic_cast<firTypeInterval*>(wrap_exp2_type);
        itype_data->reset();
        bool valid_value1 = i_exp_type1->trimInterval();
        bool valid_value2 = i_exp_type2->trimInterval();
        if (valid_value1 && valid_value2) {
          double lower = i_exp_type2->lower_value();
          double upper = i_exp_type2->upper_value();
          int binary = i_exp_type1->binary();
          itype_data->set_value('[', lower, upper, ']', binary);
        }
      } else {
        fs_error("*ERROR*: Failed to determine the type of the input in 'wrap' expression '%s'.\n", this->toString().c_str());
        this->set_type_data(NULL);
      }
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firWrap::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* wrap_exp1_type = this->exp1()->getTypeData(module, domain);
      firType* wrap_exp2_type = this->exp2()->getTypeData(module, domain);
      updateTypeData(module, wrap_exp1_type, wrap_exp2_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firWrap::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* wrap_exp1_type = this->exp1()->inferDataType(module, domain);
    firType* wrap_exp2_type = this->exp2()->inferDataType(module, domain);
    updateTypeData(module, wrap_exp1_type, wrap_exp2_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firExp* firDB::firExpPrimOperation::firWrap::getExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_warning("*WARNING*: The expression value inference for 'wrap' operation has not been supported in this version.\n");
    fs_assert(module);
    return NULL;
  }
  firDB::firExp* firDB::firExpPrimOperation::firWrap::inferExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_warning("*WARNING*: The expression value inference for 'wrap' operation has not been supported in this version.\n");
    fs_assert(module);
    return NULL;
  }

  void firDB::firExpPrimOperation::firClip::updateTypeData(firModule* module, firType* clip_exp1_type, firType* clip_exp2_type) {
    fs_assert(module != NULL);
    if (clip_exp1_type == NULL || clip_exp2_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (!clip_exp1_type->isEqual(clip_exp2_type)) {
      fs_error("*ERROR*: The types of the two inputs in 'clip' operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
      this->set_type_data(NULL);
    } else {
      if (clip_exp1_type->isIntervalType()) {
        if (dynamic_cast<firTypeInterval*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeInterval());
        }
        firTypeInterval* itype_data = dynamic_cast<firTypeInterval*>(this->type_data());
        firTypeInterval* i_exp_type1 = dynamic_cast<firTypeInterval*>(clip_exp1_type);
        firTypeInterval* i_exp_type2 = dynamic_cast<firTypeInterval*>(clip_exp2_type);
        itype_data->reset();
        bool valid_value1 = i_exp_type1->trimInterval();
        bool valid_value2 = i_exp_type2->trimInterval();
        if (valid_value1 && valid_value2) {
          double low = std::max(i_exp_type1->lower_value(), i_exp_type2->lower_value());
          double high = std::min(i_exp_type1->upper_value(), i_exp_type2->upper_value());
          double lower = std::min(low, i_exp_type2->upper_value());
          double upper = std::max(i_exp_type2->lower_value(), high);
          int binary = i_exp_type1->binary();
          itype_data->set_value('[', lower, upper, ']', binary);
        }
      } else {
        fs_error("*ERROR*: Failed to determine the type of the input in 'clip' expression '%s'.\n", this->toString().c_str());
        this->set_type_data(NULL);
      }
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firClip::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* clip_exp1_type = this->exp1()->getTypeData(module, domain);
      firType* clip_exp2_type = this->exp2()->getTypeData(module, domain);
      updateTypeData(module, clip_exp1_type, clip_exp2_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firClip::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* clip_exp1_type = this->exp1()->inferDataType(module, domain);
    firType* clip_exp2_type = this->exp2()->inferDataType(module, domain);
    updateTypeData(module, clip_exp1_type, clip_exp2_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firExp* firDB::firExpPrimOperation::firClip::getExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_warning("*WARNING*: The expression value inference for 'clip' operation has not been supported in this version.\n");
    fs_assert(module);
    return NULL;
  }
  firDB::firExp* firDB::firExpPrimOperation::firClip::inferExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_warning("*WARNING*: The expression value inference for 'clip' operation has not been supported in this version.\n");
    fs_assert(module);
    return NULL;
  }

  void firDB::firExpPrimOperation::firSquz::updateTypeData(firModule* module, firType* squz_exp1_type, firType* squz_exp2_type) {
    fs_assert(module != NULL);
    if (squz_exp1_type == NULL || squz_exp2_type == NULL) {
      this->set_type_data(NULL);
      return;
    }
    if (!squz_exp1_type->isEqual(squz_exp2_type)) {
      fs_error("*ERROR*: The types of the two inputs in 'squz' operation '%s' were different. Correct the two inputs and rerun.\n", this->toString().c_str());
      this->set_type_data(NULL);
    } else {
      if (squz_exp1_type->isIntervalType()) {
        if (dynamic_cast<firTypeInterval*>(this->type_data()) == NULL) {
          this->set_type_data(module->addTypeInterval());
        }
        firTypeInterval* itype_data = dynamic_cast<firTypeInterval*>(this->type_data());
        firTypeInterval* i_exp_type1 = dynamic_cast<firTypeInterval*>(squz_exp1_type);
        firTypeInterval* i_exp_type2 = dynamic_cast<firTypeInterval*>(squz_exp2_type);
        itype_data->reset();
        bool valid_value1 = i_exp_type1->trimInterval();
        bool valid_value2 = i_exp_type2->trimInterval();
        if (valid_value1 && valid_value2) {
          double low = std::max(i_exp_type1->lower_value(), i_exp_type2->lower_value());
          double high = std::min(i_exp_type1->upper_value(), i_exp_type2->upper_value());
          double lower = std::min(low, i_exp_type2->upper_value());
          double upper = std::max(i_exp_type2->lower_value(), high);
          int binary = i_exp_type1->binary();
          itype_data->set_value('[', lower, upper, ']', binary);
        }
      } else {
        fs_error("*ERROR*: Failed to determine the type of the input in 'squz' expression '%s'.\n", this->toString().c_str());
        this->set_type_data(NULL);
      }
    }
  }
  firDB::firType* firDB::firExpPrimOperation::firSquz::getTypeData(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    if (this->type_data() == NULL) {
      firType* squz_exp1_type = this->exp1()->getTypeData(module, domain);
      firType* squz_exp2_type = this->exp2()->getTypeData(module, domain);
      updateTypeData(module, squz_exp1_type, squz_exp2_type);
    }
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to get the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firType* firDB::firExpPrimOperation::firSquz::inferDataType(firModule* module, firItemConditional* domain) {
    fs_assert(module != NULL);
    firType* squz_exp1_type = this->exp1()->inferDataType(module, domain);
    firType* squz_exp2_type = this->exp2()->inferDataType(module, domain);
    updateTypeData(module, squz_exp1_type, squz_exp2_type);
    if (this->type_data() == NULL) {
      fs_error("*ERROR*: Failed to infer the type of expression '%s'.\n", this->toString().c_str());
      fs_assert(0);
    }
    return this->type_data();
  }
  firDB::firExp* firDB::firExpPrimOperation::firSquz::getExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_warning("*WARNING*: The expression value inference for 'squz' operation has not been supported in this version.\n");
    fs_assert(module);
    return NULL;
  }
  firDB::firExp* firDB::firExpPrimOperation::firSquz::inferExpVal(firModule* module, firItemConditional* /*domain*/) {
    fs_warning("*WARNING*: The expression value inference for 'squz' operation has not been supported in this version.\n");
    fs_assert(module);
    return NULL;
  }

}
