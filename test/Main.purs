module Test.Main where

import Prelude (Unit)

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)

import Data.Argonaut.Combinators ((~>), (:=))
import Data.Argonaut.Core (jsonEmptyObject)

import Test.Spec (it, describe)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (Process, run)

import Electron (ELECTRON)
import Electron.BrowserWindow (BrowserWindowOption(WebPreferences, Height, Width), WebPreference(OverlayScrollbars))
import Electron.Options (encodeOptions)

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
