#include <stdio.h>
#include <stdlib.h>
#include "example.h"

static int int_ernal = 42;

int* get_int() { return &int_ernal; }

foo_t* get_foo() {
  foo_t *foo = calloc(1, sizeof(foo_t));

  foo->a = 1;
  foo->x[0].a = 42;
  foo->x[1].f = 19.5;

  foo->x[0].b0 = 2;
  foo->x[0].b1 = 5;

  foo->x[0].p[0] = calloc(1, sizeof(struct quux));
  foo->x[0].p[1] = calloc(1, sizeof(struct quux));

  return foo;
}

void print_bits(foo_t *foo) {
  printf("b0 = %d, b1 = %d\n", foo->x[0].b0, foo->x[0].b1);
}

void free_foo(foo_t *foo) {
  if(!foo) {
    printf("Trying to free_foo NULL!\n");
    return;
  }

  free(foo->x[0].p[0]);
  free(foo->x[0].p[1]);
  free(foo);
}

my_foo_t* get_my_foo() {
  my_foo_t *my_foo = calloc(1, sizeof(my_foo_t));
  //  my_ss_t *my_ss = calloc(1, sizeof(my_ss_t));

  my_foo->a = 11;
  my_foo->b = 14;
  /* my_foo->s = my_ss; */
  /* my_foo->s->x = 43; */
  /* my_foo->s->y = 98; */
  my_foo->s.x = 43;
  my_foo->s.y = 98;

  return my_foo;
}
