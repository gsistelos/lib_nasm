#include "libasm.h"

#include <criterion/criterion.h>
#include <stdio.h>

Test(ft_list_size, basic) {
  t_list *lst = NULL;

  for (size_t i = 0; i < 20; i++) {
    ft_list_push_front(&lst, malloc(1));
    cr_assert_eq(ft_list_size(lst), i + 1);
  }
}
