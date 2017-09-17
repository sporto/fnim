import unittest, fnim/maybe

suite "maybe":
  test "basics":
    let just = Just("Hello")
    let nothing = Nothing[string]()

    check $just == "Just(Hello)"
    check $nothing == "Nothing"

    check just.isNothing == false
    check nothing.isNothing == true

    check just.isJust == true
    check nothing.isJust == false

  test "equality":
    let just = Just("Hello")
    let nothing = Nothing[string]()

    check just == Just("Hello")
    check nothing == Nothing[string]()

  test "withDefault returns the default":
    let nothing = Nothing[string]()
    check nothing.withDefault("Default") == "Default"

suite "Maybe.map":
  proc mapFn(n: int): int =
    n + 1

  test "map":
    let just = Just(2)
    let nothing = Nothing[int]()

    let just2 = just
      .map(mapFn)

    check just2.withDefault(0) == 3
    let nothing2 = nothing
      .map(mapFn)

    check nothing2.withDefault(0) == 0

suite "Maybe.andTap":
  proc andThenFn(n: int): Maybe[int] =
    Just(n + 1)

  proc andThenToNothingFn(n: int): Maybe[int] =
    Nothing[int]()

  test "andThen is nothing when first is nothing":
    let nothing = Nothing[int]()

    let result = nothing
      .andThen(andThenFn)
    
    check result.isNothing() == true
    check result.withDefault(0) == 0

  test "andThen is nothing when the second is nothing":
    let just = Just(2)

    let result = just
      .andThen(andThenToNothingFn)
    
    check result.isNothing() == true
    check result.withDefault(0) == 0

  test "andThen is Just when both are just":
    let just = Just(2)

    let result = just
      .andThen(andThenFn)

    check result.isJust() == true
    check result.withDefault(0) == 3
