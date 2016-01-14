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
encodeOptions = map toSpine >>> encodeOptions'

encodeOptions' :: Array GenericSpine -> Json
encodeOptions' = foldl insertOption M.empty >>> encodeJson
  where
  insertOption strMap option =
    case option of
      SProd qname [arg] -> M.insert (encodeKey qname) (encodeValue (force arg)) strMap
      _                 -> strMap
  encodeKey = simpleName >>> toCamelCase
  encodeValue (SArray options) = map force options # encodeOptions'
  encodeValue value = gEncodeJson' value
  force = (unit #)

toCamelCase :: String -> String
toCamelCase s = toLower (take 1 s) ++ drop 1 s

simpleName :: String -> String
simpleName qname =
  case lastIndexOf "." qname of
    Just index -> drop (index + 1) qname
    _          -> qname
