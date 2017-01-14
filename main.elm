module Main exposing (..)

import Html exposing ( Html, button, text, h1, div )
import Html.Events exposing (onClick)
import List exposing ( .. )

main =
  Html.beginnerProgram { model = model, view = view, update = update }

-- MODEL
type alias Model = { fibNumbers : List Int }

model : Model
model =
  { fibNumbers = [1,1]}


-- UPDATE
type Msg = AddFib

update : Msg -> Model -> Model
update msg model = 
  case msg of
    AddFib -> 
      let 
        reversed = reverse model.fibNumbers
        sumEnd = sum (take 2 reversed)
        newFibNumbers = append model.fibNumbers [sumEnd]
      in { model | fibNumbers = newFibNumbers }


-- VIEW
view: Model -> Html Msg
view model =
  div []
    [ button [ onClick AddFib ] [ text "+" ]
    , text (toString model.fibNumbers)
    ]