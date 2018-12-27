module Views.Utils exposing (class, classList, style, when)

import Element exposing (..)
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
