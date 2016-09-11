module Electron.IpcRenderer
  ( on
  , once
  , removeListener
  , removeAllListeners
  , send
  , sendSync
  , sendToHost
  ) where

import Prelude (Unit)
import Control.Monad.Eff (Eff)
import Electron (ELECTRON)
import Electron.Types (Channel, Listener)

-- Listening for Messages


-- | Listens to channel, when a new message arrives the listener is called.
-- |
-- | [Official Electron documentation](http://electron.atom.io/docs/api/ipc-renderer/#ipcrendereronchannel-listener)
foreign import on :: forall eff .
                     Channel
                  -> Listener (electron :: ELECTRON | eff)
                  -> Eff (electron :: ELECTRON | eff) Unit

-- | Adds a one time listener function for the event.
-- | This listener is invoked only the next time a message is sent to channel,
-- | after which it is removed.
-- |
-- | [Official Electron documentation](http://electron.atom.io/docs/api/ipc-renderer/#ipcrendereroncechannel-listener)
foreign import once :: forall eff .
                       Channel
                    -> Listener (electron :: ELECTRON | eff)
                    -> Eff (electron :: ELECTRON  | eff)  Unit

-- | Removes the specified listener from the listener array for the
-- | specified channel.
-- |
-- | [Official Electron documentation](http://electron.atom.io/docs/api/ipc-renderer/#ipcrendererremovelistenerchannel-listener)
foreign import removeListener :: forall eff .
                                 Channel
                              -> Listener (electron :: ELECTRON | eff)
                              -> Eff (electron :: ELECTRON | eff)  Unit

-- | Removes all listeners for the specified channel.
foreign import removeAllChannelListeners :: forall eff .
                                            Channel
                                         -> Eff (electron :: ELECTRON | eff) Unit

-- | Removes all listeners.
-- |
-- | [Official Electron documentation](http://electron.atom.io/docs/api/ipc-renderer/#ipcrendererremovealllistenerschannel)
foreign import removeAllListeners :: forall eff . Eff (electron :: ELECTRON | eff) Unit

-- | Send a message to the main process asynchronously via channel.
-- |
-- | [Official Electron documentation](http://electron.atom.io/docs/api/ipc-renderer/#ipcrenderersendchannel-arg1-arg2-)
foreign import send :: forall a eff .
                       Channel
                    -> a
                    -> Eff (electron :: ELECTRON | eff)  Unit

-- | Send a message to the main process synchronously via channel.
-- |
-- | [Official Electron documentation](http://electron.atom.io/docs/api/ipc-renderer/#ipcrenderersendsyncchannel-arg1-arg2-)
foreign import sendSync :: forall a eff .
                           Channel
                        -> a
                        -> Eff (electron :: ELECTRON | eff)  Unit

-- | Like ipcRenderer.send but the event will be sent to the <webview> element in the host page instead of the main process.
-- |
-- | [Official Electron documentation](http://electron.atom.io/docs/api/ipc-renderer/#ipcrenderersendtohostchannel-arg1-arg2-)
foreign import sendToHost :: forall a eff .
                             Channel
                          -> a
                          -> Eff (electron :: ELECTRON | eff)  Unit
