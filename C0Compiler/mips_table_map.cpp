#include "stdafx.h"
#include <algorithm>

#define REG_COUNT 32
#define MC MipsCode

using namespace SymbolUtils;

MipsTable::MipsTable(Symbol* func_sym, 
    SymbolTable* symbol_table,
    QuaterionTable* q, mem_map * r_m): q_table(q), root_map(r_m) {
    q_iter = get_base(func_sym);
    func = func_sym;
    init_regs();

    stack_size = 0;
    SymbolTable* func_sym_table = func_sym->symbol_table;
    sym_list param_list = func_sym->parameter_type_list;
    sym_list symbol_list = func_sym_table->get_all();

    stack_map = new mem_map;

    // alloc space for return value
    if (func_sym->type != Symbol::VOID) {
        ret_sym = new Symbol("%ret_val", Symbol::INT);
        alloc_stack(ret_sym);
    }
    stack_size = 4; // always leave a place for ret_val, for consistency
    // alloc stack space for parameters
    for (sym_list::iterator iter_p = param_list.begin();
        iter_p != param_list.end();
        iter_p++) {
        alloc_stack(*iter_p);
    }
    // alloc space for local variables

    sym_list symbol_left = diff(symbol_list, param_list, true);
    // watch out! param_list in this scope is sorted
    for (sym_list::iterator iter_p = symbol_left.begin();
        iter_p != symbol_left.end();
        iter_p++) {
        if (((*iter_p)->type == Symbol::INT) ||
           ((*iter_p)->type == Symbol::CHAR)) {
            if ((*iter_p)->const_flag == false) {
                 alloc_stack(*iter_p);
            }
        }
    }
    // alloc space for registers
    // ....
}

void MipsTable::init_regs() {
    global_map = new reg_map();
    temp_map = new reg_map();

    pass_sym = new Symbol("%pass_val", Symbol::VOID);

    reg_distrb = vector<Symbol*>(REG_COUNT, NULL);
}

MipsTable::~MipsTable() {
    printf("deleted\n");
    delete stack_map;
    delete global_map;
    delete temp_map;
    //delete ret_sym;
}

int MipsTable::stack_increment(Symbol* sym) {
    const int INT_SIZE = 4;
    const int CHAR_SIZE = 1;
    int ptr = 0;
    int single_size = get_simple_size(sym);
    
    // alignment
    stack_size = ((stack_size + single_size - 1) 
        / single_size * single_size);

    ptr = stack_size;
    // increment
    if (!(sym->array_flag)) {
        stack_size += get_simple_size(sym);
    } else {
        stack_size += get_simple_size(sym) * (sym->array_length);
    }

    return stack_size;
}

void MipsTable::alloc_stack(Symbol* sym) {
    int ptr = -stack_increment(sym); // stack is being dug
    stack_map->insert(mem_map::value_type(sym, ptr));
}


bool MipsTable::p_compare(p & a, p & b) {
    return a.first > b.first;
}

void MipsTable::display_stack() {
    vector<p> list;
    for (mem_map::iterator iter_s = stack_map->begin();
        iter_s != stack_map->end(); iter_s++) {
            list.push_back(p(
                iter_s->second,
                iter_s->first
            ));

    }

    sort(list.begin(), list.end(), p_compare); 
    // 被外界调用了，要加 static！
    cout << func->name << " stack:\n";
    for (vector<p>::iterator iter = list.begin();
        iter != list.end(); iter++) {
        printf("@%d: %s\n", iter->first,
            iter->second->name.c_str());
    }
}

int MipsTable::fetch_symbol(Symbol* sym, bool load_value) {
    // 注意全局变量的处理
    int reg;
    reg_map::iterator iter;
    mem_map::iterator iter_global;
    iter = temp_map->find(sym);
    iter_global = root_map->find(sym);

    if (sym->type == Symbol::LABEL) {
        // be robust
        return 0;
    }
	if (sym->const_flag) {
		sym->display();
	}
    assert(!sym->const_flag);

    if ((iter != temp_map->end()) && (iter->second != 0)) {
        // already distributed
        reg = iter->second;
       // fprintf(MipsCode::out_file, "# already there %s @ $%d\n", sym->name.c_str(), reg);
    } else {
        if (reg = alloc_temp_reg(sym)) {
           // fprintf(MipsCode::out_file, "# alloc reg %s @ $%d\n", sym->name.c_str(), reg);
        } else {
            temp_write_back();
            reg = alloc_temp_reg(sym);  
        }
    }
    if (load_value) {
       // fprintf(MipsCode::out_file, "# loading reg %s @ $%d\n", sym->name.c_str(), reg);
        load_symbol(sym);
    }
    //display_temp_map();
    fprintf(MipsCode::out_file, "# fetch %s @ $%d\n", sym->name.c_str(), reg);
    //cout << sym->name << " at $" << reg << "; " << endl;
    return reg;
}

