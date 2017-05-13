module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

type alias Model =
    {}

type alias Recipe =
    { name : String
    , prepTime : Int
    , cookTime : Int
    , servingsYielded : Int
    }

type alias User =
    { name : String
    , email : String
    }

-- MODEL

initialModel : Model
initialModel =
    {}


-- VIEW

view : Model -> Html msg
view model =
    div [ class "container" ]
        [ viewNewUserForm
        , viewRecipeForm
        ]


viewNewUserForm : Html msg
viewNewUserForm =
    div []
        [ h1 []
             [ text "Sign up" ]
        , Html.form [ id "new-user-form" ]
                    [ viewTextInput "name"
                    , viewTextInput "email"
                    , viewPasswordInput "password"
                    , viewPasswordInput "password confirmation"
                    , button [ class "btn btn-default" ]
                             [ text "Submit" ]
                    ]
        ]


viewRecipeForm : Html msg
viewRecipeForm =
    div []
        [ h1 []
             [ text "New Recipe" ]
        , Html.form [ id "recipe-form" ]
                    [ viewTextInput "name"
                    , viewTextInput "prep time"
                    , viewTextInput "cook time"
                    , viewTextInput "servings yielded"
                    , button [ class "btn btn-default" ]
                             [ text "Submit" ]
                    ]
        ]


toId : String -> String
toId fieldName =
    fieldName
        |> String.toLower
        |> String.words
        |> String.join "-"


labelText : String -> String
labelText name =
    capitalize name ++ ": "


viewPasswordInput : String -> Html msg
viewPasswordInput fieldName =
    let
        fieldId =
            toId fieldName
    in
        div [ class "form-group" ]
            [ label [ for fieldId ]
                    [ text (labelText fieldName) ]
            , input [ type_ "password", class "form-control", id fieldId ]
                    [ text "" ]
            ]


viewTextInput : String -> Html msg
viewTextInput fieldName =
    let
        fieldId =
            toId fieldName

    in
        div [ class "form-group" ]
            [ label [ for fieldId ]
                    [ text (labelText fieldName) ]
            , input [ type_ "text", class "form-control", id fieldId ]
                    [ text "" ]
            ]


capitalize : String -> String
capitalize str =
    case String.uncons str of
        Just (first, rest) ->
            String.toUpper (String.fromChar first) ++ rest

        Nothing ->
            ""

-- UPDATE

update : msg -> Model -> Model
update msg model =
    model


-- MAIN

main : Program Never Model msg
main =
  Html.beginnerProgram
    { model = initialModel
    , view = view
    , update = update
    }
