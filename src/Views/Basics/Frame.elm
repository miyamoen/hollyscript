module Views.Basics.Frame exposing (book, view)

import Bibliopola exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Views.Utils exposing (withFrame)


view : List (Attribute msg) -> Element msg -> Element msg
view attrs content =
    column
        ([ Border.width 4
         , Border.rounded 4
         , Border.color <| rgb255 10 10 10
         , padding 20
         , width fill
         ]
            ++ attrs
        )
        [ content ]


book : Book
book =
    intoBook "Frame" identity (view [ height fill ] >> withFrame)
        |> addStory
            (Story "content"
                [ ( "text", text "むかーしむかしあるところに" )
                , ( "empty", none )
                ]
            )
        |> buildBook
        |> withFrontCover (view [] (text "hi") |> withFrame)
