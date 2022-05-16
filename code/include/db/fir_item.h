//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#ifndef DB_FIRITEM_H
#define DB_FIRITEM_H

#include "db/fir_db.h"
#include "db/fir_type.h"
#include "db/fir_expression.h"

namespace firrtlsyn {

  class firDB::firItem : public firDB::firLocObj {
  public:
    firItem() {}
    virtual ~firItem() {}

  public:
    virtual std::string toString(std::string indent = "") = 0;
    ItemType type() const { return type_; }
    std::string info() const { return info_.content(); }
    void set_info(const std::string& info) { info_.set_content(info); }
    bool isPortItem() {
      return type() == ItemType::kItemPort;
    }
    bool isWireItem() {
      return type() == ItemType::kItemWire;
    }
    bool isRegisterItem() {
      return type() == ItemType::kItemRegister;
    }
    bool isMemoryItem() {
      return type() == ItemType::kItemMemory;
    }
    bool isCMemoryItem() {
      return type() == ItemType::kItemCMemory;
    }
    bool isSMemoryItem() {
      return type() == ItemType::kItemSMemory;
    }
    bool isMPortItem() {
      return type() == ItemType::kItemMPort;
    }
    bool isInstanceItem() {
      return type() == ItemType::kItemInstance;
    }
    bool isNodeItem() {
      return type() == ItemType::kItemNode;
    }
    bool isConnectItem() {
      return type() == ItemType::kItemConnect;
    }
    bool isPartialConnectItem() {
      return type() == ItemType::kItemPartialConnect;
    }
    bool isInvalidateItem() {
      return type() == ItemType::kItemInvalidate;
    }
    bool isAttachItem() {
      return type() == ItemType::kItemAttach;
    }
    bool isConditionalItem() {
      return type() == ItemType::kItemConditional;
    }
    bool isStopItem() {
      return type() == ItemType::kItemStop;
    }
    bool isPrintfItem() {
      return type() == ItemType::kItemPrintf;
    }
    bool isEmptyItem() {
      return type() == ItemType::kItemEmpty;
    }
    bool isGroupItem() {
      return type() == ItemType::kItemGroup;
    }
  protected:
    ItemType type_;
    firInfo info_;
  };
  class firDB::firItemPort : public firDB::firItem {
  public:
    firItemPort(const std::string& id, PortDir dir, firType* type_data) {
      type_ = ItemType::kItemPort;
      type_data_ = type_data;
      dir_ = dir;
      passive_ = false;
      id_ = id;
      info_ = firInfo();
    }
    ~firItemPort() {
      type_flip_passive_dir_.clear();
    }

  public:
    // convert port data to string format
    std::string toString(std::string indent = "") {
      std::string s_dir = (dir_ == firDB::kPortDirInput) ? "input" : "output";
      std::string s_type;
      if (type_data_ != NULL) {
        s_type = type_data_->toString();
      } else {
        fs_assert(0);
        s_type = "";
      }
      std::string str = indent + s_dir + " " + id_ + " : " + s_type + " " + info();
      return str;
    }
    Type data_type() const { return type_data_->type(); }
    std::string id() { return id_; }
    PortDir dir() const { return dir_; }
    firType* type_data() { return type_data_; }
    bool passive() { return passive_; }
    void set_passive(bool passive) { passive_ = passive; }
    bool evaluatePassive(firType* type_data, PortDir type_data_dir, bool type_flip);
    bool isGroundPort() const { return type_data_->isGroundType(); }
    bool isVectorPort() const { return type_data_->isVectorType(); }
    bool isBundlePort() const { return type_data_->isBundleType(); }
    bool isInput() const { return dir_ == PortDir::kPortDirInput; }
    bool isOutput() const { return dir_ == PortDir::kPortDirOutput; }
    bool isInout() const { return dir_ == PortDir::kPortDirInout; }
    PortDir getPortDirection(firType* type_data) {
      auto iter = type_flip_passive_dir_.find(type_data);
      if (iter != type_flip_passive_dir_.end()) {
        return std::get<2>(iter->second);
      } else {
        std::string type;
        if (type_data == NULL) {
          type = "NULL";
        } else {
          type = type_data->toString();
        }
        fs_error("*ERROR*: failed to find port with \"Type: %s\" in this module!\n", type.c_str());
        fs_assert(0);
        return PortDir::kPortDirUndef;
      }
    }
    bool getPassiveByType(firType* type_data) {
      auto iter = type_flip_passive_dir_.find(type_data);
      if (iter != type_flip_passive_dir_.end()) {
        return std::get<1>(iter->second);
      } else {
        std::string type;
        if (type_data == NULL) {
          type = "NULL";
        } else {
          type = type_data->toString();
        }
        fs_error("*ERROR*: failed to find port with \"Type: %s\" in this module!\n", type.c_str());
        fs_assert(0);
        return false;
      }
    }
    bool getFlipByType(firType* type_data) {
      auto iter = type_flip_passive_dir_.find(type_data);
      if (iter != type_flip_passive_dir_.end()) {
        return std::get<0>(iter->second);
      } else {
        std::string type;
        if (type_data == NULL) {
          type = "NULL";
        } else {
          type = type_data->toString();
        }
        fs_error("*ERROR*: failed to find port with \"Type: %s\" in this module!\n", type.c_str());
        fs_assert(0);
        return false;
      }
    }
  private:
    PortDir flipDirection(PortDir dir, bool& flip);

