module Test.Main where

import Data.Argonaut.Combinators ((~>), (:=))
import Data.Argonaut.Core (jsonEmptyObject)

import Test.Spec (it, describe)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (run)

import Electron.BrowserWindow (BrowserWindowOption(WebPreferences, Height, Width), WebPreference(OverlayScrollbars))
import Electron.Options (encodeOptions)

main = run [consoleReporter] do
  describe "encodeOptions :: BrowserWindowOptions -> Json" do
    it "can encode all options" do
      let options = [Width 640, Height 480, WebPreferences [OverlayScrollbars true]]
      encodeOptions options `shouldEqual` (  "width"  := 640
                                          ~> "height" := 480
                                          ~> "webPreferences" := ( "overlayScrollbars" := true
                                                                 ~> jsonEmptyObject )
                                          ~> jsonEmptyObject )
