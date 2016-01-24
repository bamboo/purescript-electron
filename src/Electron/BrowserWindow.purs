module Electron.BrowserWindow
  ( BrowserWindowOption(..)
  , WebPreference(..)
  , BrowserWindowOptions(..)
  , BrowserWindow()
  , newBrowserWindow
  , onClose
  , loadURL
  , WebContents(..)
  , webContents
  , openDevTools
  , DevToolOption(..)
  , DevToolOptions(..)
  , send
  , onDidFinishLoad
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

foreign import data WebContents :: *

foreign import webContents :: forall eff
   . BrowserWindow
  -> Eff (electron :: ELECTRON | eff) WebContents

-- | Opens the devtools.
-- |
-- | [Official Electron documentation](http://electron.atom.io/docs/all/#webcontents-opendevtools-options)
openDevTools :: forall eff
   . WebContents
  -> DevToolOptions
  -> Eff (electron :: ELECTRON | eff) Unit
openDevTools wc = encodeOptions >>> openDevToolsImpl wc

foreign import openDevToolsImpl :: forall eff
   . WebContents
  -> Json
  -> Eff (electron :: ELECTRON | eff) Unit

data DevToolOption
  = Detach Boolean

type DevToolOptions = Array DevToolOption

derive instance genericDevToolOption :: Generic DevToolOption

foreign import send :: forall a eff
   . WebContents
  -> String
  -> a
  -> Eff (electron :: ELECTRON | eff) Unit

foreign import onDidFinishLoad :: forall eff
   . WebContents
  -> Eff (electron :: ELECTRON | eff) Unit
  -> Eff (electron :: ELECTRON | eff) Unit
