// 定义所有有信息的符号

class Symbol {
private:
    // shared
    bool const_flag;
    // const
    char character_value;
    int integer_value;
    // array
    bool array_flag;
    int array_length;
public:
    enum symbol_types {
        UNKNOWN,
        FUNCTION,
        CHAR,
        INT
    };
    Symbol(string name, int type_);
    Symbol(string name, int type_, bool const_);
    void display();
    int id;
    int type;
    // const
    bool setConstantValue(char value);
    bool setConstantValue(int value);
    // array
    void setArray(int len);
    string name;
};