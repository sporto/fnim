import unittest, fnim/maybe

suite "maybe":
    test "it creates a Just":
        let just = Just("Hello")

        check just.with_default("") == "Hello"