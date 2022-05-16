//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#ifndef DB_FIRDB_H
#define DB_FIRDB_H

#include <string>
#include <vector>
#include <map>
#include <stack>
#include <unordered_map>
#include <tuple>
#include "utility/assert.h"

#define LINE_BITS 31
#define COL_BITS 21
#define FILE_ID_BITS 20

#define LINE_NUM_LIMIT ((unsigned int)~(~0 << LINE_BITS))
#define COL_NUM_LIMIT ((unsigned int)~(~0 << COL_BITS))
#define FILE_NUM_LIMIT ((unsigned int)~(~0 << FILE_ID_BITS))

namespace firrtlsyn {

  typedef unsigned long long IntegerType;

  class firDB {
  public:
    class firInfo;
    class firDocData;
    class firLocObj;
    class firLibrary;
    class firCircuit;
    class firModule;

    class firDefName;
    class firParameter;
    class firField;

    class firType;
    class firTypeUInt;
    class firTypeSInt;
    class firTypeFixed;
    class firTypeInterval;
    class firTypeClock;
    class firTypeAsyncReset;
    class firTypeReset;
    class firTypeAnalog;
    class firTypeVector;
    class firTypeBundle;

    class firItem;
    class firItemPort;
    class firItemWire;
    class firItemRegister;
    class firItemMemory;
    class firItemCMemory;
    class firItemSMemory;
    class firItemMPort; 
    class firItemInstance;
    class firItemNode;
    class firItemConnect;
    class firItemPartialConnect;
    class firItemInvalidate;
    class firItemAttach;
    class firItemConditional;
    class firItemStop;
    class firItemEmpty;
    class firItemPrintf;

    class firExp;
    class firExpUInt;
    class firExpUIntBits;
    class firExpSInt;
    class firExpSIntBits;
    class firExpRef;
    class firExpSubfield;
    class firExpDouble;  //todo 
    class firExpSubindex;
    class firExpSubaccess;
    class firExpMux;
    class firExpValidif;
    class firExpPrimOperation;

    public:
    enum Type {
      kTypeUInt,
      kTypeSInt,
      kTypeFixed,
      kTypeInterval,
      kTypeClock,
      kTypeAsyncReset,
      kTypeReset,
      kTypeAnalog,
      kTypeVector,
      kTypeBundle,
      kTypeUndef
    };
    enum ModuleType {
      kModule,
      kExtModule,
      kModuleUndef
    };
    enum ItemType {
      kItemPort,
      kItemWire,
      kItemRegister,
      kItemMemory,
      kItemCMemory,
      kItemSMemory,
      kItemMPort,
      kItemInstance,
      kItemNode,
      kItemConnect,
      kItemPartialConnect,
      kItemInvalidate,
      kItemAttach,
      kItemConditional,
      kItemStop,
      kItemPrintf,
      kItemEmpty,
      kItemGroup,
      kItemUndef
    };
    enum PortDir {
      kPortDirInput,
      kPortDirOutput,
      kPortDirInout,
      kPortDirUndef
    };
    enum MPortDir {
      kMPortDirInfer,
      kMPortDirRead,
      kMPortDirWrite,
      kMPortDirRdwr,
      kMPortDirUndef
    };
    enum RUW {
      kRuwOld,
      kRuwNew,
      kRuwUndef
    };
    enum ExpressionType {
      kExpTypeUInt,
      kExpTypeUIntBits,
      kExpTypeSInt,
      kExpTypeSIntBits,
      kExpTypeRef,
      kExpTypeSubfield,
      kExpTypeDouble,
      kExpTypeSubindex,
      kExpTypeSubaccess,
      kExpTypeMux,
      kExpTypeValidif,
      kExpTypePrimOperation,
      kExpTypeUndef
    };
    enum MemPortType {
      kMemPortData,
      kMemPortAddr,
      kMemPortEn,
      kMemPortClk,
      kMemPortMask,
      kMemPortWMode,
      kMemPortWData,
      kMemPortRData,
      kMemPortWMask,
      kMemPortUndef
    };
  public:
    firDB() {}
    ~firDB() {
      this->release();
    }
  public:
    static firLibrary* getLib(const std::string& lib_name);
    static firLibrary* findLib(const std::string& lib_name);
    static void destroy(firLibrary* library);
    static void release();

  private:
    static std::map<std::string, firLibrary*> libs_;
  };

  class firDB::firInfo {
  public:
    firInfo() { content_ = ""; }
    firInfo(const std::string& content) { content_ = content; }
    ~firInfo() {}
  public:
    std::string content() const { return content_; }
    void set_content(const std::string& content) { content_ = content; }
    void set_content(const char* content) { content_ = content; }
  private:
    std::string content_;
  };

