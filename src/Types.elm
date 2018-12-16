module Types exposing (Line, MessageWindow, Model, Script(..))

import SelectList exposing (SelectList)


type Script
    = Message String
    | WaitClick
    | NewLine
    | ClearMessage


type alias Line =
    List String


type alias MessageWindow =
    { lines : List Line
    , waitClick : Bool
    }


type alias Model =
    { messageWindow : MessageWindow
    , scripts : SelectList Script
    }
