//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#include "elaborate/mport_infer.h"

namespace firrtlsyn {
  MportInfer::MportInfer() {
    infer_mport_dir_.clear();
  }
  MportInfer::~MportInfer() {
    infer_mport_dir_.clear();
  }

  bool MportInfer::inferMportDir(firDB::firCircuit* circuit) {
    firDB::firModule* top_module = circuit->top_module();
    if (!moduleTraverse(top_module)) {
      fs_error("*ERROR*: Width infer failed!\n");
      return false;
    }
    return true;
  }
  bool MportInfer::moduleTraverse(firDB::firModule* module) {
    fs_assert(module != NULL);
    std::vector<firDB::firItem*>& statements = module->statements();
    for (size_t stmt = 0; stmt < statements.size(); stmt++) {
      if (!statementTraverse(module, statements[stmt])) {
        fs_assert(0);
        return false;
      }
    }
    return true;
  }
  bool MportInfer::statementTraverse(firDB::firModule* module, firDB::firItem* stmt, firDB::firItemConditional* domain) {
    fs_assert(stmt != NULL);
    switch (stmt->type()) {
    case firDB::ItemType::kItemMPort: {
      firDB::firItemMPort* item_mport = dynamic_cast<firDB::firItemMPort*>(stmt);
      firDB::MPortDir mport_dir = item_mport->dir();
      if (mport_dir == firDB::MPortDir::kMPortDirInfer) infer_mport_dir_.insert(item_mport);
      break;
    }
    case firDB::ItemType::kItemInstance: {
      firDB::firItemInstance* inst_item = dynamic_cast<firDB::firItemInstance*>(stmt);
      firDB::firCircuit* circuit = module->circuit();
      std::string inst_id = inst_item->inst_id();
      std::string inst_module_id = inst_item->module_id();
      firDB::firModule* inst_module = circuit->findModuleById(inst_module_id);
      if (inst_module == NULL) {
        fs_error("*ERROR*: Could not find the module named '%s' corresponding to instance '%s' in the circuit.\n", inst_module_id.c_str(), inst_id.c_str());
        return false;
      }
      if (!moduleTraverse(inst_module)) {
        return false;
      }
      break;
    }
    case firDB::ItemType::kItemNode: {
      firDB::firItemNode* node_item = dynamic_cast<firDB::firItemNode*>(stmt);
      firDB::firExp* node_exp = node_item->exp();
      this->extractReadMportByExp(module, node_exp, infer_mport_dir_, domain);
      break;
    }
    case firDB::ItemType::kItemConnect: {
      firDB::firItemConnect* connect = dynamic_cast<firDB::firItemConnect*>(stmt);
      firDB::firExp* left = connect->connect_l();
      firDB::firExp* right = connect->connect_r();
      this->extractWriteMportByExp(module, left, infer_mport_dir_, domain);
      this->extractReadMportByExp(module, right, infer_mport_dir_, domain);
      break;
    }
    case firDB::ItemType::kItemPartialConnect: {
      firDB::firItemPartialConnect* partial_connect = dynamic_cast<firDB::firItemPartialConnect*>(stmt);
      firDB::firExp* left = partial_connect->connect_l();
      firDB::firExp* right = partial_connect->connect_r();
      this->extractWriteMportByExp(module, left, infer_mport_dir_, domain);
      this->extractReadMportByExp(module, right, infer_mport_dir_, domain);
      break;
    }
    case firDB::ItemType::kItemConditional: {
      firDB::firItemConditional* when_stmt = dynamic_cast<firDB::firItemConditional*>(stmt);
      std::vector<firDB::firItem*>& stmts_under_when = when_stmt->when_statements();
      firDB::firExp* when_exp = when_stmt->when_exp();
      if (when_exp != NULL) {
        this->extractReadMportByExp(module, when_exp, infer_mport_dir_, domain);
      }
      for (size_t k = 0; k < stmts_under_when.size(); k++) {
        firDB::firItem* tmp_stmt = stmts_under_when[k];
        fs_assert(tmp_stmt != NULL);
        if (!statementTraverse(module, tmp_stmt, when_stmt)) {
          return false;
        }
      }
      firDB::firItemConditional* else_stmt = when_stmt->else_cond();
      if (else_stmt != NULL) {
        if (!statementTraverse(module, else_stmt, else_stmt)) {
          return false;
        }
      }
      break;
    }
    case firDB::ItemType::kItemPrintf: {
      firDB::firItemPrintf* printf = dynamic_cast<firDB::firItemPrintf*>(stmt);
      firDB::firExp* con = printf->con_signal();
      this->extractReadMportByExp(module, con, infer_mport_dir_, domain);
      std::vector<firDB::firExp*>& vec_exps = printf->messages();
      for (size_t i = 0; i < vec_exps.size(); i++) {
        this->extractReadMportByExp(module, vec_exps[i], infer_mport_dir_, domain);
      }
      break;
    }
    default:
      break;
    }
    return true;
  }
  void MportInfer::setMportDirection(firDB::firItemMPort* mport, firDB::MPortDir direction, std::set<firDB::firItemMPort*>& infer_mport) {
    fs_assert(mport != NULL);
    if (infer_mport.empty()) return;
    auto iter = infer_mport.find(mport);
    if (iter != infer_mport.end()) {
      firDB::MPortDir mport_dir = mport->dir();
      if (mport_dir == firDB::MPortDir::kMPortDirInfer) {
        mport->set_dir(direction);
      } else if (mport_dir != direction) {
        mport->set_dir(firDB::MPortDir::kMPortDirRdwr);
      }
    }
  }
  void MportInfer::extractReadMportByExp(firDB::firModule* module, firDB::firExp* exp, std::set<firDB::firItemMPort*>& infer_mport, firDB::firItemConditional* domain) {
    fs_assert(module != NULL);
    fs_assert(exp != NULL);
    if (exp->isNumberExpression()) {
      return;
    } else if (exp->isIdExpression()) {
      firDB::firItem* exp_item = module->findItemByExpression(exp, domain);
      fs_assert(exp_item != NULL);
      if (exp_item->isMPortItem()) {
        firDB::firItemMPort* mport_item = dynamic_cast<firDB::firItemMPort*>(exp_item);
        auto iter = infer_mport.find(mport_item);
        if (iter != infer_mport.end()) {
          setMportDirection(mport_item, firDB::MPortDir::kMPortDirRead, infer_mport);
        }
      }
    } else if (exp->isMuxExpression()) {
      firDB::firExpMux* mux = dynamic_cast<firDB::firExpMux*>(exp);
      firDB::firExp* input1 = mux->input1();
      firDB::firExp* input2 = mux->input2();
      extractReadMportByExp(module, input1, infer_mport, domain);
      extractReadMportByExp(module, input2, infer_mport, domain);
    } else if (exp->isValidifExpression()) {
      firDB::firExpValidif* validif = dynamic_cast<firDB::firExpValidif*>(exp);
      firDB::firExp* validif_exp = validif->exp();
      extractReadMportByExp(module, validif_exp, infer_mport, domain);
    } else if (exp->isPrimOperationExpression()) {
      extractReadMportByPrimOp(module, dynamic_cast<firDB::firExpPrimOperation*>(exp), infer_mport, domain);
    }
  }
  void MportInfer::extractReadMportByPrimOp(firDB::firModule* module, firDB::firExpPrimOperation* prim_op, std::set<firDB::firItemMPort*>& infer_mport, firDB::firItemConditional* domain) {
    fs_assert(module != NULL);
    fs_assert(prim_op != NULL);
    firDB::firExpPrimOperation::PrimOperationType prim_type = prim_op->operator_type();
    switch (prim_type) {
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeAdd: {
      firDB::firExpPrimOperation::firAdd* prim_add = dynamic_cast<firDB::firExpPrimOperation::firAdd*>(prim_op);
      extractReadMportByExp(module, prim_add->exp1(), infer_mport, domain);
      extractReadMportByExp(module, prim_add->exp2(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeSub: {
      firDB::firExpPrimOperation::firSub* prim_sub = dynamic_cast<firDB::firExpPrimOperation::firSub*>(prim_op);
      extractReadMportByExp(module, prim_sub->exp1(), infer_mport, domain);
      extractReadMportByExp(module, prim_sub->exp2(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeMul: {
      firDB::firExpPrimOperation::firMul* prim_mul = dynamic_cast<firDB::firExpPrimOperation::firMul*>(prim_op);
      extractReadMportByExp(module, prim_mul->exp1(), infer_mport, domain);
      extractReadMportByExp(module, prim_mul->exp2(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeDiv: {
      firDB::firExpPrimOperation::firDiv* prim_div = dynamic_cast<firDB::firExpPrimOperation::firDiv*>(prim_op);
      extractReadMportByExp(module, prim_div->num(), infer_mport, domain);
      extractReadMportByExp(module, prim_div->den(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeMod: {
      firDB::firExpPrimOperation::firMod* prim_mod = dynamic_cast<firDB::firExpPrimOperation::firMod*>(prim_op);
      extractReadMportByExp(module, prim_mod->num(), infer_mport, domain);
      extractReadMportByExp(module, prim_mod->den(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeLt: {
      firDB::firExpPrimOperation::firLt* prim_lt = dynamic_cast<firDB::firExpPrimOperation::firLt*>(prim_op);
      extractReadMportByExp(module, prim_lt->exp1(), infer_mport, domain);
      extractReadMportByExp(module, prim_lt->exp2(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeLeq: {
      firDB::firExpPrimOperation::firLeq* prim_leq = dynamic_cast<firDB::firExpPrimOperation::firLeq*>(prim_op);
      extractReadMportByExp(module, prim_leq->exp1(), infer_mport, domain);
      extractReadMportByExp(module, prim_leq->exp2(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeGt: {
      firDB::firExpPrimOperation::firGt* prim_gt = dynamic_cast<firDB::firExpPrimOperation::firGt*>(prim_op);
      extractReadMportByExp(module, prim_gt->exp1(), infer_mport, domain);
      extractReadMportByExp(module, prim_gt->exp2(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeGeq: {
      firDB::firExpPrimOperation::firGeq* prim_geq = dynamic_cast<firDB::firExpPrimOperation::firGeq*>(prim_op);
      extractReadMportByExp(module, prim_geq->exp1(), infer_mport, domain);
      extractReadMportByExp(module, prim_geq->exp2(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeEq: {
      firDB::firExpPrimOperation::firEq* prim_eq = dynamic_cast<firDB::firExpPrimOperation::firEq*>(prim_op);
      extractReadMportByExp(module, prim_eq->exp1(), infer_mport, domain);
      extractReadMportByExp(module, prim_eq->exp2(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeNeq: {
      firDB::firExpPrimOperation::firNeq* prim_neq = dynamic_cast<firDB::firExpPrimOperation::firNeq*>(prim_op);
      extractReadMportByExp(module, prim_neq->exp1(), infer_mport, domain);
      extractReadMportByExp(module, prim_neq->exp2(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypePad: {
      firDB::firExpPrimOperation::firPad* prim_pad = dynamic_cast<firDB::firExpPrimOperation::firPad*>(prim_op);
      extractReadMportByExp(module, prim_pad->exp(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeAsUInt: {
      firDB::firExpPrimOperation::firAsUInt* prim_asuint = dynamic_cast<firDB::firExpPrimOperation::firAsUInt*>(prim_op);
      extractReadMportByExp(module, prim_asuint->exp(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeAsSInt: {
      firDB::firExpPrimOperation::firAsSInt* prim_assint = dynamic_cast<firDB::firExpPrimOperation::firAsSInt*>(prim_op);
      extractReadMportByExp(module, prim_assint->exp(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeAsClock: {
      firDB::firExpPrimOperation::firAsClock* prim_asclock = dynamic_cast<firDB::firExpPrimOperation::firAsClock*>(prim_op);
      extractReadMportByExp(module, prim_asclock->exp(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeAsFixed: {
      firDB::firExpPrimOperation::firAsFixed* prim_asfixed = dynamic_cast<firDB::firExpPrimOperation::firAsFixed*>(prim_op);
      extractReadMportByExp(module, prim_asfixed->exp(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeAsAsyncReset: {
      firDB::firExpPrimOperation::firAsAsyncReset* prim_asasyncreset = dynamic_cast<firDB::firExpPrimOperation::firAsAsyncReset*>(prim_op);
      extractReadMportByExp(module, prim_asasyncreset->exp(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeAsInterval: {
      firDB::firExpPrimOperation::firAsInterval* prim_asinterval = dynamic_cast<firDB::firExpPrimOperation::firAsInterval*>(prim_op);
      extractReadMportByExp(module, prim_asinterval->exp(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeShl: {
      firDB::firExpPrimOperation::firShl* prim_shl = dynamic_cast<firDB::firExpPrimOperation::firShl*>(prim_op);
      extractReadMportByExp(module, prim_shl->exp(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeShr: {
      firDB::firExpPrimOperation::firShr* prim_shr = dynamic_cast<firDB::firExpPrimOperation::firShr*>(prim_op);
      extractReadMportByExp(module, prim_shr->exp(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeDshl: {
      firDB::firExpPrimOperation::firDshl* prim_dshl = dynamic_cast<firDB::firExpPrimOperation::firDshl*>(prim_op);
      extractReadMportByExp(module, prim_dshl->exp1(), infer_mport, domain);
      extractReadMportByExp(module, prim_dshl->exp2(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeDshr: {
      firDB::firExpPrimOperation::firDshr* prim_dshr = dynamic_cast<firDB::firExpPrimOperation::firDshr*>(prim_op);
      extractReadMportByExp(module, prim_dshr->exp1(), infer_mport, domain);
      extractReadMportByExp(module, prim_dshr->exp2(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeCvt: {
      firDB::firExpPrimOperation::firCvt* prim_cvt = dynamic_cast<firDB::firExpPrimOperation::firCvt*>(prim_op);
      extractReadMportByExp(module, prim_cvt->exp(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeNeg: {
      firDB::firExpPrimOperation::firNeg* prim_neg = dynamic_cast<firDB::firExpPrimOperation::firNeg*>(prim_op);
      extractReadMportByExp(module, prim_neg->exp(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeNot: {
      firDB::firExpPrimOperation::firNot* prim_not = dynamic_cast<firDB::firExpPrimOperation::firNot*>(prim_op);
      extractReadMportByExp(module, prim_not->exp(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeAnd: {
      firDB::firExpPrimOperation::firAnd* prim_and = dynamic_cast<firDB::firExpPrimOperation::firAnd*>(prim_op);
      extractReadMportByExp(module, prim_and->exp1(), infer_mport, domain);
      extractReadMportByExp(module, prim_and->exp2(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeOr: {
      firDB::firExpPrimOperation::firOr* prim_or = dynamic_cast<firDB::firExpPrimOperation::firOr*>(prim_op);
      extractReadMportByExp(module, prim_or->exp1(), infer_mport, domain);
      extractReadMportByExp(module, prim_or->exp2(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeXor: {
      firDB::firExpPrimOperation::firXor* prim_xor = dynamic_cast<firDB::firExpPrimOperation::firXor*>(prim_op);
      extractReadMportByExp(module, prim_xor->exp1(), infer_mport, domain);
      extractReadMportByExp(module, prim_xor->exp2(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeAndr: {
      firDB::firExpPrimOperation::firAndr* prim_andr = dynamic_cast<firDB::firExpPrimOperation::firAndr*>(prim_op);
      extractReadMportByExp(module, prim_andr->exp(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeOrr: {
      firDB::firExpPrimOperation::firOrr* prim_orr = dynamic_cast<firDB::firExpPrimOperation::firOrr*>(prim_op);
      extractReadMportByExp(module, prim_orr->exp(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeXorr: {
      firDB::firExpPrimOperation::firXorr* prim_xorr = dynamic_cast<firDB::firExpPrimOperation::firXorr*>(prim_op);
      extractReadMportByExp(module, prim_xorr->exp(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeCat: {
      firDB::firExpPrimOperation::firCat* prim_cat = dynamic_cast<firDB::firExpPrimOperation::firCat*>(prim_op);
      extractReadMportByExp(module, prim_cat->exp1(), infer_mport, domain);
      extractReadMportByExp(module, prim_cat->exp2(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeBits: {
      firDB::firExpPrimOperation::firBits* prim_bits = dynamic_cast<firDB::firExpPrimOperation::firBits*>(prim_op);
      extractReadMportByExp(module, prim_bits->exp(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeHead: {
      firDB::firExpPrimOperation::firHead* prim_head = dynamic_cast<firDB::firExpPrimOperation::firHead*>(prim_op);
      extractReadMportByExp(module, prim_head->exp(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeTail: {
      firDB::firExpPrimOperation::firTail* prim_tail = dynamic_cast<firDB::firExpPrimOperation::firTail*>(prim_op);
      extractReadMportByExp(module, prim_tail->exp(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeIncp: {
      firDB::firExpPrimOperation::firIncp* prim_incp = dynamic_cast<firDB::firExpPrimOperation::firIncp*>(prim_op);
      extractReadMportByExp(module, prim_incp->exp(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeDecp: {
      firDB::firExpPrimOperation::firDecp* prim_decp = dynamic_cast<firDB::firExpPrimOperation::firDecp*>(prim_op);
      extractReadMportByExp(module, prim_decp->exp(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeSetp: {
      firDB::firExpPrimOperation::firSetp* prim_setp = dynamic_cast<firDB::firExpPrimOperation::firSetp*>(prim_op);
      extractReadMportByExp(module, prim_setp->exp(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeWrap: {
      firDB::firExpPrimOperation::firWrap* prim_wrap = dynamic_cast<firDB::firExpPrimOperation::firWrap*>(prim_op);
      extractReadMportByExp(module, prim_wrap->exp1(), infer_mport, domain);
      extractReadMportByExp(module, prim_wrap->exp2(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeClip: {
      firDB::firExpPrimOperation::firClip* prim_clip = dynamic_cast<firDB::firExpPrimOperation::firClip*>(prim_op);
      extractReadMportByExp(module, prim_clip->exp1(), infer_mport, domain);
      extractReadMportByExp(module, prim_clip->exp2(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeSquz: {
      firDB::firExpPrimOperation::firSquz* prim_squz = dynamic_cast<firDB::firExpPrimOperation::firSquz*>(prim_op);
      extractReadMportByExp(module, prim_squz->exp1(), infer_mport, domain);
      extractReadMportByExp(module, prim_squz->exp2(), infer_mport, domain);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeUndef: {
      fs_assert(0);
      break;
    }
    default:
      break;
    }
  }
  void MportInfer::extractWriteMportByExp(firDB::firModule* module, firDB::firExp* exp, std::set<firDB::firItemMPort*>& infer_mport, firDB::firItemConditional* domain) {
    fs_assert(module != NULL);
    fs_assert(exp != NULL);
    fs_assert(exp->isIdExpression());
    firDB::firItem* exp_item = module->findItemByExpression(exp, domain);
    fs_assert(exp_item != NULL);
    if (exp_item->isMPortItem()) {
      firDB::firItemMPort* mport_item = dynamic_cast<firDB::firItemMPort*>(exp_item);
      auto iter = infer_mport.find(mport_item);
      if (iter != infer_mport.end()) {
        setMportDirection(mport_item, firDB::MPortDir::kMPortDirWrite, infer_mport);
      }
    }
  }
}