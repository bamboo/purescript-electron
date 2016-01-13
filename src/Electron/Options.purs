module Electron.Options
  ( encodeOptions
  ) where

import Prelude

import Data.Argonaut.Core
import Data.Argonaut.Encode
import Data.Foldable
import Data.Generic
import Data.Maybe
import Data.String
import Data.StrMap as M

encodeOptions :: forall a. (Generic a) => Array a -> Json
encodeOptions = foldl insertOption M.empty >>> encodeJson 
  where
    insertOption strMap option =
      case toSpine option of
        SProd qname [arg] -> M.insert (encodeKey qname) (encodeValue (arg unit)) strMap
        _                 -> strMap
    encodeKey = simpleName >>> toCamelCase
    encodeValue = gEncodeJson'

toCamelCase :: String -> String
toCamelCase s = toLower (take 1 s) ++ drop 1 s

simpleName :: String -> String
simpleName qname =
  case lastIndexOf "." qname of
    Just index -> drop (index + 1) qname
    _          -> qname
