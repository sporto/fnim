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

  test "andThen"