  class firDB::firDocData {
  public:
    firDocData(const int lb, const int le, const int cb, const int ce, const int fd) {
      fs_assert(check(lb, le, cb, ce, fd));
      line_begin_ = lb;
      line_end_ = le;
      col_begin_ = cb;
      col_end_ = ce;
      file_id_ = fd;
    }
    ~firDocData() {}
    bool check(const int lb, const int le, const int cb, const int ce, const int fd) {
      return ((lb >= 0 && (unsigned int)lb <= LINE_NUM_LIMIT) &&
        (le >= 0 && (unsigned int)le <= LINE_NUM_LIMIT) &&
        (cb >= 0 && (unsigned int)cb <= COL_NUM_LIMIT) &&
        (ce >= 0 && (unsigned int)ce <= COL_NUM_LIMIT) &&
        (fd >= 0 && (unsigned int)fd <= FILE_NUM_LIMIT));
    }
    unsigned int line_begin() const { return line_begin_; }
    unsigned int line_end() const { return line_end_; }
    void set_line_end(unsigned int line_end) { line_end_ = line_end; }
    unsigned int col_begin() const { return col_begin_; }
    unsigned int col_end() const { return col_end_; }
    void set_col_end(unsigned int col_end) { col_end_ = col_end; }
    unsigned int file_id() const { return file_id_; }
  private:
    IntegerType line_begin_ : LINE_BITS;
    IntegerType line_end_ : LINE_BITS;
    IntegerType col_begin_ : COL_BITS;
    IntegerType col_end_ : COL_BITS;
    IntegerType file_id_ : FILE_ID_BITS;
  };

  class firDB::firLocObj {
  public:
    firLocObj() : doc_data_(NULL) {}
    virtual ~firLocObj() {
      if (doc_data_) delete doc_data_;
      doc_data_ = NULL;
    }
    virtual std::string toString(std::string sIndent = "") = 0;
    void set_doc_data(const int line_begin, const int line_end, const int col_begin, const int col_end, const int file_id) {
      fs_assert(doc_data_ == NULL);
      doc_data_ = new firDocData(line_begin, line_end, col_begin, col_end, file_id);
    }
    unsigned int line_begin() const {
      fs_assert(doc_data_);
      return doc_data_->line_begin();
    }
    unsigned int line_end() const {
      fs_assert(doc_data_);
      return doc_data_->line_end();
    }
    void set_line_end(unsigned int line_end) {
      doc_data_->set_line_end(line_end);
    }
    unsigned int col_begin() const {
      fs_assert(doc_data_);
      return doc_data_->col_begin();
    }
    unsigned int col_end() const {
      fs_assert(doc_data_);
      return doc_data_->col_end();
    }
    void set_col_end(unsigned int col_end) {
      doc_data_->set_col_end(col_end);
    }
    unsigned int file_id() const {
      fs_assert(doc_data_);
      return doc_data_->file_id();
    }
  private:
    firDocData* doc_data_;
  };

  class firDB::firDefName : public firDB::firLocObj {
  public:
    firDefName(const std::string& value) {
      value_ = value;
    }
    ~firDefName() {}
    std::string toString(std::string indent = "") {
      //std::string str = indent + "defname = " + value() + " : " + info();
      std::string str = indent + "defname = " + value() + " " + info();
      return str;
    }
    std::string info() const { return info_.content(); }
    void set_info(const std::string& info) { info_.set_content(info); }
    std::string value() const { return value_; }
    void set_defname(const std::string& value) {
      value_ = value;
    }
  private:
    firInfo info_;
    std::string value_;
  };

  class firDB::firParameter : public firDB::firLocObj {
  public:
    firParameter(const std::string& id, const std::string& value) {
      id_ = id;
      value_ = value;
    }
    ~firParameter() {}
    std::string toString(std::string indent = "") {
      //std::string str = indent + "parameter " + id() + " = " + value() + " : " + info();
      std::string str = indent + "parameter " + id() + " = " + value() + " " + info();
      return str;
    }
    std::string info() const { return info_.content(); }
    void set_info(const std::string& info) { info_.set_content(info); }
    std::string id() const { return id_; }
    std::string value() const { return value_; }
    void set_value(const std::string& value) {
      fs_warning("*WARNING*: Value %s in parameter %s is changing to %s.\n", value_.c_str(), id_.c_str(), value.c_str());
      value_ = value;
    }
  private:
    firInfo info_;
    std::string id_;
    std::string value_;
  };

  class firDB::firLibrary {
  public:
    firLibrary(const std::string& lib_name);
    ~firLibrary();

    void clear();
  public:
    std::string name() const { return lib_name_; }
    //get user circuit, one library has only one circuit
    firCircuit* fir_circuit();
    firCircuit* post_circuit();
    firCircuit* findCircuitByName(const std::string& cir_name);
    firCircuit* findPostCircuitByName(const std::string& cir_name);
    firCircuit* addCircuit(const std::string& cir_name);
    firCircuit* addPostCircuit(firCircuit* circuit);
    firCircuit* findPostCircuitByOrigin(firCircuit* circuit);
    void addFile(const std::string& file);
    int findIdByFileName(const std::string& file);
    std::string findFileById(int id);
    void releasePostCircuits();
  private:
    //Library Reference Name
    std::string lib_name_;
    std::vector<firCircuit*> circuits_;
    std::vector<firCircuit*> post_circuits_;
    // store file name and pathes, based on input file/pathes
    std::vector<std::string> files_;
    // firCircuit related to reference name
    std::map<std::string, firCircuit*> id_circuit_map_;
    std::map<std::string, firCircuit*> id_post_circuit_map_;
    std::map<firCircuit*, firCircuit*> circuit_to_post_map_;
    std::map<std::string, int> file_id_map_;
  };
}

#endif // !DB_FIRDB_H_
