proc foldl[T,U](source: seq[T], f: proc(v: T, acc: U): U, acc: U): U =
  result = acc
  for val in source:
    result = f(result, val)