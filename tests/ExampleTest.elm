module ExampleTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)
import Example


all : Test
all =
    describe "Example Test Suite"
        (List.concat allTests)


allTests : List (List Test)
allTests =
    [ palindromeTest
    , positiveTest
    , negativeTest
    ]


palindromeTest : List Test
palindromeTest =
    [ test "has no effect on a palindrome" <|
        \_ ->
            let
                str =
                    "hannah"
            in
                str
                    |> Example.palindrome
                    |> Expect.equal str
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


positiveTest : List Test
positiveTest =
    [ test "Multiplies positive numbers" <|
        \() ->
            Expect.equal (3 * 5) 15
    ]


negativeTest : List Test
negativeTest =
    [ test "Multiplies negative numbers" <|
        \() ->
            Expect.equal ((-3) * (5)) -15
    ]
