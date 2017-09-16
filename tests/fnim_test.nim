import unittest, fnim

suite "reduce":
  test "it works with sequences":
    proc reducer(val, acc) =
      val + acc

    let seq = @[1,2,3]
    let result = seq.foldl(reducer, 0)
    check result == 6