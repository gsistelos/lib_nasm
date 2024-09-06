#include "libasm.h"

#include <criterion/criterion.h>
#include <errno.h>
#include <fcntl.h>

Test(ft_read, basic) {
  int fd = open("file.txt", O_RDONLY);

  char buf[4096];

  ssize_t ret = ft_read(fd, buf, 13);
  cr_assert_eq(ret, 13);
  cr_assert_str_eq(buf, "Hello, world!");
}

Test(ft_read, errno_values) {
  char buf[4096];

  ssize_t ret = ft_read(-1, buf, 0);
  cr_assert_eq(ret, -1);
  cr_assert_eq(errno, EBADF);

  int fd = open("file.txt", O_RDONLY);

  ret = ft_read(fd, NULL, 13);
  cr_assert_eq(ret, -1);
  cr_assert_eq(errno, EFAULT);

  // This is working locally, but not in github actions
  // Since it's probably due to the non blocking behaviour
  //  in github actions environment, its commented

  // int flags = fcntl(1, F_GETFL, 0);
  // fcntl(1, F_SETFL, flags | O_NONBLOCK);

  // ret = ft_read(1, buf, 30);
  // cr_assert_eq(ret, -1);
  // cr_assert_eq(errno, EAGAIN);
}
