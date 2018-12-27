module Views.Bib exposing (shelf)

import Bibliopola exposing (..)
import Views.Basics.Message


shelf : Shelf
shelf =
    emptyShelf "HollyScript"
        |> addBook Views.Basics.Message.book


main : Bibliopola.Program
main =
    fromShelf shelf
