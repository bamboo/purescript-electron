module Electron.Shell
  ( showItemInFolder
  , openItem
  , openExternal
  , moveItemToTrash
  , beep
  ) where

import Prelude (Unit())
import Control.Monad.Eff (Eff())
import Electron (ELECTRON())

-- | Show the given file in a file manager. If possible, select the file.
foreign import showItemInFolder :: forall e. String -> Eff (electron :: ELECTRON | e) Unit

-- | Open the given file in the desktop's default manner.
foreign import openItem :: forall e. String -> Eff (electron :: ELECTRON | e) Unit

-- | Open the given external protocol URL in the desktop's default manner.
-- | (For example, mailto: URLs in the user's default mail agent.)
foreign import openExternal :: forall e. String -> Eff (electron :: ELECTRON | e) Unit

-- | Move the given file to trash and returns a boolean status for the operation.
foreign import moveItemToTrash :: forall e. String -> Eff (electron :: ELECTRON | e) Boolean

-- | Play the beep sound.
foreign import beep :: forall e. Eff (electron :: ELECTRON | e) Unit
