#include "libasm.h"

#include <criterion/criterion.h>
#include <signal.h>

Test(ft_strcpy, basic) {
  char *cases[] = {
      "",
      "Hello",
      "Hello, world!",
      NULL,
  };

  for (size_t i = 0; cases[i]; i++) {
    char dest[100];

    char *ptr = ft_strcpy(dest, cases[i]);

    cr_assert_eq(ptr, dest);
    cr_assert_str_eq(dest, cases[i]);
  }
}

Test(ft_strcpy, null_ptr, .signal = SIGSEGV) { ft_strcpy(NULL, NULL); }
