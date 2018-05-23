module Main exposing (main)

import Html exposing (Html, div, text)
import Json.Encode as Encode exposing (Value)
import Navigation exposing (Location)
import Page.Home
import Page.Map
import Page.Pwa
import Page.Query
import Route exposing (Route)
import View.Navigation



---- PROGRAM ----


main : Program Value Model Msg
main =
    Navigation.programWithFlags (Route.fromLocation >> SetRoute)
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }



---- MODEL ----


type alias Model =
    { page : Page
    }


type Page
    = Home
    | Pwa
    | Query
    | Map
    | Error


init : Value -> Location -> ( Model, Cmd Msg )
init val location =
    setRoute (Route.fromLocation location)
        { page = Home
        }



---- UPDATE ----


type Msg
    = SetRoute (Maybe Route)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetRoute maybeRoute ->
            setRoute maybeRoute model


setRoute : Maybe Route -> Model -> ( Model, Cmd Msg )
setRoute maybeRoute model =
    case maybeRoute of
        Nothing ->
            ( { model | page = Error }, Cmd.none )

        Just Route.Home ->
            ( { model | page = Home }, Cmd.none )

        Just Route.Pwa ->
            ( { model | page = Pwa }, Cmd.none )

        Just Route.Query ->
            ( { model | page = Query }, Cmd.none )

        Just Route.Map ->
            ( { model | page = Map }, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    -- div []
    --     [ img [ src "/logo.png" ] []
    --     , h1 [] [ text "Elm Singapore App" ]
    --     , p [] [ text <| toString model ]
    --     , button [ onClick Decrement ] [ text "Decrement" ]
    --     , button [ onClick Increment ] [ text "Increment" ]
    --     ]
    case model.page of
        Home ->
            withNavigation Page.Home.view

        Pwa ->
            withNavigation Page.Pwa.view

        Query ->
            withNavigation Page.Query.view

        Map ->
            withNavigation Page.Map.view

        Error ->
            div [] [ text "Oups something went wrong" ]


withNavigation : Html Msg -> Html Msg
withNavigation content =
    div []
        [ View.Navigation.view
        , content
        ]
