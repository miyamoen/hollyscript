module Types.Script exposing (next)

import SelectList exposing (SelectList)
import Types exposing (..)


next : Model -> Model
next ({ scripts, messageWindow } as model) =
    let
        nextScripts =
            SelectList.attempt (SelectList.selectBy 1) scripts
    in
    { model
        | scripts = nextScripts
        , messageWindow = nextHelp nextScripts messageWindow
    }


nextHelp : SelectList Script -> MessageWindow -> MessageWindow
nextHelp scripts window =
    case SelectList.selected scripts of
        Message msg ->
            { window | rest = window.rest ++ msg }

        WaitClick ->
            { window | waitClick = True }

        ClearMessage ->
            { window | show = "", rest = "" }
