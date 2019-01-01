module Types exposing
    ( Line
    , MessageWindow
    , Model
    , Msg(..)
    , Script(..)
    , msgToString
    )

import SelectList exposing (SelectList)


type Script
    = Message String
    | WaitClick
    | ClearMessage


type alias Line =
    List String


type alias MessageWindow =
    { show : String
    , rest : String
    , waitClick : Bool
    }


type alias Model =
    { messageWindow : MessageWindow
    , scripts : SelectList Script
    }


type Msg
    = Click
    | Tick


msgToString : Msg -> String
msgToString msg =
    case msg of
        Click ->
            "Click"

        Tick ->
            "Tick"
