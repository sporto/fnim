import unittest, fnim/basics, sequtils

suite "basics":
  test "identity":
    check identity(2) == 2
    check identity("Hello") == "Hello"

  # test "always":
  #   check always(1)("b") == 1

    # let result = @[1, 2, 3]
    #   .map(always(9))
    
    # check result == @[9, 9, 9]