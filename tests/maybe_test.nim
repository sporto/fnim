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

  test "map":
    let just = Just(2)
    let nothing = Nothing[int]()

    let just2 = just
      .map(proc(n: int): int = n + 1)

    check just2.withDefault(0) == 3

    let nothing2 = nothing
      .map(proc(n: int): int = n + 1)

    check nothing2.withDefault(0) == 0


  # test "andThen"

  # test "andMap"