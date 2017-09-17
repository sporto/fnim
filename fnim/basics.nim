proc identity*[T](a: T): T =
  a

# proc always*[T,U](a: T): auto =
#   (proc(x: U): T = a)