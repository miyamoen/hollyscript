module Views.Customs.MessageWindow exposing (book, view)

import Bibliopola exposing (..)
import Dummy
import Element exposing (..)
import Element.Events exposing (onClick)
import Types exposing (..)
import Views.Basics.Frame as Frame
import Views.Basics.Message as Message
import Views.Utils exposing (when, withFrame)


view : MessageWindow -> Element Msg
view { show, waitClick } =
    Frame.view [ height fill, when waitClick <| onClick Click ] <|
        Message.view show


book : Book
book =
    bookWithFrontCover "MessageWindow"
        (view Dummy.model.messageWindow
            |> withFrame
            |> Element.map msgToString
        )
