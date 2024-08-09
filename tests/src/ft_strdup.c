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
    char *dup = ft_strdup(cases[i]);

    cr_assert_str_eq(dup, cases[i]);
    free(dup);
  }
}

Test(ft_strdup, null_ptr, .signal = SIGSEGV) { ft_strdup(NULL); }
