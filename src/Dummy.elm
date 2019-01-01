module Dummy exposing (model, scripts)

import SelectList exposing (SelectList)
import Types exposing (..)


model : Model
model =
    { messageWindow =
        { show = ""
        , rest = ""
        , waitClick = False
        }
    , scripts = scripts
    }


scripts : SelectList Script
scripts =
    SelectList.fromLists []
        (Message "first message. second message. third message")
        [ WaitClick
        , Message "After clicked\nnew line"
        , WaitClick
        , ClearMessage
        , Message "Clear Message\nfinished"
        ]
