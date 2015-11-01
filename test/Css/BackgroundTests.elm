module Css.BackgroundTests where

import Spec exposing (..)
import Css.TestUtils exposing (it)

import Css.Internal.Property exposing (stringValue)

import Css.Background exposing (..)
import Css.Box exposing (..)
import Css.Color exposing (..)
import Css.Common exposing (..)
import Css.Size exposing (..)
import Css exposing (renderProperties)

-------------------------------------------------------------------------------

suite : Spec
suite = describe "Css.BackgroundTests"
  [ describe "backgroundPosition"
    [ it "should render placed positions properly"
      [ renderProperties [backgroundPosition (placed sideLeft sideTop)]
          `shouldEqual` "background-position:left top"
      , renderProperties [backgroundPosition (placed sideCenter sideMiddle)]
          `shouldEqual` "background-position:center center"
      ]
    , it "should render positioned positions properly"
      [ renderProperties [backgroundPosition (positioned (px 10) (px 20))]
          `shouldEqual` "background-position:10px 20px"
      , renderProperties [backgroundPosition (positioned (pct 20) (pct 30))]
          `shouldEqual` "background-position:20% 30%"
      , renderProperties [backgroundPosition (positioned (px 20) (pct 30))]
          `shouldEqual` "background-position:20px 30%"
      ]
    , it "should render generic positions properly"
      [ renderProperties [backgroundPosition initial]
          `shouldEqual` "background-position:initial"
      , renderProperties [backgroundPosition inherit]
          `shouldEqual` "background-position:inherit"
      , renderProperties [backgroundPosition (stringValue "foo" |> other)]
          `shouldEqual` "background-position:foo"
      -- Should not compile:
      -- , renderProperties [backgroundPosition all]
      --     `shouldEqual` "background-position:should not compile"
      -- , renderProperties [backgroundPosition auto]
      --     `shouldEqual` "background-position:should not compile"
      -- , renderProperties [backgroundPosition baseline]
      --     `shouldEqual` "background-position:should not compile"
      -- , renderProperties [backgroundPosition center]
      --     `shouldEqual` "background-position:should not compile"
      -- , renderProperties [backgroundPosition normal]
      --     `shouldEqual` "background-position:should not compile"
      -- , renderProperties [backgroundPosition none]
      --     `shouldEqual` "background-position:should not compile"      
      -- , renderProperties [backgroundPosition visible]
      --     `shouldEqual` "background-position:should not compile"
      -- , renderProperties [backgroundPosition hidden]
      --     `shouldEqual` "background-position:should not compile"
      -- , renderProperties [backgroundPosition unset]
      --     `shouldEqual` "background-position:should not compile"
      ]
    ]
  , describe "backgroundSize"
    [ it "should render named sizes properly"
      [ renderProperties [backgroundSize cover]
          `shouldEqual` "background-size:cover"
      , renderProperties [backgroundSize contain]
          `shouldEqual` "background-size:contain"
      ]
    , it "should render dimensioned sizes properly"
      [ renderProperties [backgroundSize ((px 20) `by` (px 30))]
          `shouldEqual` "background-size:20px 30px"
      , renderProperties [backgroundSize (20 |> px |> bgWidth)]
          `shouldEqual` "background-size:20px auto"
      ]
    , it "should render generic sizes properly" 
      [ renderProperties [backgroundSize initial]
          `shouldEqual` "background-size:initial"
      , renderProperties [backgroundSize inherit]
          `shouldEqual` "background-size:inherit"
      , renderProperties [backgroundSize auto]
          `shouldEqual` "background-size:auto"
      , renderProperties [backgroundSize (stringValue "foo" |> other)]
          `shouldEqual` "background-size:foo"
      -- Should not compile:
      -- , renderProperties [backgroundSize all]
      --     `shouldEqual` "background-size:should not compile"
      -- , renderProperties [backgroundSize baseline]
      --     `shouldEqual` "background-size:should not compile"
      -- , renderProperties [backgroundSize center]
      --     `shouldEqual` "background-size:should not compile"
      -- , renderProperties [backgroundSize normal]
      --     `shouldEqual` "background-size:should not compile"
      -- , renderProperties [backgroundSize none]
      --     `shouldEqual` "background-size:should not compile"      
      -- , renderProperties [backgroundSize visible]
      --     `shouldEqual` "background-size:should not compile"
      -- , renderProperties [backgroundSize hidden]
      --     `shouldEqual` "background-size:should not compile"
      -- , renderProperties [backgroundSize unset]
      --     `shouldEqual` "background-size:should not compile"
      ]    
    ]
  , describe "backgroundColor"
    [ it "should render colors properly"
      [ renderProperties [backgroundColor green]
          `shouldEqual` "background-color:#73D216"
      , renderProperties [backgroundColor (rgba 255 255 255 0.5)]
          `shouldEqual` "background-color:rgba(255,255,255,0.5)"
      ]
    , it "should render transparent properly"
      [ renderProperties [backgroundColor transparent]
          `shouldEqual` "background-color:transparent"
      ]
    , it "should render generic colors properly" 
      [ renderProperties [backgroundColor initial]
          `shouldEqual` "background-color:initial"
      , renderProperties [backgroundColor inherit]
          `shouldEqual` "background-color:inherit"
      , renderProperties [backgroundColor (stringValue "foo" |> other)]
          `shouldEqual` "background-color:foo"
      -- Should not compile:
      -- , renderProperties [backgroundColor all]
      --     `shouldEqual` "background-color:should not compile"
      -- , renderProperties [backgroundColor auto]
      --     `shouldEqual` "background-color:should not compile"
      -- , renderProperties [backgroundColor baseline]
      --     `shouldEqual` "background-color:should not compile"
      -- , renderProperties [backgroundColor center]
      --     `shouldEqual` "background-color:should not compile"
      -- , renderProperties [backgroundColor normal]
      --     `shouldEqual` "background-color:should not compile"
      -- , renderProperties [backgroundColor none]
      --     `shouldEqual` "background-color:should not compile"      
      -- , renderProperties [backgroundColor visible]
      --     `shouldEqual` "background-color:should not compile"
      -- , renderProperties [backgroundColor hidden]
      --     `shouldEqual` "background-color:should not compile"
      -- , renderProperties [backgroundColor unset]
      --     `shouldEqual` "background-color:should not compile"
      ]
    ]         
  , describe "backgroundImage"
    [ it "should render properly"
      [ renderProperties [backgroundImage (url "http://some.image.com/")]
          `shouldEqual` "background-image:url(\"http://some.image.com/\")"
      ]  
    , it "should render generic image properties properly" 
      [ renderProperties [backgroundImage initial]
          `shouldEqual` "background-image:initial"
      , renderProperties [backgroundImage inherit]
          `shouldEqual` "background-image:inherit"
      , renderProperties [backgroundImage none]
          `shouldEqual` "background-image:none"
      , renderProperties [backgroundImage (stringValue "foo" |> other)]
          `shouldEqual` "background-image:foo"
      -- Should not compile:
      -- , renderProperties [backgroundImage all]
      --     `shouldEqual` "background-image:should not compile"
      -- , renderProperties [backgroundImage auto]
      --     `shouldEqual` "background-image:should not compile"
      -- , renderProperties [backgroundImage baseline]
      --     `shouldEqual` "background-image:should not compile"
      -- , renderProperties [backgroundImage center]
      --     `shouldEqual` "background-image:should not compile"
      -- , renderProperties [backgroundImage normal]
      --     `shouldEqual` "background-image:should not compile"
      -- , renderProperties [backgroundImage visible]
      --     `shouldEqual` "background-image:should not compile"
      -- , renderProperties [backgroundImage hidden]
      --     `shouldEqual` "background-image:should not compile"
      -- , renderProperties [backgroundImage unset]
      --     `shouldEqual` "background-image:should not compile"
      ]
    ]
  , describe "backgroundRepeat"
    [ it "should render properly"
      [ renderProperties [backgroundRepeat repeat]
          `shouldEqual` "background-repeat:repeat"
      , renderProperties [backgroundRepeat space]
          `shouldEqual` "background-repeat:space"
      , renderProperties [backgroundRepeat roundRepeat]
          `shouldEqual` "background-repeat:round"
      , renderProperties [backgroundRepeat noRepeat]
          `shouldEqual` "background-repeat:no-repeat"
      , renderProperties [backgroundRepeat repeatX]
          `shouldEqual` "background-repeat:repeat-x"
      , renderProperties [backgroundRepeat repeatY]
          `shouldEqual` "background-repeat:repeat-y"
      ]  
    , it "should render generic repeat properties properly" 
      [ renderProperties [backgroundRepeat initial]
          `shouldEqual` "background-repeat:initial"
      , renderProperties [backgroundRepeat inherit]
          `shouldEqual` "background-repeat:inherit"
      , renderProperties [backgroundRepeat (stringValue "foo" |> other)]
          `shouldEqual` "background-repeat:foo"
      -- Should not compile:
      -- , renderProperties [backgroundRepeat all]
      --     `shouldEqual` "background-repeat:should not compile"
      -- , renderProperties [backgroundRepeat auto]
      --     `shouldEqual` "background-repeat:should not compile"
      -- , renderProperties [backgroundRepeat baseline]
      --     `shouldEqual` "background-repeat:should not compile"
      -- , renderProperties [backgroundRepeat center]
      --     `shouldEqual` "background-repeat:should not compile"
      -- , renderProperties [backgroundRepeat normal]
      --     `shouldEqual` "background-repeat:should not compile"
      -- , renderProperties [backgroundRepeat none]
      --     `shouldEqual` "background-repeat:should not compile"
      -- , renderProperties [backgroundRepeat visible]
      --     `shouldEqual` "background-repeat:should not compile"
      -- , renderProperties [backgroundRepeat hidden]
      --     `shouldEqual` "background-repeat:should not compile"
      -- , renderProperties [backgroundRepeat unset]
      --     `shouldEqual` "background-repeat:should not compile"
      ]
    ]
  , describe "backgroundOrigin"
    [ it "should render properly"
      [ renderProperties [backgroundOrigin (origin paddingBox)]
          `shouldEqual` "background-origin:padding-box"
      , renderProperties [backgroundOrigin (origin borderBox)]
          `shouldEqual` "background-origin:border-box"
      , renderProperties [backgroundOrigin (origin contentBox)]
          `shouldEqual` "background-origin:content-box"
      ]  
    , it "should render generic origin properties properly" 
      [ renderProperties [backgroundOrigin initial]
          `shouldEqual` "background-origin:initial"
      , renderProperties [backgroundOrigin inherit]
          `shouldEqual` "background-origin:inherit"
      , renderProperties [backgroundOrigin (stringValue "foo" |> other)]
          `shouldEqual` "background-origin:foo"
      -- Should not compile:
      -- , renderProperties [backgroundOrigin all]
      --     `shouldEqual` "background-origin:should not compile"
      -- , renderProperties [backgroundOrigin auto]
      --     `shouldEqual` "background-origin:should not compile"
      -- , renderProperties [backgroundOrigin baseline]
      --     `shouldEqual` "background-origin:should not compile"
      -- , renderProperties [backgroundOrigin center]
      --     `shouldEqual` "background-origin:should not compile"
      -- , renderProperties [backgroundOrigin normal]
      --     `shouldEqual` "background-origin:should not compile"
      -- , renderProperties [backgroundOrigin none]
      --     `shouldEqual` "background-origin:should not compile"
      -- , renderProperties [backgroundOrigin visible]
      --     `shouldEqual` "background-origin:should not compile"
      -- , renderProperties [backgroundOrigin hidden]
      --     `shouldEqual` "background-origin:should not compile"
      -- , renderProperties [backgroundOrigin unset]
      --     `shouldEqual` "background-origin:should not compile"
      ]
    ]

  ]
