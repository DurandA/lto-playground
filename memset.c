#include <memset.h>

//__attribute__((externally_visible))
void *memset(void *s, int c, size_t count) {
  char *xs = s;
  while (count--)
    *xs++ = c;
  return s;
}
