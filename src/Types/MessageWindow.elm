module Types.MessageWindow exposing (isNextScripts, next)

import Types exposing (..)


next : MessageWindow -> MessageWindow
next { show, rest, waitClick } =
    { waitClick = waitClick
    , show = show ++ String.left 1 rest
    , rest = String.dropLeft 1 rest
    }


isNextScripts : MessageWindow -> Bool
isNextScripts { rest, waitClick } =
    String.isEmpty rest && not waitClick