  private:
    PortDir dir_;
    bool passive_;
    std::string id_;
    firType* type_data_;
    std::map<firType*, std::tuple<bool, bool, PortDir>> type_flip_passive_dir_;
  };
  class firDB::firItemWire : public firDB::firItem {
  public:
    firItemWire(const std::string& id, firType* type_data) {
      id_ = id;
      type_data_ = type_data;
      type_ = ItemType::kItemWire;
      info_ = firInfo();
    }
    ~firItemWire() {}

  public:
    // convert wire statement to string format
    std::string toString(std::string indent = "") {
      std::string s_type;
      if (type_data_ != NULL) {
        s_type = type_data_->toString();
      } else {
        fs_assert(0);
        s_type = "";
      }
      std::string str = indent + "wire " + id_ + " : " + s_type + " " + info();
      return str;
    }
    Type wire_type() const { return type_data_->type(); }
    std::string id() { return id_; }
    firType* type_data() { return type_data_; }
    bool isGroundWire() const { return type_data_->isGroundType(); }
    bool isVectorWire() const { return type_data_->isVectorType(); }
    bool isBundleWire() const { return type_data_->isBundleType(); }
  private:
    firType* type_data_;
    std::string id_;
  };
  class firDB::firItemRegister : public firDB::firItem {
  public:
    firItemRegister(const std::string& id, firType* type_data, firExp* clock_signal, firExp* reg_reset, firExp* reg_init) {
      id_ = id;
      type_data_ = type_data;
      clock_signal_ = clock_signal;
      type_ = ItemType::kItemRegister;
      info_ = firInfo();
      reg_reset_ = reg_reset;
      reg_init_ = reg_init;
    }
    ~firItemRegister() {}

  public:
    // convert register statement to string format
    std::string toString(std::string indent = "") {
      std::string s_type;
      if (type_data_ != NULL) {
        s_type = type_data_->toString();
      } else {
        fs_assert(0);
        s_type = "";
      }
      std::string s_exp;
      if (clock_signal_ != NULL) {
        s_exp = clock_signal_->toString();
      } else {
        fs_assert(0);
        s_exp = "";
      }
      std::string s_rst;
      if (reg_reset_ && reg_init_) {
        std::string s_reset = reg_reset_->toString();
        std::string s_rst_val = reg_init_->toString();
        s_reset = "reset => (" + s_reset + ", " + s_rst_val + ")";
        s_rst = "with : (" + s_reset + ")";
      }
      std::string str = indent + "reg " + id_ + " : " + s_type + ", " + s_exp + " " + s_rst + " " + info();
      return str;
    }
    firType* type_data() { return type_data_; }
    Type register_type() const { return type_data_->type(); }
    std::string id() { return id_; }
    firExp* clock_signal() { return clock_signal_; }
    firExp* reg_reset() { return reg_reset_; }
    firExp* reg_init() { return reg_init_; }
    void set_reset_block(firExp* reg_reset, firExp* reg_init) {
      reg_reset_ = reg_reset;
      reg_init_ = reg_init;
    }
    bool isGroundRegister() const { return type_data_->isGroundType(); }
    bool isVectorRegister() const { return type_data_->isVectorType(); }
    bool isBundleRegister() const { return type_data_->isBundleType(); }
    static std::string getPortDId() { return register_ports.at(0); }
    static std::string getPortQId() { return register_ports.at(1); }
  private:
    static const std::vector<std::string> register_ports;
    firType* type_data_;
    std::string id_;
    firExp* clock_signal_;
    firExp* reg_reset_;
    firExp* reg_init_;
  };
  class firDB::firItemMemory : public firDB::firItem {
  public:
    firItemMemory(const std::string& id) {
      id_ = id;
      type_data_ = NULL;
      depth_ = 0;
      read_latency_ = 0;
      write_latency_ = 0;
      read_under_write_ = RUW::kRuwUndef;
      type_ = ItemType::kItemMemory;
      info_ = firInfo();
    }
    firItemMemory(const std::string& id, firType* type_data, unsigned int depth, unsigned int read_latency, unsigned int write_latency, RUW read_under_write) {
      id_ = id;
      type_data_ = type_data;
      depth_ = depth;
      read_latency_ = read_latency;
      write_latency_ = write_latency;
      read_under_write_ = read_under_write;
      type_ = ItemType::kItemMemory;
      info_ = firInfo();
    }
    ~firItemMemory() {}

