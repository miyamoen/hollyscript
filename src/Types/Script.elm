module Types.Script exposing (next, start)

import SelectList exposing (SelectList)
import Types exposing (..)


start : Model -> Model
start model =
    { model | messageWindow = nextHelp model.scripts model.messageWindow }


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
            { window
                | rest =
                    if String.isEmpty window.show then
                        window.rest ++ msg

                    else
                        String.join " " [ window.rest, msg ]
                , waitClick = False
            }

        WaitClick ->
            { window | waitClick = True }

        ClearMessage ->
            { show = "", rest = "", waitClick = False }
