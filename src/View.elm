module View exposing (view)

import Browser exposing (Document)
import Element exposing (..)
import Html exposing (Html)
import Types exposing (..)
import Views.Customs.GameWindow


view : Model -> Document Msg
view model =
    { title = "Holly Script"
    , body = [ layout [] <| Views.Customs.GameWindow.view model ]
    }
