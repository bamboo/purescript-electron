module Test.Main where

import Prelude

import Control.Monad.Eff
import Control.Monad.Eff.Console
import Control.Monad.Aff

import Data.Argonaut.Core
import Data.Argonaut.Combinators

import Test.Spec
import Test.Spec.Assertions
import Test.Spec.Reporter.Console
import Test.Spec.Runner

import Electron
import Electron.BrowserWindow
import Electron.Options
import Electron.Shell

main :: forall eff. Eff (console :: CONSOLE, process :: Process, electron :: ELECTRON | eff) Unit
main = run [consoleReporter] do
  describe "encodeOptions :: BrowserWindowOptions -> Json" do
    it "can encode all options" do
      let options = [Width 640, Height 480, WebPreferences [OverlayScrollbars true]]
      encodeOptions options `shouldEqual` (  "width"  := 640
                                          ~> "height" := 480
                                          ~> "webPreferences" := ( "overlayScrollbars" := true
                                                                 ~> jsonEmptyObject )
                                          ~> jsonEmptyObject )
