#include <stdio.h>
#include <unistd.h>

int * f(int x) {
  int y = 2*x;
  return &y;
}

int main() {
  printf("%f\n", *f(21));
  return 0;
}
