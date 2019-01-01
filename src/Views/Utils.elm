module Views.Utils exposing
    ( class
    , classList
    , rootAttributes
    , style
    , when
    , withFrame
    )

import Element exposing (..)
import Element.Font as Font
import Html.Attributes


style : String -> String -> Attribute msg
style k v =
    htmlAttribute <| Html.Attributes.style k v


class : String -> Attribute msg
class =
    htmlAttribute << Html.Attributes.class


classList : List ( String, Bool ) -> Attribute msg
classList =
    htmlAttribute << Html.Attributes.classList


when : Bool -> Attribute msg -> Attribute msg
when pred attr =
    if pred then
        attr

    else
        classList []


rootAttributes : List (Attribute msg)
rootAttributes =
    [ Font.family [ Font.typeface "mochi" ] ]


withFrame : Element msg -> Element msg
withFrame element =
    el (height fill :: width fill :: rootAttributes) element
