import unittest, fnim

suite "foldl":
  test "it works with sequences":
    proc reducer(val: int, acc: int): int =
      val + acc

    let seq = @[1,2,3]
    let result = seq.foldl(reducer, 0)
    check result == 6