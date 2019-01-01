module Views.Bib exposing (shelf)

import Bibliopola exposing (..)
import Views.Basics.Frame
import Views.Basics.Message
import Views.Customs.MessageWindow


shelf : Shelf
shelf =
    emptyShelf "HollyScript"
        |> addShelf
            (emptyShelf "Basics"
                |> addBook Views.Basics.Message.book
                |> addBook Views.Basics.Frame.book
            )
        |> addShelf
            (emptyShelf "Customs"
                |> addBook Views.Customs.MessageWindow.book
            )


main : Bibliopola.Program
main =
    fromShelf shelf
