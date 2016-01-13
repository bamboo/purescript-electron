module Electron.BrowserWindow
  ( BrowserWindowOption(..)
  , WebPreference(..)
  , BrowserWindowOptions(..)
  , BrowserWindow()
  , newBrowserWindow
  , onClose
  , loadURL
  ) where

import Prelude

import Control.Monad.Eff
import Control.Monad.Eff.Unsafe

import Data.Argonaut.Core (Json())
import Data.Generic

import Electron.Eff
import Electron.Options

data BrowserWindowOption
  = Width Int
  | Height Int
  | WebPreferences (Array WebPreference)

data WebPreference
  = ZoomFactor Number
  | AllowDisplayingInsecureContent Boolean
  | AllowRunningInsecureContent Boolean
  | OverlayScrollbars Boolean

derive instance genericBrowserWindowOption :: Generic BrowserWindowOption

derive instance genericWebPreference :: Generic WebPreference

type BrowserWindowOptions = Array BrowserWindowOption

foreign import data BrowserWindow :: *

newBrowserWindow :: forall eff
   . BrowserWindowOptions
  -> Eff (electron :: ELECTRON | eff) BrowserWindow
newBrowserWindow = encodeOptions >>> newBrowserWindowImpl

foreign import newBrowserWindowImpl
  :: forall eff
   . Json
  -> Eff (electron :: ELECTRON | eff) BrowserWindow

foreign import loadURL
  :: forall eff
   . BrowserWindow
  -> String
  -> Eff (electron :: ELECTRON | eff) Unit

onClose :: forall eff
   . BrowserWindow
  -> Eff (electron :: ELECTRON | eff) Unit
  -> Eff (electron :: ELECTRON | eff) Unit
onClose browserWindow callback = onCloseImpl unsafePerformEff browserWindow callback

foreign import onCloseImpl
  :: forall callbackEff eff
   . (Eff callbackEff Unit -> Unit)
  -> BrowserWindow
  -> Eff callbackEff Unit
  -> Eff (electron :: ELECTRON | eff) Unit
