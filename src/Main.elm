module Main exposing (main, update)

import Browser
import Dummy
import SelectList
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
            if SelectList.isLast model.scripts then
                ( model, Cmd.none )

            else
                ( Script.next model, Cmd.none )
