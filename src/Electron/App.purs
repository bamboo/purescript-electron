module Electron.App
  ( getAppPath
  , getPath
  , Path(..)
  , onReady
  , quit
  ) where

import Prelude

import Control.Monad.Eff
import Electron.Eff

foreign import getAppPath :: forall eff. Eff (electron :: ELECTRON | eff) String

foreign import getPath :: forall eff. Path -> Eff (electron :: ELECTRON | eff) String

foreign import quit :: forall eff. Eff (electron :: ELECTRON | eff) Unit

data Path
  = Home
  | Documents
  | AppData

foreign import onReady :: forall eff
   . Eff (electron :: ELECTRON | eff) Unit
  -> Eff (electron :: ELECTRON | eff) Unit
