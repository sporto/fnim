proc reduce[T,U](source: seq[T], f: proc(acc: U, v: T): U, acc: U): U =
  result = acc
  for val in source:
    result = f(result, val)