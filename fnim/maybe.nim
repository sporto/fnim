type
  MaybeKind = enum
    MaybeJust, MaybeNothing
  Maybe*[T] = object
    case kind: MaybeKind
    of MaybeJust:
      value: T
    of MaybeNothing:
      discard

proc `$`*[T](maybe: Maybe[T]): string =
  if maybe.isJust:
    "Just(" & $maybe.value & ")"
  else:
    "Nothing"

proc Just*[T](value: T): Maybe[T] =
  Maybe[T](kind: MaybeJust, value: value)

proc Nothing*[T](): Maybe[T] =
  Maybe[T](kind: MaybeNothing)

proc isJust*[T](maybe: Maybe[T]): bool =
  maybe.kind == MaybeJust

proc isNothing*[T](maybe: Maybe[T]): bool =
  maybe.kind == MaybeNothing

proc withDefault*[T](maybe: Maybe[T], default: T): T =
  case maybe.kind:
    of MaybeJust:
      maybe.value
    of MaybeNothing:
      default

proc `==`*[T](x, y: Maybe[T]): bool =
  if x.isJust and y.isJust:
    x.value == y.value
  elif x.isNothing and y.isNothing:
    true
  else:
    false

proc map*[T](maybe: Maybe[T], f: proc(val: T): T): Maybe[T] =
  if maybe.isJust:
    Just(f(maybe.value))
  else:
    maybe

proc andThen*[T](maybe: Maybe[T], f: proc(val: T): Maybe[T]): Maybe[T] =
  if maybe.isJust:
    f(maybe.value)
  else:
    maybe
