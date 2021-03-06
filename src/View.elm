module View exposing (view)

import Browser exposing (Document)
import Element exposing (..)
import Html exposing (Html)
import Types exposing (..)
import Views.Customs.MessageWindow
import Views.Utils exposing (rootAttributes)


view : Model -> Document Msg
view model =
    { title = "Holly Script"
    , body =
        [ layout (rootAttributes ++ [ padding 20 ]) <|
            Views.Customs.MessageWindow.view model.messageWindow
        ]
    }
