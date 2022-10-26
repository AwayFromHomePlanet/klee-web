challenges = {"max_challenge.c": r"""
#include <klee/klee.h>
#include <assert.h>

int sample_max(int a, int b) {
  if (a > b) {
    return a;
  } else {
    return b;
  }
}

int main() {
  int a;
  int b;
  klee_make_symbolic(&a, sizeof(a), "a");
  klee_make_symbolic(&b, sizeof(b), "b");
  assert(sample_max(a, b) == max(a, b));
  return 0;
}
""",
              "fibonacci_challenge": r"""
#include<klee/klee.h>
#include<assert.h>

int sample_fib(int n) {
  int a = 0;
  int b = 1;
  for (int i = 0; i < n; i++) {
    b += a;
    a = b - a;
  }
  return a;
}

int main() {
  int a;
  klee_make_symbolic(&a, sizeof(a), "a");
  if (a >= 0 && a < 100) {
    assert(sample_fib(a) == fibonacci(a));
  }
  return 0;
}"""}


def add_solution_code(code, challenge_name):
    return code + challenges.get(challenge_name, "")
