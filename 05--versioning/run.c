#include <stdio.h>
#include <stdint.h>

extern uint64_t foo(uint64_t a, uint64_t b);

int main() {
    printf("%llu + %llu = %llu\n", 2ull, 2ull, foo(2ull, 2ull));
}
