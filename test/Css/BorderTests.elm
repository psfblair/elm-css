module Css.BorderTests where

import Spec exposing (..)
import Css.TestUtils exposing (it)

import Css.Border exposing (..)
import Css.Color exposing (..)
import Css.Common exposing (..)
import Css.Display exposing (collapse)
import Css.Geometry exposing (..)
import Css exposing (renderProperties)

-------------------------------------------------------------------------------

suite : Spec
suite = describe "Css.BorderTests"
  [ describe "The border function"
    [ it "should render a composite border property correctly"
      [ renderProperties [ border (aBorderWith solid (px 20) green) ]
          `shouldEqual` "border:solid 20px #73D216"
      , renderProperties [ border (aBorderWith dotted abs0 transparent) ]
          `shouldEqual` "border:dotted 0 transparent"
      , renderProperties [ border (aBorderWith dotted abs0 transparent) ]
          `shouldEqual` "border:dotted 0 transparent"
      -- , renderProperties [ border (aBorderWith solid (pct 20) green) ] 
      --     `shouldEqual` "border:should not compile"
      -- , renderProperties [ border (aBorderWith inherit (px 20) green) ]
      --     `shouldEqual` "border:should not compile"
      -- , renderProperties [ border (aBorderWith solid inherit green) ]
      --     `shouldEqual` "border:should not compile"
      -- , renderProperties [ border (aBorderWith solid (px 20) inherit) ]
      --     `shouldEqual` "border:should not compile"
      ]
    , it "should render generic properties properly"
      [ renderProperties [ border initial ] `shouldEqual` "border:initial"
      , renderProperties [ border inherit ] `shouldEqual` "border:inherit"
      , renderProperties [ border unset ] `shouldEqual` "border:unset"
      , renderProperties [ border (other "foo") ] 
          `shouldEqual` "border:foo"
      , renderProperties [ border (otherPrefixed [webkit_, moz_] "foo") ] 
          `shouldEqual` "border:-webkit-foo;border:-moz-foo"
      -- , renderProperties [ border all ]
      --     `shouldEqual` "border:should not compile"
      -- , renderProperties [ border auto ]
      --     `shouldEqual` "border:should not compile"
      -- , renderProperties [ border baseline ]
      --     `shouldEqual` "border:should not compile"
      -- , renderProperties [ border center ]
      --     `shouldEqual` "border:should not compile"
      -- , renderProperties [ border normal ]
      --     `shouldEqual` "border:should not compile"
      -- , renderProperties [ border none ]
      --     `shouldEqual` "border:should not compile"
      -- , renderProperties [ border visible ]
      --     `shouldEqual` "border:should not compile"
      -- , renderProperties [ border hidden ]
      --     `shouldEqual` "border:should not compile"
      ]
    ]
  , describe "The borderTop function"
    [ it "should render a composite border property correctly"
      [ renderProperties [ borderTop (aBorderWith solid (px 20) green) ]
          `shouldEqual` "border-top:solid 20px #73D216"
      , renderProperties [ borderTop (aBorderWith dotted abs0 transparent) ]
          `shouldEqual` "border-top:dotted 0 transparent"
      , renderProperties [ borderTop (aBorderWith dotted abs0 transparent) ]
          `shouldEqual` "border-top:dotted 0 transparent"
      -- , renderProperties [ borderTop (aBorderWith solid (pct 20) green) ] 
      --     `shouldEqual` "border-top:should not compile"
      -- , renderProperties [ borderTop (aBorderWith inherit (px 20) green) ]
      --     `shouldEqual` "border-top:should not compile"
      -- , renderProperties [ borderTop (aBorderWith solid inherit green) ]
      --     `shouldEqual` "border-top:should not compile"
      -- , renderProperties [ borderTop (aBorderWith solid (px 20) inherit) ]
      --     `shouldEqual` "border-top:should not compile"
      ]
    , it "should render generic properties properly"
      [ renderProperties [ borderTop initial ] `shouldEqual` "border-top:initial"
      , renderProperties [ borderTop inherit ] `shouldEqual` "border-top:inherit"
      , renderProperties [ borderTop unset ] `shouldEqual` "border-top:unset"
      , renderProperties [ borderTop (other "foo") ] 
          `shouldEqual` "border-top:foo"
      , renderProperties [ borderTop (otherPrefixed [webkit_, moz_] "foo") ] 
          `shouldEqual` "border-top:-webkit-foo;border-top:-moz-foo"
      -- , renderProperties [ borderTop all ]
      --     `shouldEqual` "border-top:should not compile"
      -- , renderProperties [ borderTop auto ]
      --     `shouldEqual` "border-top:should not compile"
      -- , renderProperties [ borderTop baseline ]
      --     `shouldEqual` "border-top:should not compile"
      -- , renderProperties [ borderTop center ]
      --     `shouldEqual` "border-top:should not compile"
      -- , renderProperties [ borderTop normal ]
      --     `shouldEqual` "border-top:should not compile"
      -- , renderProperties [ borderTop none ]
      --     `shouldEqual` "border-top:should not compile"
      -- , renderProperties [ borderTop visible ]
      --     `shouldEqual` "border-top:should not compile"
      -- , renderProperties [ borderTop hidden ]
      --     `shouldEqual` "border-top:should not compile"
      ]
    ]
  , describe "The borderBottom function"
    [ it "should render a composite border property correctly"
      [ renderProperties [ borderBottom (aBorderWith solid (px 20) green) ]
          `shouldEqual` "border-bottom:solid 20px #73D216"
      , renderProperties [ borderBottom (aBorderWith dotted abs0 transparent) ]
          `shouldEqual` "border-bottom:dotted 0 transparent"
      , renderProperties [ borderBottom (aBorderWith dotted abs0 transparent) ]
          `shouldEqual` "border-bottom:dotted 0 transparent"
      -- , renderProperties [ borderBottom (aBorderWith solid (pct 20) green) ] 
      --     `shouldEqual` "border-bottom:should not compile"
      -- , renderProperties [ borderBottom (aBorderWith inherit (px 20) green) ]
      --     `shouldEqual` "border-bottom:should not compile"
      -- , renderProperties [ borderBottom (aBorderWith solid inherit green) ]
      --     `shouldEqual` "border-bottom:should not compile"
      -- , renderProperties [ borderBottom (aBorderWith solid (px 20) inherit) ]
      --     `shouldEqual` "border-bottom:should not compile"
      ]
    , it "should render generic properties properly"
      [ renderProperties [ borderBottom initial ] 
          `shouldEqual` "border-bottom:initial"
      , renderProperties [ borderBottom inherit ] 
          `shouldEqual` "border-bottom:inherit"
      , renderProperties [ borderBottom unset ] 
          `shouldEqual` "border-bottom:unset"
      , renderProperties [ borderBottom (other "foo") ] 
          `shouldEqual` "border-bottom:foo"
      , renderProperties [ borderBottom (otherPrefixed [webkit_, moz_] "foo") ] 
          `shouldEqual` "border-bottom:-webkit-foo;border-bottom:-moz-foo"
      -- , renderProperties [ borderBottom all ]
      --     `shouldEqual` "border-bottom:should not compile"
      -- , renderProperties [ borderBottom auto ]
      --     `shouldEqual` "border-bottom:should not compile"
      -- , renderProperties [ borderBottom baseline ]
      --     `shouldEqual` "border-bottom:should not compile"
      -- , renderProperties [ borderBottom center ]
      --     `shouldEqual` "border-bottom:should not compile"
      -- , renderProperties [ borderBottom normal ]
      --     `shouldEqual` "border-bottom:should not compile"
      -- , renderProperties [ borderBottom none ]
      --     `shouldEqual` "border-bottom:should not compile"
      -- , renderProperties [ borderBottom visible ]
      --     `shouldEqual` "border-bottom:should not compile"
      -- , renderProperties [ borderBottom hidden ]
      --     `shouldEqual` "border-bottom:should not compile"
      ]
    ]
  , describe "The borderLeft function"
    [ it "should render a composite border property correctly"
      [ renderProperties [ borderLeft (aBorderWith solid (px 20) green) ]
          `shouldEqual` "border-left:solid 20px #73D216"
      , renderProperties [ borderLeft (aBorderWith dotted abs0 transparent) ]
          `shouldEqual` "border-left:dotted 0 transparent"
      , renderProperties [ borderLeft (aBorderWith dotted abs0 transparent) ]
          `shouldEqual` "border-left:dotted 0 transparent"
      -- , renderProperties [ borderLeft solid (pct 20) green ] 
      --     `shouldEqual` "border-left:should not compile"
      -- , renderProperties [ borderLeft (aBorderWith inherit (px 20) green) ]
      --     `shouldEqual` "border-left:should not compile"
      -- , renderProperties [ borderLeft (aBorderWith solid inherit green) ]
      --     `shouldEqual` "border-left:should not compile"
      -- , renderProperties [ borderLeft (aBorderWith solid (px 20) inherit) ]
      --     `shouldEqual` "border-left:should not compile"
      ]
    , it "should render generic properties properly"
      [ renderProperties [ borderLeft initial ] 
          `shouldEqual` "border-left:initial"
      , renderProperties [ borderLeft inherit ] 
          `shouldEqual` "border-left:inherit"
      , renderProperties [ borderLeft unset ] 
          `shouldEqual` "border-left:unset"
      , renderProperties [ borderLeft (other "foo") ] 
          `shouldEqual` "border-left:foo"
      , renderProperties [ borderLeft (otherPrefixed [webkit_, moz_] "foo") ] 
          `shouldEqual` "border-left:-webkit-foo;border-left:-moz-foo"
      -- , renderProperties [ borderLeft all ]
      --     `shouldEqual` "border-left:should not compile"
      -- , renderProperties [ borderLeft auto ]
      --     `shouldEqual` "border-left:should not compile"
      -- , renderProperties [ borderLeft baseline ]
      --     `shouldEqual` "border-left:should not compile"
      -- , renderProperties [ borderLeft center ]
      --     `shouldEqual` "border-left:should not compile"
      -- , renderProperties [ borderLeft normal ]
      --     `shouldEqual` "border-left:should not compile"
      -- , renderProperties [ borderLeft none ]
      --     `shouldEqual` "border-left:should not compile"
      -- , renderProperties [ borderLeft visible ]
      --     `shouldEqual` "border-left:should not compile"
      -- , renderProperties [ borderLeft hidden ]
      --     `shouldEqual` "border-left:should not compile"
      ]
    ]
  , describe "The borderRight function"
    [ it "should render a composite border property correctly"
      [ renderProperties [ borderRight (aBorderWith solid (px 20) green) ]
          `shouldEqual` "border-right:solid 20px #73D216"
      , renderProperties [ borderRight (aBorderWith dotted abs0 transparent) ]
          `shouldEqual` "border-right:dotted 0 transparent"
      , renderProperties [ borderRight (aBorderWith dotted abs0 transparent) ]
          `shouldEqual` "border-right:dotted 0 transparent"
      -- , renderProperties [ borderRight solid (pct 20) green ] 
      --     `shouldEqual` "border-right:should not compile"
      -- , renderProperties [ borderRight (aBorderWith inherit (px 20) green) ]
      --     `shouldEqual` "border-right:should not compile"
      -- , renderProperties [ borderRight (aBorderWith solid inherit green) ]
      --     `shouldEqual` "border-right:should not compile"
      -- , renderProperties [ borderRight (aBorderWith solid (px 20) inherit) ]
      --     `shouldEqual` "border-right:should not compile"
      ]
    , it "should render generic properties properly"
      [ renderProperties [ borderRight initial ] 
          `shouldEqual` "border-right:initial"
      , renderProperties [ borderRight inherit ] 
          `shouldEqual` "border-right:inherit"
      , renderProperties [ borderRight unset ] 
          `shouldEqual` "border-right:unset"
      , renderProperties [ borderRight (other "foo") ] 
          `shouldEqual` "border-right:foo"
      , renderProperties [ borderRight (otherPrefixed [webkit_, moz_] "foo") ] 
          `shouldEqual` "border-right:-webkit-foo;border-right:-moz-foo"
      -- , renderProperties [ borderRight all ]
      --     `shouldEqual` "border-right:should not compile"
      -- , renderProperties [ borderRight auto ]
      --     `shouldEqual` "border-right:should not compile"
      -- , renderProperties [ borderRight baseline ]
      --     `shouldEqual` "border-right:should not compile"
      -- , renderProperties [ borderRight center ]
      --     `shouldEqual` "border-right:should not compile"
      -- , renderProperties [ borderRight normal ]
      --     `shouldEqual` "border-right:should not compile"
      -- , renderProperties [ borderRight none ]
      --     `shouldEqual` "border-right:should not compile"
      -- , renderProperties [ borderRight visible ]
      --     `shouldEqual` "border-right:should not compile"
      -- , renderProperties [ borderRight hidden ]
      --     `shouldEqual` "border-right:should not compile"
      ]
    ]
  , describe "the borderColor function" 
    [ it "should render the border color properties properly"
      [ renderProperties [borderColor green]
          `shouldEqual` "border-color:#73D216"
      , renderProperties [borderColor transparent]
          `shouldEqual` "border-color:transparent"
      ]
    , it "should render generic properties properly"
      [ renderProperties [ borderColor initial ] 
          `shouldEqual` "border-color:initial"
      , renderProperties [ borderColor inherit ] 
          `shouldEqual` "border-color:inherit"
      , renderProperties [ borderColor unset ] 
          `shouldEqual` "border-color:unset"
      , renderProperties [ borderColor (other "foo") ] 
          `shouldEqual` "border-color:foo"
      , renderProperties [ borderColor (otherPrefixed [webkit_, moz_] "foo") ] 
          `shouldEqual` "border-color:-webkit-foo;border-color:-moz-foo"
      -- , renderProperties [ borderColor all ]
      --     `shouldEqual` "border-color:should not compile"
      -- , renderProperties [ borderColor auto ]
      --     `shouldEqual` "border-color:should not compile"
      -- , renderProperties [ borderColor baseline ]
      --     `shouldEqual` "border-color:should not compile"
      -- , renderProperties [ borderColor center ]
      --     `shouldEqual` "border-color:should not compile"
      -- , renderProperties [ borderColor normal ]
      --     `shouldEqual` "border-color:should not compile"
      -- , renderProperties [ borderColor none ]
      --     `shouldEqual` "border-color:should not compile"
      -- , renderProperties [ borderColor visible ]
      --     `shouldEqual` "border-color:should not compile"
      -- , renderProperties [ borderColor hidden ]
      --     `shouldEqual` "border-color:should not compile"
      ]
    ]
  , describe "the borderLeftColor function" 
    [ it "should render the border color properties properly"
      [ renderProperties [borderLeftColor green]
          `shouldEqual` "border-left-color:#73D216"
      , renderProperties [borderLeftColor transparent]
          `shouldEqual` "border-left-color:transparent"
      ]
    , it "should render generic properties properly"
      [ renderProperties [ borderLeftColor initial ] 
          `shouldEqual` "border-left-color:initial"
      , renderProperties [ borderLeftColor inherit ] 
          `shouldEqual` "border-left-color:inherit"
      , renderProperties [ borderLeftColor unset ] 
          `shouldEqual` "border-left-color:unset"
      , renderProperties [ borderLeftColor (other "foo") ] 
          `shouldEqual` "border-left-color:foo"
      , renderProperties [ borderLeftColor (otherPrefixed [webkit_, moz_] "foo") ] 
          `shouldEqual` "border-left-color:-webkit-foo;border-left-color:-moz-foo"
      -- , renderProperties [ borderLeftColor all ]
      --     `shouldEqual` "border-left-color:should not compile"
      -- , renderProperties [ borderLeftColor auto ]
      --     `shouldEqual` "border-left-color:should not compile"
      -- , renderProperties [ borderLeftColor baseline ]
      --     `shouldEqual` "border-left-color:should not compile"
      -- , renderProperties [ borderLeftColor center ]
      --     `shouldEqual` "border-left-color:should not compile"
      -- , renderProperties [ borderLeftColor normal ]
      --     `shouldEqual` "border-left-color:should not compile"
      -- , renderProperties [ borderLeftColor none ]
      --     `shouldEqual` "border-left-color:should not compile"
      -- , renderProperties [ borderLeftColor visible ]
      --     `shouldEqual` "border-left-color:should not compile"
      -- , renderProperties [ borderLeftColor hidden ]
      --     `shouldEqual` "border-left-color:should not compile"
      ]
    ]    
  , describe "the borderRightColor function" 
    [ it "should render the border color properties properly"
      [ renderProperties [borderRightColor green]
          `shouldEqual` "border-right-color:#73D216"
      , renderProperties [borderRightColor transparent]
          `shouldEqual` "border-right-color:transparent"
      ]
    , it "should render generic properties properly"
      [ renderProperties [ borderRightColor initial ] 
          `shouldEqual` "border-right-color:initial"
      , renderProperties [ borderRightColor inherit ] 
          `shouldEqual` "border-right-color:inherit"
      , renderProperties [ borderRightColor unset ] 
          `shouldEqual` "border-right-color:unset"
      , renderProperties [ borderRightColor (other "foo") ] 
          `shouldEqual` "border-right-color:foo"
      , renderProperties [ borderRightColor (otherPrefixed [webkit_, moz_] "foo") ] 
          `shouldEqual` "border-right-color:-webkit-foo;border-right-color:-moz-foo"
      -- , renderProperties [ borderRightColor all ]
      --     `shouldEqual` "border-right-color:should not compile"
      -- , renderProperties [ borderRightColor auto ]
      --     `shouldEqual` "border-right-color:should not compile"
      -- , renderProperties [ borderRightColor baseline ]
      --     `shouldEqual` "border-right-color:should not compile"
      -- , renderProperties [ borderRightColor center ]
      --     `shouldEqual` "border-right-color:should not compile"
      -- , renderProperties [ borderRightColor normal ]
      --     `shouldEqual` "border-right-color:should not compile"
      -- , renderProperties [ borderRightColor none ]
      --     `shouldEqual` "border-right-color:should not compile"
      -- , renderProperties [ borderRightColor visible ]
      --     `shouldEqual` "border-right-color:should not compile"
      -- , renderProperties [ borderRightColor hidden ]
      --     `shouldEqual` "border-right-color:should not compile"
      ]
    ]    
  , describe "the borderTopColor function" 
    [ it "should render the border color properties properly"
      [ renderProperties [borderTopColor green]
          `shouldEqual` "border-top-color:#73D216"
      , renderProperties [borderTopColor transparent]
          `shouldEqual` "border-top-color:transparent"
      ]
    , it "should render generic properties properly"
      [ renderProperties [ borderTopColor initial ] 
          `shouldEqual` "border-top-color:initial"
      , renderProperties [ borderTopColor inherit ] 
          `shouldEqual` "border-top-color:inherit"
      , renderProperties [ borderTopColor unset ] 
          `shouldEqual` "border-top-color:unset"
      , renderProperties [ borderTopColor (other "foo") ] 
          `shouldEqual` "border-top-color:foo"
      , renderProperties [ borderTopColor (otherPrefixed [webkit_, moz_] "foo") ] 
          `shouldEqual` "border-top-color:-webkit-foo;border-top-color:-moz-foo"
      -- , renderProperties [ borderTopColor all ]
      --     `shouldEqual` "border-top-color:should not compile"
      -- , renderProperties [ borderTopColor auto ]
      --     `shouldEqual` "border-top-color:should not compile"
      -- , renderProperties [ borderTopColor baseline ]
      --     `shouldEqual` "border-top-color:should not compile"
      -- , renderProperties [ borderTopColor center ]
      --     `shouldEqual` "border-top-color:should not compile"
      -- , renderProperties [ borderTopColor normal ]
      --     `shouldEqual` "border-top-color:should not compile"
      -- , renderProperties [ borderTopColor none ]
      --     `shouldEqual` "border-top-color:should not compile"
      -- , renderProperties [ borderTopColor visible ]
      --     `shouldEqual` "border-top-color:should not compile"
      -- , renderProperties [ borderTopColor hidden ]
      --     `shouldEqual` "border-top-color:should not compile"
      ]
    ]    
  , describe "the borderBottomColor function" 
    [ it "should render the border color properties properly"
      [ renderProperties [borderBottomColor green]
          `shouldEqual` "border-bottom-color:#73D216"
      , renderProperties [borderBottomColor transparent]
          `shouldEqual` "border-bottom-color:transparent"
      ]
    , it "should render generic properties properly"
      [ renderProperties [ borderBottomColor initial ] 
          `shouldEqual` "border-bottom-color:initial"
      , renderProperties [ borderBottomColor inherit ] 
          `shouldEqual` "border-bottom-color:inherit"
      , renderProperties [ borderBottomColor unset ] 
          `shouldEqual` "border-bottom-color:unset"
      , renderProperties [ borderBottomColor (other "foo") ] 
          `shouldEqual` "border-bottom-color:foo"
      , renderProperties [ borderBottomColor (otherPrefixed [webkit_, moz_] "foo") ] 
          `shouldEqual` "border-bottom-color:-webkit-foo;border-bottom-color:-moz-foo"
      -- , renderProperties [ borderBottomColor all ]
      --     `shouldEqual` "border-bottom-color:should not compile"
      -- , renderProperties [ borderBottomColor auto ]
      --     `shouldEqual` "border-bottom-color:should not compile"
      -- , renderProperties [ borderBottomColor baseline ]
      --     `shouldEqual` "border-bottom-color:should not compile"
      -- , renderProperties [ borderBottomColor center ]
      --     `shouldEqual` "border-bottom-color:should not compile"
      -- , renderProperties [ borderBottomColor normal ]
      --     `shouldEqual` "border-bottom-color:should not compile"
      -- , renderProperties [ borderBottomColor none ]
      --     `shouldEqual` "border-bottom-color:should not compile"
      -- , renderProperties [ borderBottomColor visible ]
      --     `shouldEqual` "border-bottom-color:should not compile"
      -- , renderProperties [ borderBottomColor hidden ]
      --     `shouldEqual` "border-bottom-color:should not compile"
      ]
    ]    
  , describe "the borderColor4 function" 
    [ it "should render the border color properties properly"
      [ renderProperties [ borderColor4 green black blue white ]
          `shouldEqual` ("border-color:#73D216 #000000 #3465A4 #FFFFFF")
      , renderProperties [ borderColor4 transparent black blue white ]
          `shouldEqual` ("border-color:transparent #000000 #3465A4 #FFFFFF")
      ]
    , it "should not accept generic properties"
      [
        -- renderProperties [ borderColor4 initial black blue white ] 
        --   `shouldEqual` "border-color:should not compile"
        -- ,
        -- renderProperties [ borderColor4 black inherit blue white ] 
        --   `shouldEqual` "border-color:should not compile"
        -- ,
        -- renderProperties [ borderColor4 black blue unset white ] 
        --   `shouldEqual` "border-color:should not compile"
        -- ,
        -- renderProperties [ borderColor4 black blue white initial ] 
        --   `shouldEqual` "border-color:should not compile"
      ]
    ]    
  , describe "the borderStyle function" 
    [ it "should render the border style properties properly"
      [ renderProperties [ borderStyle groove ]
          `shouldEqual` "border-style:groove"
      , renderProperties [ borderStyle ridge ]
          `shouldEqual` "border-style:ridge"
      , renderProperties [ borderStyle inset ]
          `shouldEqual` "border-style:inset"
      , renderProperties [ borderStyle outset ]
          `shouldEqual` "border-style:outset"
      , renderProperties [ borderStyle solid ]
          `shouldEqual` "border-style:solid"
      , renderProperties [ borderStyle dotted ]
          `shouldEqual` "border-style:dotted"
      , renderProperties [ borderStyle dashed ]
          `shouldEqual` "border-style:dashed"
      , renderProperties [ borderStyle double ]
          `shouldEqual` "border-style:double"
      ]
      -- border style can have hidden and none but not auto
    , it "should render generic properties properly"
      [ renderProperties [ borderStyle initial ] 
          `shouldEqual` "border-style:initial"
      , renderProperties [ borderStyle inherit ] 
          `shouldEqual` "border-style:inherit"
      , renderProperties [ borderStyle hidden ]
          `shouldEqual` "border-style:hidden"
      , renderProperties [ borderStyle none ]
          `shouldEqual` "border-style:none"
      , renderProperties [ borderStyle unset ] 
          `shouldEqual` "border-style:unset"
      , renderProperties [ borderStyle (other "foo") ] 
          `shouldEqual` "border-style:foo"
      , renderProperties [ borderStyle (otherPrefixed [webkit_, moz_] "foo") ] 
          `shouldEqual` "border-style:-webkit-foo;border-style:-moz-foo"
      -- , renderProperties [ borderStyle all ]
      --     `shouldEqual` "border-style:should not compile"
      -- , renderProperties [ borderStyle auto ]
      --     `shouldEqual` "border-style:should not compile"
      -- , renderProperties [ borderStyle baseline ]
      --     `shouldEqual` "border-style:should not compile"
      -- , renderProperties [ borderStyle center ]
      --     `shouldEqual` "border-style:should not compile"
      -- , renderProperties [ borderStyle normal ]
      --     `shouldEqual` "border-style:should not compile"
      -- , renderProperties [ borderStyle visible ]
      --     `shouldEqual` "border-style:should not compile"
      ]
    ]
  , describe "the borderLeftStyle function" 
    [ it "should render the border style properties properly"
      [ renderProperties [ borderLeftStyle groove ]
          `shouldEqual` "border-left-style:groove"
      ]
      -- border style can have hidden and none but not auto
    , it "should render generic properties properly"
      [ renderProperties [ borderLeftStyle initial ] 
          `shouldEqual` "border-left-style:initial"
      , renderProperties [ borderLeftStyle inherit ] 
          `shouldEqual` "border-left-style:inherit"
      , renderProperties [ borderLeftStyle hidden ]
          `shouldEqual` "border-left-style:hidden"
      , renderProperties [ borderLeftStyle none ]
          `shouldEqual` "border-left-style:none"
      , renderProperties [ borderLeftStyle unset ] 
          `shouldEqual` "border-left-style:unset"
      , renderProperties [ borderLeftStyle (other "foo") ] 
          `shouldEqual` "border-left-style:foo"
      , renderProperties [ borderLeftStyle (otherPrefixed [webkit_, moz_] "foo") ] 
          `shouldEqual` "border-left-style:-webkit-foo;border-left-style:-moz-foo"
      -- , renderProperties [ borderLeftStyle all ]
      --     `shouldEqual` "border-left-style:should not compile"
      -- , renderProperties [ borderLeftStyle auto ]
      --     `shouldEqual` "border-left-style:should not compile"
      -- , renderProperties [ borderLeftStyle baseline ]
      --     `shouldEqual` "border-left-style:should not compile"
      -- , renderProperties [ borderLeftStyle center ]
      --     `shouldEqual` "border-left-style:should not compile"
      -- , renderProperties [ borderLeftStyle normal ]
      --     `shouldEqual` "border-left-style:should not compile"
      -- , renderProperties [ borderLeftStyle visible ]
      --     `shouldEqual` "border-left-style:should not compile"
      ]
    ]
  , describe "the borderRightStyle function" 
    [ it "should render the border style properties properly"
      [ renderProperties [ borderRightStyle groove ]
          `shouldEqual` "border-right-style:groove"
      ]
      -- border style can have hidden and none but not auto
    , it "should render generic properties properly"
      [ renderProperties [ borderRightStyle initial ] 
          `shouldEqual` "border-right-style:initial"
      , renderProperties [ borderRightStyle inherit ] 
          `shouldEqual` "border-right-style:inherit"
      , renderProperties [ borderRightStyle hidden ]
          `shouldEqual` "border-right-style:hidden"
      , renderProperties [ borderRightStyle none ]
          `shouldEqual` "border-right-style:none"
      , renderProperties [ borderRightStyle unset ] 
          `shouldEqual` "border-right-style:unset"
      , renderProperties [ borderRightStyle (other "foo") ] 
          `shouldEqual` "border-right-style:foo"
      , renderProperties [ borderRightStyle (otherPrefixed [webkit_, moz_] "foo") ] 
          `shouldEqual` "border-right-style:-webkit-foo;border-right-style:-moz-foo"
      -- , renderProperties [ borderRightStyle all ]
      --     `shouldEqual` "border-right-style:should not compile"
      -- , renderProperties [ borderRightStyle auto ]
      --     `shouldEqual` "border-right-style:should not compile"
      -- , renderProperties [ borderRightStyle baseline ]
      --     `shouldEqual` "border-right-style:should not compile"
      -- , renderProperties [ borderRightStyle center ]
      --     `shouldEqual` "border-right-style:should not compile"
      -- , renderProperties [ borderRightStyle normal ]
      --     `shouldEqual` "border-right-style:should not compile"
      -- , renderProperties [ borderRightStyle visible ]
      --     `shouldEqual` "border-right-style:should not compile"
      ]
    ]
  , describe "the borderTopStyle function" 
    [ it "should render the border style properties properly"
      [ renderProperties [ borderTopStyle groove ]
          `shouldEqual` "border-top-style:groove"
      ]
      -- border style can have hidden and none but not auto
    , it "should render generic properties properly"
      [ renderProperties [ borderTopStyle initial ] 
          `shouldEqual` "border-top-style:initial"
      , renderProperties [ borderTopStyle inherit ] 
          `shouldEqual` "border-top-style:inherit"
      , renderProperties [ borderTopStyle hidden ]
          `shouldEqual` "border-top-style:hidden"
      , renderProperties [ borderTopStyle none ]
          `shouldEqual` "border-top-style:none"
      , renderProperties [ borderTopStyle unset ] 
          `shouldEqual` "border-top-style:unset"
      , renderProperties [ borderTopStyle (other "foo") ] 
          `shouldEqual` "border-top-style:foo"
      , renderProperties [ borderTopStyle (otherPrefixed [webkit_, moz_] "foo") ] 
          `shouldEqual` "border-top-style:-webkit-foo;border-top-style:-moz-foo"
      -- , renderProperties [ borderTopStyle all ]
      --     `shouldEqual` "border-top-style:should not compile"
      -- , renderProperties [ borderTopStyle auto ]
      --     `shouldEqual` "border-top-style:should not compile"
      -- , renderProperties [ borderTopStyle baseline ]
      --     `shouldEqual` "border-top-style:should not compile"
      -- , renderProperties [ borderTopStyle center ]
      --     `shouldEqual` "border-top-style:should not compile"
      -- , renderProperties [ borderTopStyle normal ]
      --     `shouldEqual` "border-top-style:should not compile"
      -- , renderProperties [ borderTopStyle visible ]
      --     `shouldEqual` "border-top-style:should not compile"
      ]
    ]
  , describe "the borderBottomStyle function" 
    [ it "should render the border style properties properly"
      [ renderProperties [ borderBottomStyle groove ]
          `shouldEqual` "border-bottom-style:groove"
      ]
      -- border style can have hidden and none but not auto
    , it "should render generic properties properly"
      [ renderProperties [ borderBottomStyle initial ] 
          `shouldEqual` "border-bottom-style:initial"
      , renderProperties [ borderBottomStyle inherit ] 
          `shouldEqual` "border-bottom-style:inherit"
      , renderProperties [ borderBottomStyle hidden ]
          `shouldEqual` "border-bottom-style:hidden"
      , renderProperties [ borderBottomStyle none ]
          `shouldEqual` "border-bottom-style:none"
      , renderProperties [ borderBottomStyle unset ] 
          `shouldEqual` "border-bottom-style:unset"
      , renderProperties [ borderBottomStyle (other "foo") ] 
          `shouldEqual` "border-bottom-style:foo"
      , renderProperties [ borderBottomStyle (otherPrefixed [webkit_, moz_] "foo") ] 
          `shouldEqual` "border-bottom-style:-webkit-foo;border-bottom-style:-moz-foo"
      -- , renderProperties [ borderBottomStyle all ]
      --     `shouldEqual` "border-bottom-style:should not compile"
      -- , renderProperties [ borderBottomStyle auto ]
      --     `shouldEqual` "border-bottom-style:should not compile"
      -- , renderProperties [ borderBottomStyle baseline ]
      --     `shouldEqual` "border-bottom-style:should not compile"
      -- , renderProperties [ borderBottomStyle center ]
      --     `shouldEqual` "border-bottom-style:should not compile"
      -- , renderProperties [ borderBottomStyle normal ]
      --     `shouldEqual` "border-bottom-style:should not compile"
      -- , renderProperties [ borderBottomStyle visible ]
      --     `shouldEqual` "border-bottom-style:should not compile"
      ]
    ]
  , describe "the borderStyle4 function" 
    [ it "should render the border style properties properly"
      [ renderProperties [ borderStyle4 solid dotted dashed groove ]
          `shouldEqual` ("border-style:solid dotted dashed groove")
      ]
    , it "should not accept generic properties"
      [
        -- renderProperties [ borderStyle4 initial dotted dashed groove ] 
        --   `shouldEqual` "border-style:should not compile"
        -- ,
        -- renderProperties [ borderStyle4 solid inherit dashed groove] 
        --   `shouldEqual` "border-style:should not compile"
        -- ,
        -- renderProperties [ borderStyle4 solid dotted unset groove ] 
        --   `shouldEqual` "border-style:should not compile"
        -- ,
        -- renderProperties [ borderStyle4 solid dotted dashed initial ] 
        --   `shouldEqual` "border-style:should not compile"
      ]
    ]    
  , describe "the borderWidth function" 
    [ it "should render the border width properties properly"
      [ renderProperties [ borderWidth thick ]
          `shouldEqual` "border-width:thick"
      , renderProperties [ borderWidth thin ]
          `shouldEqual` "border-width:thin"
      , renderProperties [ borderWidth medium ]
          `shouldEqual` "border-width:medium"
      , renderProperties [ borderWidth (inches 3.8) ]
          `shouldEqual` "border-width:3.8in"
      -- , renderProperties [ borderWidth (em 3.8) ]
      --     `shouldEqual` "border-width:should not compile"
      ]
    , it "should render generic properties properly"
      [ renderProperties [ borderWidth initial ] 
          `shouldEqual` "border-width:initial"
      , renderProperties [ borderWidth inherit ] 
          `shouldEqual` "border-width:inherit"
      , renderProperties [ borderWidth unset ] 
          `shouldEqual` "border-width:unset"
      , renderProperties [ borderWidth (other "foo") ] 
          `shouldEqual` "border-width:foo"
      , renderProperties [ borderWidth (otherPrefixed [webkit_, moz_] "foo") ] 
          `shouldEqual` "border-width:-webkit-foo;border-width:-moz-foo"
      -- , renderProperties [ borderWidth all ]
      --     `shouldEqual` "border-width:should not compile"
      -- , renderProperties [ borderWidth auto ]
      --     `shouldEqual` "border-width:should not compile"
      -- , renderProperties [ borderWidth baseline ]
      --     `shouldEqual` "border-width:should not compile"
      -- , renderProperties [ borderWidth center ]
      --     `shouldEqual` "border-width:should not compile"
      -- , renderProperties [ borderWidth normal ]
      --     `shouldEqual` "border-width:should not compile"
      -- , renderProperties [ borderWidth none ]
      --     `shouldEqual` "border-width:should not compile"
      -- , renderProperties [ borderWidth visible ]
      --     `shouldEqual` "border-width:should not compile"
      -- , renderProperties [ borderWidth hidden ]
      --     `shouldEqual` "border-width:should not compile"
      ]
    ]
  , describe "the borderLeftWidth function" 
    [ it "should render the border width properties properly"
      [ renderProperties [ borderLeftWidth thick ]
          `shouldEqual` "border-left-width:thick"
      , renderProperties [ borderLeftWidth thin ]
          `shouldEqual` "border-left-width:thin"
      , renderProperties [ borderLeftWidth medium ]
          `shouldEqual` "border-left-width:medium"
      , renderProperties [ borderLeftWidth (inches 3.8) ]
          `shouldEqual` "border-left-width:3.8in"
      -- , renderProperties [ borderLeftWidth (em 3.8) ]
      --     `shouldEqual` "border-left-width:should not compile"
      ]
    , it "should render generic properties properly"
      [ renderProperties [ borderLeftWidth initial ] 
          `shouldEqual` "border-left-width:initial"
      , renderProperties [ borderLeftWidth inherit ] 
          `shouldEqual` "border-left-width:inherit"
      , renderProperties [ borderLeftWidth unset ] 
          `shouldEqual` "border-left-width:unset"
      , renderProperties [ borderLeftWidth (other "foo") ] 
          `shouldEqual` "border-left-width:foo"
      , renderProperties [ borderLeftWidth (otherPrefixed [webkit_, moz_] "foo") ] 
          `shouldEqual` "border-left-width:-webkit-foo;border-left-width:-moz-foo"
      -- , renderProperties [ borderLeftWidth all ]
      --     `shouldEqual` "border-left-width:should not compile"
      -- , renderProperties [ borderLeftWidth auto ]
      --     `shouldEqual` "border-left-width:should not compile"
      -- , renderProperties [ borderLeftWidth baseline ]
      --     `shouldEqual` "border-left-width:should not compile"
      -- , renderProperties [ borderLeftWidth center ]
      --     `shouldEqual` "border-left-width:should not compile"
      -- , renderProperties [ borderLeftWidth normal ]
      --     `shouldEqual` "border-left-width:should not compile"
      -- , renderProperties [ borderLeftWidth none ]
      --     `shouldEqual` "border-left-width:should not compile"
      -- , renderProperties [ borderLeftWidth visible ]
      --     `shouldEqual` "border-left-width:should not compile"
      -- , renderProperties [ borderLeftWidth hidden ]
      --     `shouldEqual` "border-left-width:should not compile"
      ]
    ]
  , describe "the borderRightWidth function" 
    [ it "should render the border width properties properly"
      [ renderProperties [ borderRightWidth thick ]
          `shouldEqual` "border-right-width:thick"
      , renderProperties [ borderRightWidth thin ]
          `shouldEqual` "border-right-width:thin"
      , renderProperties [ borderRightWidth medium ]
          `shouldEqual` "border-right-width:medium"
      , renderProperties [ borderRightWidth (inches 3.8) ]
          `shouldEqual` "border-right-width:3.8in"
      -- , renderProperties [ borderRightWidth (em 3.8) ]
      --     `shouldEqual` "border-right-width:should not compile"
      ]
    , it "should render generic properties properly"
      [ renderProperties [ borderRightWidth initial ] 
          `shouldEqual` "border-right-width:initial"
      , renderProperties [ borderRightWidth inherit ] 
          `shouldEqual` "border-right-width:inherit"
      , renderProperties [ borderRightWidth unset ] 
          `shouldEqual` "border-right-width:unset"
      , renderProperties [ borderRightWidth (other "foo") ] 
          `shouldEqual` "border-right-width:foo"
      , renderProperties [ borderRightWidth (otherPrefixed [webkit_, moz_] "foo") ] 
          `shouldEqual` "border-right-width:-webkit-foo;border-right-width:-moz-foo"
      -- , renderProperties [ borderRightWidth all ]
      --     `shouldEqual` "border-right-width:should not compile"
      -- , renderProperties [ borderRightWidth auto ]
      --     `shouldEqual` "border-right-width:should not compile"
      -- , renderProperties [ borderRightWidth baseline ]
      --     `shouldEqual` "border-right-width:should not compile"
      -- , renderProperties [ borderRightWidth center ]
      --     `shouldEqual` "border-right-width:should not compile"
      -- , renderProperties [ borderRightWidth normal ]
      --     `shouldEqual` "border-right-width:should not compile"
      -- , renderProperties [ borderRightWidth none ]
      --     `shouldEqual` "border-right-width:should not compile"
      -- , renderProperties [ borderRightWidth visible ]
      --     `shouldEqual` "border-right-width:should not compile"
      -- , renderProperties [ borderRightWidth hidden ]
      --     `shouldEqual` "border-right-width:should not compile"
      ]
    ]
  , describe "the borderTopWidth function" 
    [ it "should render the border width properties properly"
      [ renderProperties [ borderTopWidth thick ]
          `shouldEqual` "border-top-width:thick"
      , renderProperties [ borderTopWidth thin ]
          `shouldEqual` "border-top-width:thin"
      , renderProperties [ borderTopWidth medium ]
          `shouldEqual` "border-top-width:medium"
      , renderProperties [ borderTopWidth (inches 3.8) ]
          `shouldEqual` "border-top-width:3.8in"
      -- , renderProperties [ borderTopWidth (em 3.8) ]
      --     `shouldEqual` "border-top-width:should not compile"
      ]
    , it "should render generic properties properly"
      [ renderProperties [ borderTopWidth initial ] 
          `shouldEqual` "border-top-width:initial"
      , renderProperties [ borderTopWidth inherit ] 
          `shouldEqual` "border-top-width:inherit"
      , renderProperties [ borderTopWidth unset ] 
          `shouldEqual` "border-top-width:unset"
      , renderProperties [ borderTopWidth (other "foo") ] 
          `shouldEqual` "border-top-width:foo"
      , renderProperties [ borderTopWidth (otherPrefixed [webkit_, moz_] "foo") ] 
          `shouldEqual` "border-top-width:-webkit-foo;border-top-width:-moz-foo"
      -- , renderProperties [ borderTopWidth all ]
      --     `shouldEqual` "border-top-width:should not compile"
      -- , renderProperties [ borderTopWidth auto ]
      --     `shouldEqual` "border-top-width:should not compile"
      -- , renderProperties [ borderTopWidth baseline ]
      --     `shouldEqual` "border-top-width:should not compile"
      -- , renderProperties [ borderTopWidth center ]
      --     `shouldEqual` "border-top-width:should not compile"
      -- , renderProperties [ borderTopWidth normal ]
      --     `shouldEqual` "border-top-width:should not compile"
      -- , renderProperties [ borderTopWidth none ]
      --     `shouldEqual` "border-top-width:should not compile"
      -- , renderProperties [ borderTopWidth visible ]
      --     `shouldEqual` "border-top-width:should not compile"
      -- , renderProperties [ borderTopWidth hidden ]
      --     `shouldEqual` "border-top-width:should not compile"
      ]
    ]
  , describe "the borderBottomWidth function" 
    [ it "should render the border width properties properly"
      [ renderProperties [ borderBottomWidth thick ]
          `shouldEqual` "border-bottom-width:thick"
      , renderProperties [ borderBottomWidth thin ]
          `shouldEqual` "border-bottom-width:thin"
      , renderProperties [ borderBottomWidth medium ]
          `shouldEqual` "border-bottom-width:medium"
      , renderProperties [ borderBottomWidth (inches 3.8) ]
          `shouldEqual` "border-bottom-width:3.8in"
      -- , renderProperties [ borderBottomWidth (em 3.8) ]
      --     `shouldEqual` "border-bottom-width:should not compile"
      ]
    , it "should render generic properties properly"
      [ renderProperties [ borderBottomWidth initial ] 
          `shouldEqual` "border-bottom-width:initial"
      , renderProperties [ borderBottomWidth inherit ] 
          `shouldEqual` "border-bottom-width:inherit"
      , renderProperties [ borderBottomWidth unset ] 
          `shouldEqual` "border-bottom-width:unset"
      , renderProperties [ borderBottomWidth (other "foo") ] 
          `shouldEqual` "border-bottom-width:foo"
      , renderProperties [ borderBottomWidth (otherPrefixed [webkit_, moz_] "foo") ] 
          `shouldEqual` "border-bottom-width:-webkit-foo;border-bottom-width:-moz-foo"
      -- , renderProperties [ borderBottomWidth all ]
      --     `shouldEqual` "border-bottom-width:should not compile"
      -- , renderProperties [ borderBottomWidth auto ]
      --     `shouldEqual` "border-bottom-width:should not compile"
      -- , renderProperties [ borderBottomWidth baseline ]
      --     `shouldEqual` "border-bottom-width:should not compile"
      -- , renderProperties [ borderBottomWidth center ]
      --     `shouldEqual` "border-bottom-width:should not compile"
      -- , renderProperties [ borderBottomWidth normal ]
      --     `shouldEqual` "border-bottom-width:should not compile"
      -- , renderProperties [ borderBottomWidth none ]
      --     `shouldEqual` "border-bottom-width:should not compile"
      -- , renderProperties [ borderBottomWidth visible ]
      --     `shouldEqual` "border-bottom-width:should not compile"
      -- , renderProperties [ borderBottomWidth hidden ]
      --     `shouldEqual` "border-bottom-width:should not compile"
      ]
    ]
  , describe "the borderWidth4 function" 
    [ it "should render the border width properties properly"
      [ renderProperties [ borderWidth4 (px 5.2) (px 7.6) (px 5) (px 5.4) ]
          `shouldEqual` ("border-width:5.2px 7.6px 5px 5.4px")
      , renderProperties [ borderWidth4 thick thin thick thin ]
          `shouldEqual` ("border-width:thick thin thick thin")
      , renderProperties [ borderWidth4 thick (px 7.6) (px 5) (px 5.4) ]
          `shouldEqual` ("border-width:thick 7.6px 5px 5.4px")
      , renderProperties [ borderWidth4 (px 5.2) thin (px 5) (px 5.4) ]
          `shouldEqual` ("border-width:5.2px thin 5px 5.4px")
      , renderProperties [ borderWidth4 (px 5.2) (px 7.6) medium (px 5.4) ]
          `shouldEqual` ("border-width:5.2px 7.6px medium 5.4px")
      , renderProperties [ borderWidth4 (px 5.2) (px 7.6) (px 5) medium ]
          `shouldEqual` ("border-width:5.2px 7.6px 5px medium")
      -- , renderProperties [ borderWidth4 (em 5.2) (em 7.6) (em 5) (em 5.4) ]
      --     `shouldEqual` ("border-width:should not compile")
      ]
    , it "should not accept generic properties"
      [
        -- renderProperties [ borderWidth4 initial (px 7.6) (px 5) (px 5.4) ] 
        --   `shouldEqual` "border-width:should not compile"
        -- ,
        -- renderProperties [ borderWidth4 (px 7.6) inherit (px 5) (px 5.4) ] 
        --   `shouldEqual` "border-width:should not compile"
        -- ,
        -- renderProperties [ borderWidth4 (px 7.6) (px 5) unset (px 5.4) ] 
        --   `shouldEqual` "border-width:should not compile"
        -- ,
        -- renderProperties [ borderWidth4 black blue white initial ] 
        --   `shouldEqual` "border-width:should not compile"
      ]
    ]    
  --TODO add new functions and generics
  , describe "The border radius functions"
    [ it "should render the border radius properties correctly"
      [ renderProperties [borderRadius4 (px 20) (pct 30) (px 40) (px 50)]
          `shouldEqual` "border-radius:20px 30% 40px 50px"
      , renderProperties [borderTopLeftRadius2 (px 20) (pct 30)]
          `shouldEqual` "border-top-left-radius:20px 30%"
      , renderProperties [borderTopRightRadius2 (px 20) (pct 30)]
          `shouldEqual` "border-top-right-radius:20px 30%"
      , renderProperties [borderBottomLeftRadius2 (px 20) (pct 30)]
          `shouldEqual` "border-bottom-left-radius:20px 30%"
      , renderProperties [borderBottomRightRadius2 (px 20) (pct 30)]
          `shouldEqual` "border-bottom-right-radius:20px 30%"
      ]
    ]
  , describe "The border collapse function"
    [ it "should render the border collapse property correctly"
      [ renderProperties [borderCollapse collapse]
          `shouldEqual` "border-collapse:collapse"
      ]
    ]
  , describe "The border spacing functions"
    [ it "should render the border spacing properties correctly"
      [ renderProperties [borderSpacing (px 20)]
           `shouldEqual` "border-spacing:20px"
      ,  renderProperties [borderSpacing (pct 20)]
           `shouldEqual` "border-spacing:20%"
      , renderProperties [borderSpacing2 (px 20) (pct 30)]
          `shouldEqual` "border-spacing:20px 30%"
      ]
    ]
  , describe "The outline functions"
    [ it "should render the simple outline properties correctly"
      [ renderProperties [ outline (anOutlineWith solid (px 20) green) ]
          `shouldEqual` "outline:solid 20px #73D216"
      , renderProperties [ outline (anOutlineWith solid (px 20) invert) ]
          `shouldEqual` "outline:solid 20px invert"
      -- Relative widths should not compile; uncomment to see:
      -- , outline solid (pct 20) green `shouldEqual` outline solid (pct 20) green
      ]      
    , it "should render the outline color properties correctly"
      [ renderProperties [outlineColor green]
          `shouldEqual` "outline-color:#73D216"
      , renderProperties [outlineColor invert]
          `shouldEqual` "outline-color:invert"
      ]
      -- TODO outline style can have auto and none but not hidden      
    , it "should render the outline style properties properly"
      [ renderProperties [outlineStyle solid]
          `shouldEqual` "outline-style:solid"
      ]      
    , it "should render the outline width properties properly"
      [ renderProperties [outlineWidth (px 20)]
          `shouldEqual` "outline-width:20px"
      , renderProperties [outlineWidth thin]
            `shouldEqual` "outline-width:thin"
      , renderProperties [outlineWidth medium]
            `shouldEqual` "outline-width:medium"
      , renderProperties [outlineWidth thick]
            `shouldEqual` "outline-width:thick"
      -- Relative widths should not compile; uncomment to see:
      -- , outlineWidth (pct 20) `shouldEqual` outlineWidth (pct 20)
      ]
    , it "should render the outline offset property properly"
      [ renderProperties [outlineOffset (px 20)]
          `shouldEqual` "outline-offset:20px"
      ]
    ]    
  ]
