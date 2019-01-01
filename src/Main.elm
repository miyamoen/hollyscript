module Main exposing (main, update)

import Browser
import Dummy
import SelectList
import Time
import Types exposing (..)
import Types.MessageWindow as MessageWindow
import Types.Script as Script
import View exposing (view)


main : Program () Model Msg
main =
    Browser.document
        { init = \_ -> ( Script.start Dummy.model, Cmd.none )
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Click ->
            if SelectList.isLast model.scripts then
                ( model, Cmd.none )

            else
                ( Script.next model, Cmd.none )

        Tick ->
            if MessageWindow.isNextScripts model.messageWindow then
                update Click model

            else if String.isEmpty model.messageWindow.rest then
                ( model, Cmd.none )

            else
                ( { model | messageWindow = MessageWindow.next model.messageWindow }
                , Cmd.none
                )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch [ Time.every 70 (always Tick) ]
