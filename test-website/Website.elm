module Website where

import Color exposing (..)
import Graphics.Element exposing (..)
import Text
import List exposing (..)
import Maybe exposing (withDefault)

counter n =
    let counter' n acc =
        if n < 0
            then acc
            else counter' (n-1) (n :: acc)
    in
        counter' n []

navtitles n =
    let navs = [ "home", "blog", "about" ]
    in
        drop (n % (length navs)) navs |> head |> withDefault "home"

makeText str =
    Text.fromString str
        |> Text.color blue
        |> Text.bold
        |> Text.height 60
        |> centered
        |> link "test"

makeNavElements listText =
     intersperse (spacer 5 5) listText

makeWebsite navList =
    flow right <| navList

main : Element
main = makeWebsite <| makeNavElements <| map makeText (map navtitles (counter 2))
