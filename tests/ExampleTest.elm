module ExampleTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)
import Example


suite : Test
suite =
    describe "The Example module"
        [ describe "Example.palindrome"
            -- Nest as many descriptions as you like.
            [ test "has no effect on a palindrome" <|
                \_ ->
                    let
                        str =
                            "hannah"
                    in
                        str
                            |> Example.palindrome
                            |> Expect.equal str

            -- Expect.equal is designed to be used in pipeline style, like this.
            , test "reverses a known string" <|
                \_ ->
                    "ABCDEFG"
                        |> Example.palindrome
                        |> Expect.equal "GFEDCBA"

            -- fuzz runs the test 100 times with randomly-generated inputs!
            , fuzz string "restores the original string if you run it again" <|
                \randomlyGeneratedString ->
                    randomlyGeneratedString
                        |> Example.palindrome
                        |> Example.palindrome
                        |> Expect.equal randomlyGeneratedString
            ]
        ]


positiveTest : Test
positiveTest =
    test "Multiplies positive numbers" <|
        \() ->
            Expect.equal (3 * 5) 15


negativeTest : Test
negativeTest =
    test "Multiplies negative numbers" <|
        \() ->
            Expect.equal ((-3) * (5)) -15
