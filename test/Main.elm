module Main where

import IO.IO exposing (..)
import IO.Runner exposing (Request, Response, run)

import Spec.Runner.Console as Console
import Spec exposing (..)

import CssTests
import Css.BackgroundTests
import Css.BoxTests
import Css.ColorTests
-- import Css.DisplayTests
import Css.FontTests
import Css.GeometryTests
import Css.ListTests
import Css.TextTests
import Css.PseudoTests
import Css.Internal.PropertyTests
import Css.Internal.UtilsTests

-------------------------------------------------------------------------------

allTests : Spec
allTests =
  describe  "All tests"
    [ CssTests.suite
    , Css.BackgroundTests.suite
    , Css.BoxTests.suite
    , Css.ColorTests.suite
--    , Css.DisplayTests.suite
    , Css.FontTests.suite
    , Css.GeometryTests.suite
    , Css.ListTests.suite
    , Css.TextTests.suite
    , Css.PseudoTests.suite
    , Css.Internal.PropertyTests.suite
    , Css.Internal.UtilsTests.suite
    ]

testRunner : IO ()
testRunner = Console.run allTests

port requests : Signal Request
port requests = run responses testRunner

port responses : Signal Response
