#include "libasm.h"
#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

int test_write(int fd1, int fd2, const char *buf, size_t count) {
  ssize_t exp = write(fd1, buf, count);
  int err = errno;

  ssize_t res = ft_write(fd2, buf, count);

  if (exp != res) {
    fprintf(stderr, "write: exp: %zd, res: %zd\n", exp, res);
    return 1;
  }

  if (err != errno) {
    fprintf(stderr, "write: err: %d, errno: %d\n", err, errno);
    return 1;
  }

  return 0;
}

int test_read(int fd1, int fd2, size_t count) {
  char buf1[4096];
  char buf2[4096];

  ssize_t exp = read(fd1, buf1, count);
  int err = errno;

  ssize_t res = ft_read(fd2, buf2, count);

  if (exp != res) {
    fprintf(stderr, "read: exp: %zd, res: %zd\n", exp, res);
    return 1;
  }

  if (err != errno) {
    fprintf(stderr, "read: err: %d, errno: %d\n", err, errno);
    return 1;
  }

  if (strcmp(buf1, buf2)) {
    fprintf(stderr, "read: buf1: %s, buf2: %s\n", buf1, buf2);
    return 1;
  }

  return 0;
}

int test_strlen(const char *str) {
  size_t exp = strlen(str);
  size_t res = ft_strlen(str);

  if (exp != res) {
    fprintf(stderr, "strlen: exp: %zu, res: %zu\n", exp, res);
    return 1;
  }

  return 0;
}

int test_strcmp(const char *s1, const char *s2) {
  int exp = strcmp(s1, s2);
  int res = ft_strcmp(s1, s2);

  if (exp != res) {
    fprintf(stderr, "strcmp: exp: %d, res: %d\n", exp, res);
    return 1;
  }

  return 0;
}

int test_strcpy(const char *src) {
  char dest[4096];

  char *res = ft_strcpy(dest, src);

  if (dest != res) {
    fprintf(stderr, "strcpy: dest: %p, res: %p\n", dest, res);
    return 1;
  }

  if (strcmp(src, dest)) {
    fprintf(stderr, "strcpy: src: %s, res: %s\n", src, res);
    return 1;
  }

  return 0;
}

int test_strdup(const char *str) {
  char *res = ft_strdup(str);

  if (strcmp(str, res)) {
    fprintf(stderr, "strdup: str: %s, res: %s\n", str, res);
    return 1;
  }

  return 0;
}

int test_list_push_front(const char *str1, const char *str2, const char *str3) {
  t_list *list = NULL;

  void *exp1 = strdup(str1);
  void *exp2 = strdup(str2);
  void *exp3 = strdup(str3);

  ft_list_push_front(&list, exp1);
  ft_list_push_front(&list, exp2);
  ft_list_push_front(&list, exp3);

  if (exp1 != list->next->next->data) {
    fprintf(stderr, "list_push_front: exp1: %p, data: %p\n", exp1,
            list->next->next->data);
    return 1;
  }

  if (exp2 != list->next->data) {
    fprintf(stderr, "list_push_front: exp2: %p, data: %p\n", exp2,
            list->next->data);
    return 1;
  }

  if (exp3 != list->data) {
    fprintf(stderr, "list_push_front: exp3: %p, data: %p\n", exp3, list->data);
    return 1;
  }

  return 0;
}

int test_list_size(size_t n) {
  t_list *list = NULL;

  void *data = strdup("Hello, world!");

  for (size_t i = 0; i < n; i++) {
    ft_list_push_front(&list, data);
  }

  size_t res = ft_list_size(list);

  if (n != res) {
    fprintf(stderr, "list_size: exp: %zu, res: %zu\n", n, res);
    return 1;
  }

  return 0;
}

int main(void) {
  int wfd1 = open("write1.txt", O_WRONLY);
  int wfd2 = open("write2.txt", O_WRONLY);

  if (test_write(-1, -1, "Hello, world!", 13))
    return 1;

  int rfd1 = open("read1.txt", O_RDONLY);
  int rfd2 = open("read2.txt", O_RDONLY);

  if (test_read(rfd1, rfd2, 13))
    return 1;

  if (test_strlen("Hello, world!"))
    return 1;

  if (test_strcmp("Hello, world!", "Hello, world!"))
    return 1;

  if (test_strcpy("Hello, world!"))
    return 1;

  if (test_strdup("Hello, world!"))
    return 1;

  if (test_list_push_front("data1", "data2", "data3"))
    return 1;

  if (test_list_size(5))
    return 1;

  return 0;
}
