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

  int flags = fcntl(1, F_GETFL, 0);
  fcntl(1, F_SETFL, flags | O_NONBLOCK);

  ret = ft_read(1, buf, 30);
  cr_assert_eq(ret, -1);
  cr_assert_eq(errno, EAGAIN);
}
