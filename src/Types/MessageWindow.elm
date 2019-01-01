module Types.MessageWindow exposing (next)

import Types exposing (..)


next : MessageWindow -> MessageWindow
next { show, rest, waitClick } =
    { waitClick = waitClick
    , show = show ++ String.left 1 rest
    , rest = String.dropLeft 1 rest
    }
