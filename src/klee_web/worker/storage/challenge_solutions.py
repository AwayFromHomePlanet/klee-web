import re

challenges = {"max_challenge.c": r"""
#include <klee/klee.h>
#include <assert.h>

int sample_max(int param1, int param2) {
  if (param1 > param2) {
    return param1;
  } else {
    return param2;
  }
}

int main() {
  int param1;
  int param2;
  klee_make_symbolic(&param1, sizeof(param1), "param1");
  klee_make_symbolic(&param2, sizeof(param2), "param2");
  assert(sample_max(param1, param2) == max(param1, param2));
  return 0;
}
""",
              "fibonacci_challenge.c": r"""
#include<klee/klee.h>
#include<assert.h>

int sample_fib(int param1) {
  int a = 0;
  int b = 1;
  for (int i = 0; i < param1; i++) {
    b += a;
    a = b - a;
  }
  return a;
}

int main() {
  int param1;
  klee_make_symbolic(&param1, sizeof(param1), "param1");
  klee_assume(param1 >= 0);
  klee_assume(param1 < 100);
  assert(sample_fib(param1) == fibonacci(param1));
  return 0;
}
""",
              "sum_digits_challenge.c": r"""
#include<klee/klee.h>
#include<assert.h>

int sample_sum_digits(n) {
  if (n <= 0) return 0;
  return n % 10 + sum_digits(n / 10);
}

int main() {
  int param1;
  klee_make_symbolic(&param1, sizeof(param1), "param1");
  klee_assume(param1 >= 0);
  assert(sample_sum_digits(param1) == sum_digits(param1));
  return 0;
}
""",
              "binary_challenge.c": r"""
#include<klee/klee.h>
#include<assert.h>

int sample_binary(int n) {
  int output = 0;
  int digit = 1;
  while (n > 0) {
    output += (n & 1) * digit;
    n >>= 1;
    digit *= 10;
  }
  return output;
}

int main() {
  int param1;
  klee_make_symbolic(&param1, sizeof(param1), "param1");
  klee_assume(param1 >= 0);
  klee_assume(param1 <= 1000);
  assert(sample_binary(param1) == binary(param1));
  return 0;
}
""",
              "base_converter_challenge.c": r"""
#include<klee/klee.h>
#include<assert.h>

int sample_base_converter(int n, int base) {
  int output = 0;
  int digit = 1;
  while (n > 0) {
    output += (n % base) * digit;
    n /= base;
    digit *= 10;
  }
  return output;
}

int main() {
  int param1;
  int param2;
  klee_make_symbolic(&param1, sizeof(param1), "param1");
  klee_make_symbolic(&param2, sizeof(param2), "param2");
  klee_assume(param1 >= 0);
  klee_assume(param1 <= 1000);
  klee_assume(param2 > 1);
  klee_assume(param2 < 10);
  assert(sample_base_converter(param1, param2) ==
         base_converter(param1, param2));
  return 0;
}
""",
              "log_2_challenge.c": r"""
#include<klee/klee.h>
#include<assert.h>

int sample_log_2(int n) {
    int i = 0;
    while (n > 1) {
        n /= 2;
        i++;
    }
    return i;
}

int main() {
  int param1;
  klee_make_symbolic(&param1, sizeof(param1), "param1");
  klee_assume(param1 >= 1);
  assert(sample_log_2(param1) == log_2(param1));
  return 0;
}
""",
              "log_base_challenge.c": r"""
#include<klee/klee.h>
#include<assert.h>

int sample_log_base(int n, int base) {
    int i = 0;
    while (n >= base) {
        n /= base;
        i++;
    }
    return i;
}


int main() {
  int param1;
  int param2;
  klee_make_symbolic(&param1, sizeof(param1), "param1");
  klee_make_symbolic(&param2, sizeof(param2), "param2");
  klee_assume(param1 >= 1);
  klee_assume(param2 >= 2);
  klee_assume(param2 <= 20);
  assert(sample_log_base(param1, param2) == log_base(param1, param2));
  return 0;
}
"""}


def add_solution_code(code, challenge_name):
    sample_code = challenges.get(challenge_name, "")
    challenge_func = challenge_name.replace("_challenge.c", "")
    param_search = re.search(challenge_func + r"\s*\(([^)]*)\s*\)\s*\{", code)
    if param_search:
        params = param_search.group(1)
        param_list = re.findall(r"[^)a-z]*\w*\s*(\w*)", params)
        for i in range(len(param_list)):
            sample_code = \
                sample_code.replace("param" + str(i + 1), param_list[i])
    return code + sample_code
