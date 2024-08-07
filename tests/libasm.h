#ifndef LIBASM_H
#define LIBASM_H

#include <sys/types.h>

extern int ft_strlen(const char *str);
extern char *ft_strcpy(char *dst, const char *src);
extern int ft_strcmp(const char *s1, const char *s2);
extern ssize_t ft_write(int fd, const void *buf, int count);
extern ssize_t ft_read(int fd, void *buf, int count);
extern char *ft_strdup(const char *str);

#endif // LIBASM_H
