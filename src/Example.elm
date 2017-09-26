module Example exposing (palindrome)


palindrome : String -> String
palindrome str =
    str
        |> String.reverse