  public:
    // convert memory statement to string format
    std::string toString(std::string indent = "") {
      std::string s_mem;
      std::string s_type;
      if (type_data_ != NULL) {
        s_type = type_data_->toString();
      } else {
        fs_assert(0);
        s_type = "";
      }
      s_mem = indent + "  " + "data-type => " + s_type + "\n";
      s_mem += indent + "  " + "depth => " + std::to_string(depth_) + "\n";
      s_mem += indent + "  " + "read-latency => " + std::to_string(read_latency_) + "\n";
      s_mem += indent + "  " + "write-latency => " + std::to_string(write_latency_) + "\n";
      std::string s_reader, s_writer, s_readwriter;
      for (size_t i = 0; i < ports_.size(); i++) {
        MPortDir o_dir = ports_[i].second;
        if (o_dir == MPortDir::kMPortDirRdwr) {
          s_readwriter += indent + "  " + "readwriter => " + ports_[i].first + "\n";
        } else if (o_dir == MPortDir::kMPortDirRead) {
          s_reader += indent + "  " + "reader => " + ports_[i].first + "\n";
        } else if (o_dir == MPortDir::kMPortDirWrite) {
          s_writer += indent + "  " + "writer => " + ports_[i].first + "\n";
        }
      }
      if (!s_reader.empty()) {
        s_mem += s_reader;
      }
      if (!s_writer.empty()) {
        s_mem += s_writer;
      }
      if (!s_readwriter.empty()) {
        s_mem += s_readwriter;
      }
      std::string s_ruw;
      if (read_under_write_ == RUW::kRuwNew) {
        s_ruw = "new";
      } else if (read_under_write_ == RUW::kRuwOld) {
        s_ruw = "old";
      } else {
        s_ruw = "undefined";
      }
      s_mem += indent + "  " + "read-under-write => " + s_ruw + "\n";
      std::string str = indent + "mem " + id_ + " : " + info() + "\n" + s_mem;
      return str;
    }
    firType* type_data() { return type_data_; }
    void set_type_data(firType* type_data) { type_data_ = type_data; }
    Type memory_type() const { return type_data_->type(); }
    std::string id() { return id_; }
    unsigned int depth() { return depth_; }
    void set_depth(int depth) { depth_ = depth; }
    unsigned int read_latency() { return read_latency_; }
    void set_read_latency(unsigned int read_latency) { read_latency_ = read_latency; }
    unsigned int write_latency() { return write_latency_; }
    void set_write_latency(unsigned int write_latency) { write_latency_ = write_latency; }
    RUW read_under_write() { return read_under_write_; }
    void set_read_under_write(RUW read_under_write) { read_under_write_ = read_under_write; }

