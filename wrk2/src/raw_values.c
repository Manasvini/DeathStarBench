#include "raw_values.h"

#include <malloc.h>
#include <stdio.h>

struct Value* init_values(int64_t size){
	struct Value *vals = (struct Value*) malloc(sizeof(struct Value) * size);
	return vals;
}

void add_value(struct Value* values, struct Value v, int64_t idx){
	values[idx] = v;
}

void print_values(struct Value* values, int64_t n){
	printf("Timestamp\tLatency\n");
	for(int64_t i = 0; i < n; i++){
		printf("%ld\t%ld\n", values[i].timestamp, values[i].value);
	}
}
