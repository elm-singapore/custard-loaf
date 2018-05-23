module View.Navigation exposing (view)

import Html exposing (Html, a, li, nav, text, ul)
import Html.Attributes exposing (href)
import Route


view : Html msg
view =
    let
        link route title =
            li [] [ a [ href <| Route.toUrl route ] [ text title ] ]
    in
    nav []
        [ ul []
            [ link Route.Home "Home"
            , link Route.Pwa "Pwa"
            , link Route.Query "Query"
            , link Route.Map "Map"
            ]
        ]