    void addReadPorts(const std::string& read_port_id) {
      id_port_map_.insert(std::make_pair(read_port_id, ports_.size()));
      ports_.push_back(std::make_pair(read_port_id, MPortDir::kMPortDirRead)); 
    }
    void addWritePorts(const std::string& write_port_id) {
      id_port_map_.insert(std::make_pair(write_port_id, ports_.size()));
      ports_.push_back(std::make_pair(write_port_id, MPortDir::kMPortDirWrite));
    }
    void addReadWritePorts(const std::string& read_write_port_id) {
      id_port_map_.insert(std::make_pair(read_write_port_id, ports_.size()));
      ports_.push_back(std::make_pair(read_write_port_id, MPortDir::kMPortDirRdwr)); 
    }
    std::vector<std::pair<std::string, MPortDir>>& ports() { return ports_; }
    bool hasPort(const std::string& port_id) {
      return id_port_map_.find(port_id) != id_port_map_.end();
    }
    MPortDir findPortDirById(const std::string& port_id) {
      auto iter = id_port_map_.find(port_id);
      if (iter != id_port_map_.end()) {
        return ports_[iter->second].second;
      } else {
        return MPortDir::kMPortDirUndef;
      }
    }
    bool isGroundMemory() const { return type_data_->isGroundType(); }
    bool isVectorMemory() const { return type_data_->isVectorType(); }
    bool isBundleMemory() const { return type_data_->isBundleType(); }
    static std::string getMemPortId(MPortDir mport_dir, MemPortType port_type);
    static MemPortType getMemPortTypeById(MPortDir mport_dir, const std::string& port_id);

  private:
    static const std::map<MPortDir, std::vector<std::string>> mem_ports;

  private:
    firType* type_data_;
    std::string id_;
    //positive
    unsigned int depth_;
    //non-negative
    unsigned int read_latency_;
    //positive
    unsigned int write_latency_;
    RUW read_under_write_;
    std::vector<std::pair<std::string, MPortDir>> ports_;
    std::map<std::string, size_t> id_port_map_;
  };
  class firDB::firItemInstance : public firDB::firItem {
  public:
    firItemInstance(const std::string& inst_id, const std::string& module_id) {
      type_ = ItemType::kItemInstance;
      inst_id_ = inst_id;
      module_id_ = module_id;
      info_ = firInfo();
    }
    ~firItemInstance() {}

  public:
    // convert instance statement to string format
    std::string toString(std::string indent = "") {
      std::string str = indent + "inst " + inst_id_ + " of " + module_id_ + " " + info();
      return str;
    }
    std::string inst_id() { return inst_id_; }
    std::string module_id() { return module_id_; }
    firItemPort* getPortByExpression(firCircuit* circuit, firExp* exp);

  private:
    std::string inst_id_;
    std::string module_id_;
  };
  class firDB::firItemNode : public firDB::firItem {
  public:
    firItemNode(const std::string& id, firExp* exp) {
      type_ = ItemType::kItemNode;
      id_ = id;
      exp_ = exp;
      info_ = firInfo();
    }
    ~firItemNode() {}

  public:
    // convert node statement to string format
    std::string toString(std::string indent = "") {
      std::string s_exp;
      if (exp_ != NULL) {
        s_exp = exp_->toString();
      } else {
        fs_assert(0);
        s_exp = "";
      }
      std::string str = indent + "node " + id_ + " = " + s_exp + " " + info();
      return str;
    }
    std::string id() { return id_; }
    firExp* exp() { return exp_; }

  private:
    std::string id_;
    firExp* exp_;
  };
  class firDB::firItemConnect : public firDB::firItem {
  public:
    firItemConnect(firExp* connect_l, firExp* connect_r) {
      type_ = ItemType::kItemConnect;
      connect_l_ = connect_l;
      connect_r_ = connect_r;
      info_ = firInfo();
    }
    ~firItemConnect() {}

  public:
    // convert connect statement to string format
    std::string toString(std::string indent = "") {
      std::string s_l;
      if (connect_l_ != NULL) {
        s_l = connect_l_->toString();
      } else {
        fs_assert(0);
        s_l = "";
      }
      std::string s_r;
      if (connect_r_ != NULL) {
        s_r = connect_r_->toString();
      } else {
        fs_assert(0);
        s_r = "";
      }
      std::string str = indent + s_l + " <= " + s_r + " " + info();
      return str;
    }
    firExp* connect_l() { return connect_l_; }
    firExp* connect_r() { return connect_r_; }

  private:
    firExp* connect_l_;
    firExp* connect_r_;
  };
  class firDB::firItemAttach : public firDB::firItem {
  public:
    firItemAttach() {
      type_ = ItemType::kItemAttach;
      info_ = firInfo();
    }
    ~firItemAttach() {}

