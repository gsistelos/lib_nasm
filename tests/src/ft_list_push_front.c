#include "libasm.h"

#include <criterion/criterion.h>

Test(ft_list_push_front, basic) {
  t_list *lst = NULL;

  char *str = strdup("Hello, world!");
  char *str2 = strdup("Hello, again!");
  char *str3 = strdup("Hello, world, again!");

  ft_list_push_front(&lst, str);
  cr_assert_str_eq(lst->data, str);

  ft_list_push_front(&lst, str2);
  cr_assert_str_eq(lst->data, str2);
  cr_assert_str_eq(lst->next->data, str);

  ft_list_push_front(&lst, str3);
  cr_assert_str_eq(lst->data, str3);
  cr_assert_str_eq(lst->next->data, str2);
  cr_assert_str_eq(lst->next->next->data, str);
}
