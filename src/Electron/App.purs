module Electron.App
  ( getAppPath
  , getPath
  , Path(..)
  , onReady
  , quit
  ) where

import Prelude (Unit)

import Control.Monad.Eff (Eff)
import Electron (ELECTRON)

foreign import getAppPath :: forall eff. Eff (electron :: ELECTRON | eff) String

foreign import getPath :: forall eff. Path -> Eff (electron :: ELECTRON | eff) String

foreign import quit :: forall eff. Eff (electron :: ELECTRON | eff) Unit

data Path
  = Home
  | Documents
  | AppData

-- | Emitted when Electron has finished initialization.
-- |
-- | [Official Electron documentation](http://electron.atom.io/docs/all/#event-39-ready-39)
foreign import onReady :: forall eff
   . Eff (electron :: ELECTRON | eff) Unit
  -> Eff (electron :: ELECTRON | eff) Unit
