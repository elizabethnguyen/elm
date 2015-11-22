module FibonacciBars where

import Color exposing (blue, brown, green, orange, purple, red, yellow)
import Fibonacci exposing (fibonacci, fibonacciWithIndexes)
import Graphics.Collage exposing (collage, filled, rect)
import Graphics.Element exposing (down, flow, right, show, up)
import List exposing (drop, head, length, map)
import Maybe exposing (withDefault)

color n =
    let colors = [ red, orange, yellow, green, blue, purple, brown ]
    in
        drop (n % (length colors)) colors |> head |> withDefault red

bar (index, n) =
    flow up [
        collage 20 (n*20) [ filled (color index) (rect 20 (toFloat n * 20)) ],
        show n
    ]

main = flow right <| map bar (fibonacciWithIndexes 10)
