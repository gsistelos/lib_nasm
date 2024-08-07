#include "libasm.h"

#include <stdio.h>
#include <string.h>

int test_strlen(char *str) {
  size_t ft_len = ft_strlen(str);
  size_t len = strlen(str);

  printf("ft_strlen: %zu\n", ft_len);
  printf("strlen: %zu\n", len);

  if (ft_len != len) {
    printf("Error\n");
    return 1;
  }

  printf("OK\n");
  return 0;
}

int test_strcmp(char *s1, char *s2) {
  int ft_diff = ft_strcmp(s1, s2);
  int diff = strcmp(s1, s2);

  printf("ft_strcmp: %d\n", ft_diff);
  printf("strcmp: %d\n", diff);

  if (ft_diff != diff) {
    printf("Error\n");
    return 1;
  }

  printf("OK\n");
  return 0;
}

int test_strcpy(char *src) {
  char ft_dst[1024];
  char dst[1024];

  char *ft_ptr = ft_strcpy(ft_dst, src);

  printf("ft_strcpy return: %p\n", ft_ptr);
  printf("ft_dst: %p\n", ft_dst);

  if (ft_ptr != ft_dst) {
    printf("Error\n");
    return 1;
  }

  strcpy(dst, src);

  printf("ft_strcpy: %s\n", ft_dst);
  printf("strcpy: %s\n", dst);

  if (strcmp(ft_dst, dst) != 0) {
    printf("Error\n");
    return 1;
  }

  printf("OK\n");
  return 0;
}

int main() {
  char buf[1024] = "Hello, world!\n";

  ssize_t bytesw = ft_write(1, buf, 14);
  if (bytesw == -1) {
    perror("ft_write");
  } else {
    printf("Successfully wrote %zd bytes.\n", bytesw);
  }

  ssize_t bytesr = ft_read(0, buf, 1024);
  if (bytesr == -1) {
    perror("ft_read");
  } else {
    if (bytesr > 0 && buf[bytesr - 1] == '\n') {
      buf[bytesr - 1] = '\0';
    } else {
      buf[bytesr] = '\0';
    }

    printf("buf: %s\n", buf);
    printf("Successfully read %zd bytes.\n", bytesr);
  }

  test_strlen(buf);
  test_strcmp("Hello, world!", buf);

  test_strcpy(buf);

  return 0;
}
