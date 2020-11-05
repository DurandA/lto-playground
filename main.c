#include <memset.h>

struct bar {
  int a[100];
};

struct bar y;

void foo(void) {
  struct bar x = {{0}};
  y = x;
}

void _start(void) {
  int ret = main();
}

int main(void) {
  foo();
  volatile int baz = y.a[0];
  return baz;
}
