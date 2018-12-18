module Views.Utils exposing (class, classList, when)

import Element exposing (..)
import Html.Attributes


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
