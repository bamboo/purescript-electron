module Electron.Event
  ( Event()
  , preventDefault
  , stopPropagation
  ) where

import Prelude (Unit())
import Control.Monad.Eff (Eff())
import Electron (ELECTRON())

foreign import data Event :: *

foreign import preventDefault :: forall e. Event -> Eff (electron :: ELECTRON | e) Unit

foreign import stopPropagation :: forall e. Event -> Eff (electron :: ELECTRON | e) Unit
