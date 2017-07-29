import Common exposing (..)
import Logic exposing (..)
import View exposing (..)
import Html exposing (..)
import Time exposing (..)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Next            -> ({ model | currentScene = (calcScene model.currentScene) }, Cmd.none)
        SetScene name   -> ({ model | currentScene = (findScene name model.scenes) }, Cmd.none)
        Tick _          -> ({ model | currentScene = (calcScene model.currentScene) }, Cmd.none)
        ToggleAuto      -> ({ model | isAuto = (not model.isAuto) }, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model = 
    if model.isAuto then 
        Time.every (Time.inMilliseconds 500) Tick
    else 
        Sub.none

main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
