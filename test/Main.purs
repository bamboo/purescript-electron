module Test.Main where

import Prelude (Unit)

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Node.Process (PROCESS)

import Data.Argonaut.Encode.Combinators ((~>), (:=))
import Data.Argonaut.Core (jsonEmptyObject)

import Test.Spec (it, describe)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (run)

import Electron.BrowserWindow (BrowserWindowOption(WebPreferences, Height, Width), WebPreference(OverlayScrollbars))
import Electron.Options (encodeOptions)

main :: forall eff. Eff (process :: PROCESS, console :: CONSOLE | eff) Unit
main = run [consoleReporter] do
  describe "encodeOptions :: BrowserWindowOptions -> Json" do
    it "can encode all options" do
      let options = [Width 640, Height 480, WebPreferences [OverlayScrollbars true]]
      encodeOptions options `shouldEqual` (  "width"  := 640
                                          ~> "height" := 480
                                          ~> "webPreferences" := ( "overlayScrollbars" := true
                                                                 ~> jsonEmptyObject )
                                          ~> jsonEmptyObject )
