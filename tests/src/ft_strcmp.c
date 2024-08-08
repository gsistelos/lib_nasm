#include "libasm.h"

#include <criterion/criterion.h>
#include <signal.h>

Test(ft_strcmp, basic) {
  char *cases[] = {
      "",
      "Hello",
      "Hello, world!",
      NULL,
  };

  for (size_t i = 0; cases[i]; i++) {
    cr_assert_eq(ft_strcmp(cases[i], cases[2]), strcmp(cases[i], cases[2]));
  }
}

Test(ft_strcmp, null_ptr, .signal = SIGSEGV) { ft_strcmp(NULL, NULL); }
