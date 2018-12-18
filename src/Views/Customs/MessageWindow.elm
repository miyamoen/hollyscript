module Views.Customs.MessageWindow exposing (view)

import Element exposing (..)
import Element.Events exposing (onClick)
import Types exposing (..)
import Views.Utils exposing (when)


view : MessageWindow -> Element Msg
view { lines, waitClick } =
    textColumn
        [ when waitClick <| onClick Click
        , when waitClick pointer
        ]
    <|
        List.map (\line -> paragraph [] <| List.map text line) lines
