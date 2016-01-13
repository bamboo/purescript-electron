module Test.Main where

import Prelude

import Control.Monad.Eff
import Control.Monad.Eff.Console

import Data.Argonaut.Core
import Data.Argonaut.Combinators

import Test.Spec
import Test.Spec.Assertions
import Test.Spec.Reporter.Console
import Test.Spec.Runner

import Electron.BrowserWindow
import Electron.Options

main :: forall eff. Eff (console :: CONSOLE, process :: Process | eff) Unit
main = run [consoleReporter] do
  describe "encodeOptions :: BrowserWindowOptions -> Json" do
    it "can encode all options" do
      let options = [Width 640, Height 480]
      encodeOptions options `shouldEqual` (  "width"  := 640
                                          ~> "height" := 480
                                          ~> jsonEmptyObject )
