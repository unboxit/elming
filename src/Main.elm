module Main exposing (..)

import Html exposing (Html, text)
import Example exposing (..)


main : Html msg
main =
    text <| palindrome "anna"
