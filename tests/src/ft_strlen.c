#include "libasm.h"

#include <criterion/criterion.h>
#include <signal.h>

Test(ft_strlen, basic) {
  char *cases[] = {
      "",
      "Hello",
      "Hello, world!",
      NULL,
  };

  for (size_t i = 0; cases[i]; i++) {
    cr_assert_eq(ft_strlen(cases[i]), strlen(cases[i]));
  }
}

Test(ft_strlen, null_ptr, .signal = SIGSEGV) { ft_strlen(NULL); }