int MipsTable::alloc_temp_reg(Symbol* sym) {
    for (int idx = MC::_t0; idx <= MC::_t7; idx++) {
        //cout << reg_distrb.at(idx) << endl;
        if (reg_distrb.at(idx) == NULL) {
            map_sym_reg(sym, idx, temp_map);
            return idx;
        }
    }
    return 0;
}

int MipsTable::temp_write_back() {
    // naive strategy, until the next jump,
    // a symbol that will not be used will be written back to
    // memory
    Symbol* to_write_back = findUselessSymbol();

    save_symbol(to_write_back);
    map_sym_reg(to_write_back, 0, temp_map);
    // map to zero is unmapping
    
    return 0;
}

void MipsTable::map_sym_reg(Symbol* sym, int reg, reg_map* map) {
    reg_map::iterator iter;
    iter = map->find(sym);
    int old_reg = 0;
    if (iter == map->end()) {
        map->insert(reg_map::value_type(sym, reg));
    } else {
        old_reg = iter->second;
        iter->second = reg;
    }
    if (reg != 0) {
        reg_distrb.at(reg) = sym;
    } else {
        // map to zero is unmapping
        reg_distrb.at(old_reg) = NULL;
    }

 }

void MipsTable::load_symbol(Symbol* sym) {
    int offset, base;
    if (root_map->find(sym) != root_map->end()) {
        offset = (*root_map)[sym];
        base = MC::_gp;
    } else {
        offset = (*stack_map)[sym];
        base = MC::_sp;
    }
    fprintf(MC::out_file, "# load %s\n", sym->name.c_str());
    if (!sym->array_flag) {
        if (sym->type == Symbol::INT) {
            MC::lw((*temp_map)[sym], offset, base);
        }
        if (sym->type == Symbol::CHAR) {
            MC::lb((*temp_map)[sym], offset, base);
        }
    } else {
        // if it is an array, load the base address
        MC::addiu((*temp_map)[sym], base, offset);
        // TODO: root_map
    }
}

void MipsTable::save_symbol(Symbol* sym) {
    int offset, base;
    fprintf(MC::out_file, "# save %s\n", sym->name.c_str());
    if (root_map->find(sym) != root_map->end()) {
        offset = (*root_map)[sym];
        base = MC::_gp;
    } else {
        offset = (*stack_map)[sym];
        base = MC::_sp;
    }
    if (sym->type == Symbol::INT && !sym->array_flag) {
        MC::sw((*temp_map)[sym], offset, base);
    }
    if (sym->type == Symbol::CHAR && !sym->array_flag) {
        MC::sb((*temp_map)[sym], offset, base);
    }
}

void MipsTable::reserve_regs() {
    reserved_reg_ptr = alignment(stack_size, 4) + 4;
    for (int i = MC::_t0; i <= MC::_t9; i++) {
        int offset = dig_up(4);
        MC::sw(i, -offset);
    }
    int offset = dig_up(4);
    MC::sw(MC::_ra, -offset);

    dig_size = stack_size + 4;
}

void MipsTable::reload_regs() {
    int mem_ptr = reserved_reg_ptr;
    for (int i = MC::_t0; i <= MC::_t9; i++) {
        MC::lw(i, -mem_ptr);
        mem_ptr += 4;
    }
    MC::lw(MC::_ra, -mem_ptr);
}
/*
void MipsTable::write_back_root_vars() {
    for (sym_list::iterator iter = reg_distrb.begin();
        iter != reg_distrb.end(); iter++) {
        if (root_map->find(*iter) != root_map->end()) {
            fprintf(MC::out_file, "# write back root %s\n", (*iter)->name.c_str());
            save_symbol(*iter);
            map_sym_reg(*iter, 0, temp_map);
        }
    }
}*/
/*
void MipsTable::write_back_all_vars() {
    fprintf(MC::out_file, "# ---write back all---\n");

    for (sym_list::iterator iter = reg_distrb.begin();
        iter != reg_distrb.end(); iter++) {
        if ((*iter) != NULL) {
            fprintf(MC::out_file, "# write back all: %s\n", (*iter)->name.c_str());
            save_symbol(*iter);
            map_sym_reg(*iter, 0, temp_map); 
        }
    }
}*/

void MipsTable::unmap_all_regs() {
    for (sym_list::iterator iter = reg_distrb.begin();
        iter != reg_distrb.end(); iter++) {
        if ((*iter) != NULL) {
            map_sym_reg(*iter, 0, temp_map); 
        }
    }
}