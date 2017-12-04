// 定义所有有信息的符号

class SymbolTable;

class Symbol {
private:
    void init();
public:
    // shared
    bool const_flag;
    // const
    char character_value;
    int integer_value;
    // array
    bool array_flag;
    int array_length;
    // function
    bool function_flag;
    // label
    bool string_flag;
    enum symbol_types {
        UNKNOWN,
        CHAR,
        INT,
        VOID,

        LABEL
    };
    Symbol(string name, int type_, bool const_=false);
    void display();
    int id;
    int type;
    // const
    bool setConstantValue(char value);
    bool setConstantValue(int value);
    // array
    void setArray(int len);
    string name;
    // function
    SymbolTable* symbol_table;
    typedef vector<Symbol*> param_list; 
    param_list parameter_type_list;
    void setFunc();
    // label
    void setString(string & s);
    string string_content;
    //
    bool operator < (const Symbol &);
    bool operator > (const Symbol &);
};

namespace SymbolUtils {
    typedef vector<Symbol*> sym_list;
    bool comp(Symbol* & a, Symbol* & b);
    sym_list diff(sym_list & left, sym_list & right, 
        bool do_sort=false);
    sym_list union_(sym_list & left, sym_list & right, 
        bool do_sort=false);
    sym_list intersection(sym_list & left, sym_list & right, 
        bool do_sort=false);
}