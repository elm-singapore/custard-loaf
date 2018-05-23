module Route
    exposing
        ( Route(..)
        , fromLocation
        , modifyUrl
        , newUrl
        , toUrl
        )

import Navigation exposing (Location)
import UrlParser as Url exposing ((</>))


type Route
    = Home
    | Pwa
    | Query
    | Map


toUrl : Route -> String
toUrl route =
    let
        pieces =
            case route of
                Home ->
                    []

                Pwa ->
                    [ "pwa" ]

                Query ->
                    [ "query" ]

                Map ->
                    [ "map" ]
    in
    ("#" :: pieces)
        |> String.join "/"


fromLocation : Location -> Maybe Route
fromLocation location =
    if String.isEmpty location.hash then
        Just Home

    else
        Url.parseHash route location


route : Url.Parser (Route -> a) a
route =
    Url.oneOf
        [ Url.map Home (Url.s "")
        , Url.map Pwa (Url.s "pwa")
        , Url.map Query (Url.s "query")
        , Url.map Map (Url.s "map")
        ]


modifyUrl : Route -> Cmd msg
modifyUrl =
    toUrl >> Navigation.modifyUrl


newUrl : Route -> Cmd msg
newUrl =
    toUrl >> Navigation.newUrl
