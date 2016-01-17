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

import Data.Argonaut.Core (Json())
import Data.Generic

import Electron
import Electron.Options

data BrowserWindowOption
  = Width Int
  | Height Int
  | WebPreferences (Array WebPreference)

type BrowserWindowOptions = Array BrowserWindowOption

data WebPreference
  = ZoomFactor Number
  | AllowDisplayingInsecureContent Boolean
  | AllowRunningInsecureContent Boolean
  | OverlayScrollbars Boolean

derive instance genericBrowserWindowOption :: Generic BrowserWindowOption

derive instance genericWebPreference :: Generic WebPreference

foreign import data BrowserWindow :: *

newBrowserWindow :: forall eff
   . BrowserWindowOptions
  -> Eff (electron :: ELECTRON | eff) BrowserWindow
newBrowserWindow = encodeOptions >>> newBrowserWindowImpl

foreign import newBrowserWindowImpl :: forall eff
   . Json
  -> Eff (electron :: ELECTRON | eff) BrowserWindow

foreign import loadURL :: forall eff
   . BrowserWindow
  -> String
  -> Eff (electron :: ELECTRON | eff) Unit

foreign import onClose :: forall eff
   . BrowserWindow
  -> Eff (electron :: ELECTRON | eff) Unit
  -> Eff (electron :: ELECTRON | eff) Unit
