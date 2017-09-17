type
  MaybeKind = enum
    MaybeJust, MaybeNothing
  Maybe*[T] = object
    case kind: MaybeKind
    of MaybeJust:
      value: T
    of MaybeNothing:
      discard

proc Just*[T](value: T): Maybe[T] =
  Maybe[T](kind: MaybeJust, value: value)

proc Nothing*[T](): Maybe[T] =
  Maybe[T](kind: MaybeNothing)

proc with_default*[T](maybe: Maybe[T], default: T): T =
  case maybe.kind:
    of MaybeJust:
      maybe.value
    of MaybeNothing:
      default