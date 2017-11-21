// 定义所有有信息的符号

class Symbol {
private:
    // shared
    bool const_flag;
    // const
    char character_value;
    int integer_value;
    // array
    int array_type;
    int array_length;
public:
    enum symbol_types {
        FUNCTION,
        CHAR,
        INT,
        ARRAY
    };
    Symbol(string name, int type_);
    Symbol(string name, int type_, bool const_);
    void display();
    int id;
    int type;
    // const
    bool setConstantValue(char value);
    bool setConstantValue(int value);
    string name;
};