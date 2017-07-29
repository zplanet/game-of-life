module Logic exposing (..)

import Common exposing (..)

calcScene : Scene -> Scene
calcScene (name, grid) =
    let
        getValue x y = 
            if x < 0 || y < 0 then 
                Nothing 
            else 
                grid |> List.drop y |> List.head |> Maybe.andThen (\row -> row |> List.drop x |> List.head)
        multiply xs ys = xs |> List.concatMap (\x -> ys |> List.map (\y -> (x, y)))
        getSum x y = (multiply [(x-1), x, (x+1)] [(y-1), y, (y+1)]) |> List.map (\(a, b) -> Maybe.withDefault 0 (getValue a b)) |> List.sum
    in
        (
            name,
            grid
            |> List.indexedMap (\ridx -> \row ->
                row
                |> List.indexedMap (\cidx -> \cell ->
                    let
                        sum = getSum cidx ridx
                    in
                        if 0 == cell then
                            if 3 == sum then 1 else 0
                        else
                            if sum < 3 || 4 < sum then 0 else 1
                )
            )
        )

findScene : String -> List Scene -> Scene
findScene name scenes = 
    case scenes of
        []      -> sceneBlinker
        (s::ss) -> if name == (Tuple.first s) then s else findScene name ss