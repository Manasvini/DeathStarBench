#ifndef INCLUDED_RAW_VALUES_H
#define INCLUDED_RAW_VALUES_H

#include <stdint.h>
#include <inttypes.h>

struct Value {
    int64_t value;
    int64_t timestamp;
};

struct Value* init_values(int64_t size);
void add_value(struct Value* values, struct Value v, int64_t idx);

void print_values(struct Value* values, int64_t n);
#endif

