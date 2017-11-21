#include "stdafx.h"
#include <hash_map>  

struct string_less : public binary_function<const string, const string, bool>  
{   
public:   
    result_type operator()(const first_argument_type& _Left, const second_argument_type& _Right) const   
    {   
        return(_Left.compare(_Right) < 0 ? true : false);   
    }   
};  