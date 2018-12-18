module Main exposing (main, update)

import Browser
import Dummy
import Types exposing (..)
import Types.Script as Script
import View exposing (view)


main : Program () Model Msg
main =
    Browser.document
        { init = \_ -> ( Dummy.model, Cmd.none )
        , view = view
        , update = update
        , subscriptions = always Sub.none
        }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Click ->
            let
                ( scripts, messageWindow ) =
                    Script.next model.scripts model.messageWindow
            in
            ( { model | scripts = scripts, messageWindow = messageWindow }
            , Cmd.none
            )
