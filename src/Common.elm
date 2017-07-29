module Common exposing (..)

import Time exposing (Time)

type alias Scene = (String, List (List Int))

type Msg = Next | SetScene String | Tick Time | ToggleAuto

type alias Model =
    {
        scenes : List Scene,
        currentScene : Scene,
        isAuto : Bool
    }

init : (Model, Cmd Msg)
init = (Model scenes sceneBlinker False, Cmd.none)

zeros : Int -> List Int
zeros n = List.repeat n 0

sceneBlinker : Scene
sceneBlinker =
    (   "Blinker"
    ,   [ [0,0,0,0,0]
        , [0,0,0,0,0]
        , [0,1,1,1,0]
        , [0,0,0,0,0]
        , [0,0,0,0,0]
        ]
    )

scenes : List Scene
scenes = 
    [ sceneBlinker
    ,   (   "Toad"
        ,   [ [0,0,0,0,0,0]
            , [0,0,0,0,0,0]
            , [0,0,1,1,1,0]
            , [0,1,1,1,0,0]
            , [0,0,0,0,0,0]
            , [0,0,0,0,0,0]
            ]
        )
    ,   (   "Beacon"
        ,   [ [0,0,0,0,0,0]
            , [0,1,1,0,0,0]
            , [0,1,0,0,0,0]
            , [0,0,0,0,1,0]
            , [0,0,0,1,1,0]
            , [0,0,0,0,0,0]
            ]
        )
    ,   (   "Pulsar"
        ,   [ zeros 17
            , zeros 17
            , [0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,0]
            , zeros 17
            , [0,0,1,0,0,0,0,1,0,1,0,0,0,0,1,0,0]
            , [0,0,1,0,0,0,0,1,0,1,0,0,0,0,1,0,0]
            , [0,0,1,0,0,0,0,1,0,1,0,0,0,0,1,0,0]
            , [0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,0]
            , zeros 17
            , [0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,0]
            , [0,0,1,0,0,0,0,1,0,1,0,0,0,0,1,0,0]
            , [0,0,1,0,0,0,0,1,0,1,0,0,0,0,1,0,0]
            , [0,0,1,0,0,0,0,1,0,1,0,0,0,0,1,0,0]
            , zeros 17
            , [0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,0]
            , zeros 17
            , zeros 17
            ]
        )
    ,   (   "Pentadecathion"
        ,   [ zeros 11
            , zeros 11
            , zeros 11
            , [0,0,0,0,0,1,0,0,0,0,0]
            , [0,0,0,0,1,1,1,0,0,0,0]
            , [0,0,0,1,1,1,1,1,0,0,0]
            , zeros 11
            , zeros 11
            , zeros 11
            , zeros 11
            , zeros 11
            , zeros 11
            , [0,0,0,1,1,1,1,1,0,0,0]
            , [0,0,0,0,1,1,1,0,0,0,0]
            , [0,0,0,0,0,1,0,0,0,0,0]
            , zeros 11
            , zeros 11
            , zeros 11
            ]
        )
    ,   (   "Block"
        ,   [ [0,0,0,0]
            , [0,1,1,0]
            , [0,1,1,0]
            , [0,0,0,0]
            ]
        )
    ,   (   "Beehive"
        ,   [ [0,0,0,0,0,0]
            , [0,0,1,1,0,0]
            , [0,1,0,0,1,0]
            , [0,0,1,1,0,0]
            , [0,0,0,0,0,0]
            ]
        )
    ,   (   "Loaf"
        ,   [ [0,0,0,0,0,0]
            , [0,0,1,1,0,0]
            , [0,1,0,0,1,0]
            , [0,0,1,0,1,0]
            , [0,0,0,1,0,0]
            , [0,0,0,0,0,0]
            ]
        )
    ,   (   "Boat"
        ,   [   [0,0,0,0,0]
            ,   [0,1,1,0,0]
            ,   [0,1,0,1,0]
            ,   [0,0,1,0,0]
            ,   [0,0,0,0,0]
            ]
        )
    ,   (   "Tub"
        ,   [ [0,0,0,0,0]
            , [0,0,1,0,0]
            , [0,1,0,1,0]
            , [0,0,1,0,0]
            , [0,0,0,0,0]
            ]
        )
    ,   (   "Glider"
        ,   [ [0,1,0] ++ (zeros 50)
            , [0,0,1] ++ (zeros 50)
            , [1,1,1] ++ (zeros 50)
            ] ++
            (List.repeat 50 (zeros 53))
        )
    ,   (   "Lightweight spaceship (LWSS)"
        ,   (List.repeat 2 (zeros 106)) ++
            [ [0,1,0,0,1,0] ++ (zeros 100)
            , [0,0,0,0,0,1] ++ (zeros 100)
            , [0,1,0,0,0,1] ++ (zeros 100)
            , [0,0,1,1,1,1] ++ (zeros 100)
            ] ++
            (List.repeat 2 (zeros 106))
        )
    ,   (   "The R-pentomino"
        ,   (List.repeat 25 (zeros 133)) ++
            [ (zeros 45) ++ [0,1,1] ++ (zeros 85)
            , (zeros 45) ++ [1,1,0] ++ (zeros 85)
            , (zeros 45) ++ [0,1,0] ++ (zeros 85)
            ] ++
            (List.repeat 45 (zeros 133))
        )
    ,   (   "Diehard"
        ,   (List.repeat 10 (zeros 30)) ++
            [ (zeros 10) ++ [0,0,0,0,0,0,0,1,0,0] ++ (zeros 10)
            , (zeros 10) ++ [0,1,1,0,0,0,0,0,0,0] ++ (zeros 10)
            , (zeros 10) ++ [0,0,1,0,0,0,1,1,1,0] ++ (zeros 10)
            ] ++
            (List.repeat 20 (zeros 30))
        )
    ,   (   "Acorn"
        ,   (List.repeat 40 (zeros 130)) ++
            [ (zeros 90) ++ [0,0,1,0,0,0,0,0,0] ++ (zeros 31)
            , (zeros 90) ++ [0,0,0,0,1,0,0,0,0] ++ (zeros 31)
            , (zeros 90) ++ [0,1,1,0,0,1,1,1,0] ++ (zeros 31)
            ] ++
            (List.repeat 50 (zeros 130))
        )
    ,   (   "Gosper glider gun"
        ,   [ (zeros 38)
            , (zeros 38)
            , (zeros 25) ++ [1] ++ (zeros 12)
            , (zeros 23) ++ [1,0,1] ++ (zeros 12)
            , (zeros 13) ++ [1,1,0,0,0,0,0,0,1,1] ++ (zeros 12) ++ [1,1,0]
            , (zeros 12) ++ [1,0,0,0,1] ++ (zeros 4) ++ [1,1] ++ (zeros 12) ++ [1,1,0]
            , [0,1,1] ++ (zeros 8) ++ [1,0,0,0,0,0,1,0,0,0,1,1] ++ (zeros 15)
            , [0,1,1] ++ (zeros 8) ++ [1,0,0,0,1,0,1,1,0,0,0,0,1,0,1] ++ (zeros 12)
            , (zeros 11) ++ [1,0,0,0,0,0,1,0,0,0,0,0,0,0,1] ++ (zeros 12)
            , (zeros 12) ++ [1,0,0,0,1] ++ (zeros 21)
            , (zeros 13) ++ [1,1] ++ (zeros 23)
            , (zeros 38)
            , (zeros 38)
            ]
        )
    ,   (   "Block-laying switch engine 1"
        ,   (List.repeat 40 (zeros 130)) ++
            [ (zeros 60) ++ [0,0,0,0,0,0,0,1,0,0] ++ (zeros 60)
            , (zeros 60) ++ [0,0,0,0,0,1,0,1,1,0] ++ (zeros 60)
            , (zeros 60) ++ [0,0,0,0,0,1,0,1,0,0] ++ (zeros 60)
            , (zeros 60) ++ [0,0,0,0,0,1,0,0,0,0] ++ (zeros 60)
            , (zeros 60) ++ [0,0,0,1,0,0,0,0,0,0] ++ (zeros 60)
            , (zeros 60) ++ [0,1,0,1,0,0,0,0,0,0] ++ (zeros 60)
            ] ++
            (List.repeat 40 (zeros 130))
        )
    ,   (   "Block-laying switch engine 2"
        ,   (List.repeat 60 (zeros 125)) ++
            [ (zeros 60) ++ [1,1,1,0,1] ++ (zeros 60)
            , (zeros 60) ++ [1,0,0,0,0] ++ (zeros 60)
            , (zeros 60) ++ [0,0,0,1,1] ++ (zeros 60)
            , (zeros 60) ++ [0,1,1,0,1] ++ (zeros 60)
            , (zeros 60) ++ [1,0,1,0,1] ++ (zeros 60)
            ] ++
            (List.repeat 20 (zeros 125))
        )
    ,   (   "Block-laying switch engine 3"
        ,   (List.repeat 40 (zeros 141)) ++
            [ (zeros 10) ++ 
              [0,1,1,1,1,1,1,1,1,0,1,1,1,1,1,0,0,0,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1,1,0,1,1,1,1,1,0] ++
              (zeros 90)
            ] ++
            (List.repeat 40 (zeros 141))
        )
    ]
