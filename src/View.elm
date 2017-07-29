module View exposing (view)

import Common exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)

view : Model -> Html Msg
view model =
    let
        { scenes, currentScene, isAuto } = model
    in
        div []
            [ div [ class "header" ]
                [ h1 [] [ text "Game of Life" ]
                , a [ href "https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life" ] [ text "more info" ]
                , select [ onInput SetScene ]
                    (
                        scenes 
                        |> List.map (\s -> option [ value (Tuple.first s) ] [ text (Tuple.first s) ])
                    )
                , label []
                    [ input [ type_ "checkbox", onClick ToggleAuto ] []
                    , text "auto"
                    ]
                , button [ onClick Next, classList [ ("off", isAuto) ] ] [ text "Next" ]
                ]
            , div [ class "grid" ]
                (
                    (Tuple.second currentScene)
                    |> List.map (\row -> 
                        div [ class "row" ] 
                            (
                                row 
                                |> List.map (\cell -> div [ classList [ ("cell", True), ("live", cell == 1) ] ] [])
                            )
                    )
                )
            ]