  public:
    // convert attach statement to string format
    std::string toString(std::string indent = "") {
      std::string s_attach;
      for (size_t i = 0; i < nets_.size(); i++) {
        firExp *op_exp = nets_[i];
        std::string s_exp;
        if (op_exp != NULL) {
          s_exp = op_exp->toString();
        } else {
          fs_assert(0);
          s_exp = "";
        }
        s_attach = s_attach + s_exp + ", ";
      }
      if (!s_attach.empty() && s_attach.length() > 2) {
        s_attach = s_attach.substr(0, s_attach.length() - 2);
      }
      std::string str = indent + "attach(" + s_attach + ") " + info();
      return str;
    }
    std::vector<firExp*>& nets() { return nets_; }
    void addNet(firExp* net) { nets_.push_back(net); }

  private:
    std::vector<firExp*> nets_;
  };
  class firDB::firItemCMemory : public firDB::firItem {
  public:
    firItemCMemory(const std::string& id, firType* type_data) {
      type_ = ItemType::kItemCMemory;
      id_ = id;
      type_data_ = type_data;
      info_ = firInfo();
    }
    ~firItemCMemory() {}

  public:
    // convert cmem statement to string format
    std::string toString(std::string indent = "") {
      std::string s_type;
      if (type_data_ != NULL) {
        s_type = type_data_->toString();
      } else {
        fs_assert(0);
        s_type = "";
      }
      std::string str = indent + "cmem " + id_ + " : " + s_type + " " + info();
      return str;
    }
    firType* type_data() { return type_data_; }
    Type cmem_type() const { return type_data_->type(); }
    std::string id() { return id_; }
     
  private:
    firType* type_data_;
    std::string id_;
  };
  class firDB::firItemSMemory : public firDB::firItem {
  public:
    firItemSMemory(const std::string& id, firType* type_data, RUW read_under_write) {
      type_ = ItemType::kItemSMemory;
      id_ = id;
      type_data_ = type_data;
      read_under_write_ = read_under_write;
      info_ = firInfo();
    }
    ~firItemSMemory() {}

  public:
    // convert smem statement to string format
    std::string toString(std::string indent = "") {
      std::string s_type;
      if (type_data_ != NULL) {
        s_type = type_data_->toString();
      } else {
        fs_assert(0);
        s_type = "";
      }
      std::string s_ruw;
      if (read_under_write_ == RUW::kRuwNew) {
        s_ruw = "new";
      } else if (read_under_write_ == RUW::kRuwOld) {
        s_ruw = "old";
      }
      std::string str = indent + "smem " + id_ + " : " + s_type + " ";
      if (!s_ruw.empty()) {
        str += s_ruw + " ";
      }
      str += info();
      return str;
    }
    firType* type_data() { return type_data_; }
    Type smem_type() const { return type_data_->type(); }
    std::string id() { return id_; }
    RUW read_under_write() { return read_under_write_; }

  private:
    firType* type_data_;
    std::string id_;
    RUW read_under_write_;
  };
  class firDB::firItemMPort : public firDB::firItem {
  public:
    firItemMPort(MPortDir dir, const std::string& mport_id, const std::string& mem_id, firExp* addr_exp, firExp* clk_exp) {
      type_ = ItemType::kItemMPort;
      dir_ = dir;
      mport_id_ = mport_id;
      mem_id_ = mem_id;
      addr_exp_ = addr_exp;
      clk_exp_ = clk_exp;
      info_ = firInfo();
    }
    ~firItemMPort() {}

  public:
    // convert mport statement to string format
    std::string toString(std::string indent = "") {
      std::string s_dir;
      if (dir_ == MPortDir::kMPortDirInfer) {
        s_dir = "infer";
      } else if (dir_ == MPortDir::kMPortDirRdwr) {
        s_dir = "rdwr";
      } else if (dir_ == MPortDir::kMPortDirRead) {
        s_dir = "read";
      } else if (dir_ == MPortDir::kMPortDirWrite) {
        s_dir = "write";
      }
      std::string s_exp;
      if (addr_exp_ != NULL) {
        s_exp = addr_exp_->toString();
      } else {
        fs_assert(0);
        s_exp = "";
      }
      std::string s_clk_exp;
      if (clk_exp_ != NULL) {
        s_clk_exp = clk_exp_->toString();
      } else {
        fs_assert(0);
        s_clk_exp = "";
      }
      std::string str = indent + s_dir + " mport " + mport_id_ + " = " + mem_id_ + "[" + s_exp + "], " + s_clk_exp + " " + info();
      return str;
    }
    MPortDir dir() const { return dir_; }
    void set_dir(MPortDir dir) { dir_ = dir; }
    std::string mport_id() { return mport_id_; }
    std::string mem_id() { return mem_id_; }
    firExp* addr_exp() { return addr_exp_; }
    firExp* clk_exp() { return clk_exp_; }

