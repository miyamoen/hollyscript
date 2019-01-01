module Views.Bib exposing (shelf)

import Bibliopola exposing (..)
import Views.Basics.Frame
import Views.Basics.Message


shelf : Shelf
shelf =
    emptyShelf "HollyScript"
        |> addBook Views.Basics.Message.book
        |> addBook Views.Basics.Frame.book


main : Bibliopola.Program
main =
    fromShelf shelf
