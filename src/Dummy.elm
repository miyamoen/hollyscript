module Dummy exposing (model, scripts)

import SelectList exposing (SelectList)
import Types exposing (..)


model : Model
model =
    { messageWindow = { lines = [], waitClick = False }, scripts = scripts }


scripts : SelectList Script
scripts =
    SelectList.fromLists []
        (Message "first message")
        [ Message "second message"
        , Message "third message"
        , WaitClick
        , Message "After clicked"
        , NewLine
        , Message "new line"
        , WaitClick
        , ClearMessage
        , Message "Clear Message"
        , Message "finished"
        ]