  private:
    MPortDir dir_;
    std::string mport_id_;
    std::string mem_id_;
    firExp* addr_exp_;
    firExp* clk_exp_;
  };
  class firDB::firItemPartialConnect : public firDB::firItem {
  public:
    firItemPartialConnect(firExp* connect_l, firExp* connect_r) {
      type_ = ItemType::kItemPartialConnect;
      connect_l_ = connect_l;
      connect_r_ = connect_r;
      info_ = firInfo();
    }
    ~firItemPartialConnect() {}

  public:
    // convert partial connect to string format
    std::string toString(std::string indent = "") {
      std::string s_l;
      if (connect_l_ != NULL) {
        s_l = connect_l_->toString();
      } else {
        fs_assert(0);
        s_l = "";
      }
      std::string s_r;
      if (connect_r_ != NULL) {
        s_r = connect_r_->toString();
      } else {
        fs_assert(0);
        s_r = "";
      }
      std::string str = indent + s_l + " <- " + s_r + " " + info();
      return str;
    }
    firExp* connect_l() { return connect_l_; }
    firExp* connect_r() { return connect_r_; }

  private:
    firExp* connect_l_;
    firExp* connect_r_;
  };
  class firDB::firItemInvalidate : public firDB::firItem {
  public:
    firItemInvalidate(firExp* exp) {
      type_ = ItemType::kItemInvalidate;
      exp_ = exp;
      info_ = firInfo();
    }
    ~firItemInvalidate() {}

  public:
    // convert is invalid statement to string format
    std::string toString(std::string indent = "") {
      std::string s_exp;
      if (exp_ != NULL) {
        s_exp = exp_->toString();
      } else {
        fs_assert(0);
        s_exp = "";
      }
      std::string str = indent + s_exp + " is invalid " + info();
      return str;
    }
    firExp* exp() { return exp_; }

  private:
    firExp* exp_;
  };
  class firDB::firItemConditional : public firDB::firItem {
  public:
    firItemConditional() {
      type_ = ItemType::kItemConditional;
      when_exp_ = NULL;
      parent_ = NULL;
      else_cond_ = NULL;
      info_ = firInfo();
    }
    ~firItemConditional() {
      when_statements_.clear();
      id_items_map_.clear();
      when_exp_ = NULL;
      parent_ = NULL;
      else_cond_ = NULL;
    }

  public:
    // convert when statement to string format
    std::string toString(std::string indent = "") {
      std::string s_cond;
      if (when_exp_ != NULL) {
        s_cond = when_exp_->toString();
      } else {
        fs_assert(0);
        s_cond = "";
      }
      std::string s_items;
      for (size_t i = 0; i < when_statements_.size(); i++) {
        firItem *op_item = when_statements_[i];
        std::string s_item;
        if (op_item != NULL) {
          s_item = op_item->toString(indent + "  ");
        } else {
          fs_assert(0);
          s_item = indent + "";
        }
        s_items += s_item + "\n";
      }
      std::string str = indent + "when " + s_cond + " : " + info() + "\n" + s_items;
      if (else_cond_) {
        std::string s_else;
        for (size_t i = 0; i < else_cond_->when_statements().size(); i++) {
          firItem *op_item = else_cond_->when_statements().at(i);
          std::string s_item;
          if (op_item != NULL) {
            s_item = op_item->toString(indent + "  ");
          } else {
            fs_assert(0);
            s_item = indent + "";
          }
          s_else += s_item + "\n";
        }
        str += indent + "else : " + else_cond_->info() + "\n" + s_else;
      }
      str = str.substr(0, str.length() - 1);
      return str;
    }
    firExp* when_exp() { return when_exp_; }
    firItemConditional* else_cond() { return else_cond_; }
    std::vector<firItem*>& when_statements() { return when_statements_; }
    std::map<std::string, firItem*>& id_items_map() { return id_items_map_; }
    firItemConditional* parent() { return parent_; }
    void set_when_exp(firExp* when_exp) {
      fs_assert(when_exp_ == NULL);
      when_exp_ = when_exp;
    }
    void set_parent(firItemConditional* parent) {
      fs_assert(parent_ == NULL);
      parent_ = parent;
      if (else_cond_ != NULL) {
        if (else_cond_->parent() == NULL) {
          else_cond_->set_parent(parent);
        } else {
          fs_assert(else_cond_->parent() == parent);
        }
      }
    }
    void set_else_cond(firItemConditional* else_cond) {
      fs_assert(else_cond_ == NULL);
      fs_assert(else_cond->parent() == NULL);
      else_cond->set_parent(parent());
      else_cond_ = else_cond;
    }

