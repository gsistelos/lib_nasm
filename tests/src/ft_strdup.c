#include "libasm.h"

#include <criterion/criterion.h>
#include <signal.h>

Test(ft_strdup, basic) {
  char *cases[] = {
      "",
      "Hello",
      "Hello, world!",
      NULL,
  };

  for (size_t i = 0; cases[i]; i++) {
    cr_assert_str_eq(ft_strdup(cases[i]), cases[i]);
  }
}

Test(ft_strdup, null_ptr, .signal = SIGSEGV) { ft_strdup(NULL); }
