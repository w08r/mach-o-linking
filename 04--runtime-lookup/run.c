#include <stdio.h>
#include <stdint.h>
#include <dlfcn.h>
#include <assert.h>

typedef uint64_t (*foo_t)(uint64_t, uint64_t);

int main() {
    /* open the dynaimc library */
    void* libfoo = dlopen("./libfoo.dylib", RTLD_NOW);
    assert(libfoo);

    /* find the foo function in the dylib */
    foo_t foo = (foo_t)dlsym(libfoo, "foo");
    assert(foo);

    /* invoke foo */
    printf("%llu + %llu = %llu\n", 2ull, 2ull, foo(2ull, 2ull));

    /* release shared lib resources */
    dlclose(libfoo);
}
