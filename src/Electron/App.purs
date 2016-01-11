module Electron.App
  ( getAppPath
  , getPath
  , Path(..)
  , onReady
  , quit
  ) where

import Prelude

import Control.Monad.Eff
import Control.Monad.Eff.Unsafe

import Electron.Eff

foreign import getAppPath :: forall eff. Eff (electron :: ELECTRON | eff) String

foreign import getPath :: forall eff. Path -> Eff (electron :: ELECTRON | eff) String

foreign import quit :: forall eff. Eff (electron :: ELECTRON | eff) Unit

data Path
  = Home
  | Documents
  | AppData

onReady :: forall callbackEff eff
   . Eff callbackEff Unit
  -> Eff (electron :: ELECTRON | eff) Unit
onReady callback = onReadyImpl unsafePerformEff callback

foreign import onReadyImpl
  :: forall callbackEff eff
   . (Eff callbackEff Unit -> Unit)
  -> Eff callbackEff Unit
  -> Eff (electron :: ELECTRON | eff) Unit
