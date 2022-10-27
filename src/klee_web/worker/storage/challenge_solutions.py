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
  if (param1 >= 0 && param1 < 100) {
    assert(sample_fib(param1) == fibonacci(param1));
  }
  return 0;
}"""}


def add_solution_code(code, challenge_name):
    sample_code = challenges.get(challenge_name, "")
    challenge_func = challenge_name.replace("_challenge.c", "")
    param_search = re.search(challenge_func + r"\s*\(([^)]*)", code)
    if param_search:
        params = param_search.group(1)
        param_list = re.findall(r"[^)a-z]*\w*\s*(\w*)", params)
        for i in range(len(param_list)):
            sample_code = \
                sample_code.replace("param" + str(i + 1), param_list[i])
    return code + sample_code
