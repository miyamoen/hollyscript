module Types.Script exposing (next)

import SelectList exposing (SelectList)
import Types exposing (..)


next : SelectList Script -> MessageWindow -> ( SelectList Script, MessageWindow )
next scripts { lines, waitClick } =
    let
        ( nextScripts, nextLines, nextWaitClick ) =
            nextHelp ( scripts, SelectList.fromLists lines [] [], waitClick )
    in
    ( nextScripts, { lines = nextLines, waitClick = nextWaitClick } )


nextHelp :
    ( SelectList Script, SelectList Line, Bool )
    -> ( SelectList Script, List Line, Bool )
nextHelp ( scripts, lines, waitClick ) =
    case ( SelectList.selectBy 1 scripts, SelectList.selected scripts ) of
        ( Just nextScripts, Message msg ) ->
            nextHelp
                ( nextScripts
                , SelectList.updateSelected ((::) msg) lines
                , waitClick
                )

        ( Nothing, Message msg ) ->
            ( scripts
            , SelectList.updateSelected ((::) msg >> List.reverse) lines
                |> SelectList.toList
            , waitClick
            )

        ( Just nextScripts, WaitClick ) ->
            ( nextScripts
            , SelectList.updateSelected List.reverse lines
                |> SelectList.toList
            , True
            )

        ( Nothing, WaitClick ) ->
            ( scripts
            , SelectList.updateSelected List.reverse lines
                |> SelectList.toList
            , False
            )

        ( Just nextScripts, NewLine ) ->
            nextHelp
                ( nextScripts
                , SelectList.updateSelected List.reverse lines
                    |> SelectList.insertBefore []
                , waitClick
                )

        ( Nothing, NewLine ) ->
            ( scripts
            , SelectList.updateSelected List.reverse lines
                |> SelectList.toList
            , waitClick
            )

        ( Just nextScripts, ClearMessage ) ->
            nextHelp
                ( nextScripts
                , SelectList.singleton []
                , waitClick
                )

        ( Nothing, ClearMessage ) ->
            ( scripts
            , []
            , waitClick
            )