    firItem* findItemById(const std::string& id);
    void addStatement(firItem* statement);
    // FIXME:mport will be defined in conditional statement because the mask/enable signal will transfer
    // Chisel to a conditional statement in firrtl, but this is uncorrect! mport.mask/en should be
    // used to connect an expression as mport's mask/en signal
    firItem* findMPortInStmts(const std::string& item_id);

  private:
    firExp* when_exp_;
    firItemConditional* parent_;
    firItemConditional* else_cond_;
    std::vector<firItem*> when_statements_;
    std::map<std::string, firItem*> id_items_map_;
  };
  class firDB::firItemStop : public firDB::firItem {
  public:
    firItemStop(firExp* exp1, firExp* exp2, int exit_code) {
      type_ = ItemType::kItemStop;
      exp1_ = exp1;
      exp2_ = exp2;
      exit_code_ = exit_code;
      id_ = "";
      info_ = firInfo();
    }
    ~firItemStop() {}

  public:
    // convert stop statement to string format
    std::string toString(std::string indent = "") {
      std::string str = indent + "stop(";
      if (exp1_ != NULL) {
        str += exp1_->toString();
      }
      str += ", ";
      if (exp2_ != NULL) {
        str += exp2_->toString();
      }
      str += ", "+std::to_string(exit_code_)+") ";
      if (id_ != "") {
        str += ": " + id_;
      }
      str += " " + info();
      return str;
    }
    firExp* exp1() { return exp1_; }
    firExp* exp2() { return exp2_; }
    unsigned int exit_code() { return exit_code_; }
    void set_id(const std::string& id) { id_ = id; }

  private:
    firExp* exp1_;
    firExp* exp2_;
    unsigned int exit_code_;
    std::string id_;
  };
  class firDB::firItemEmpty : public firDB::firItem {
  public:
    firItemEmpty() {
      type_ = ItemType::kItemEmpty;
      info_ = firInfo();
    }
    ~firItemEmpty() {}

  public:
    // convert skip statement to string format
    std::string toString(std::string indent = "") {
      std::string str = indent + "skip " + info();
      return str;
    }
  };
  class firDB::firItemPrintf : public firDB::firItem {
  public:
    firItemPrintf(firExp* clk_signal, firExp* con_signal, const std::string& p_string) {
      clk_signal_ = clk_signal;
      con_signal_ = con_signal;
      p_string_ = p_string;
      type_ = ItemType::kItemPrintf;
      id_ = "";
      info_ = firInfo();
    }
    ~firItemPrintf() {}

  public:
    // convert printf statement to string format
    std::string toString(std::string indent = "") {
      std::string str = indent + "printf(";
      if (clk_signal_ != NULL) {
        str += clk_signal_->toString();
      }
      str += ", ";
      if (con_signal_ != NULL) {
        str += con_signal_->toString();
      }
      str += ", " + p_string_;
      for (size_t i = 0; i < messages_.size(); i++) {
        if (messages_[i] != NULL) {
          str += ", " + messages_[i]->toString();
        } else {
          str += ", ";
        }
      }
      str += ") ";
      if (id_ != "") {
        str += ": " + id_;
      }
      str += " " + info();
      return str;
    }
    firExp* clk_signal() { return clk_signal_; }
    firExp* con_signal() { return con_signal_; }
    std::string p_string() { return p_string_; }
    std::vector<firExp*>& messages() { return messages_; }
    void addPrint(firExp* message) { messages_.push_back(message); }
    void set_id(const std::string& id) { id_ = id; }

  private:
    firExp* clk_signal_;
    firExp* con_signal_;
    std::string p_string_;
    std::vector<firExp*> messages_;
    std::string id_;
  };
}

#endif
