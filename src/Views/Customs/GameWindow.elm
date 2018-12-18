module Views.Customs.GameWindow exposing (view)

import Element exposing (..)
import Element.Events exposing (onClick)
import SelectList
import Types exposing (..)
import Views.Customs.MessageWindow as MessageWindow
import Views.Utils exposing (when)


view : Model -> Element Msg
view { scripts, messageWindow } =
    column []
        [ row [ spacing 32 ]
            [ el [ onClick Click ] <| text "Start"
            , el [] <|
                text <|
                    if SelectList.isHead scripts then
                        "prestart"

                    else if SelectList.isLast scripts then
                        "end"

                    else
                        "processing"
            ]
        , MessageWindow.view messageWindow
        ]
