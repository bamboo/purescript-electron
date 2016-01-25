## Module Electron.Event

#### `Event`

``` purescript
data Event :: *
```

#### `preventDefault`

``` purescript
preventDefault :: forall e. Event -> Eff (electron :: ELECTRON | e) Unit
```

#### `stopPropagation`

``` purescript
stopPropagation :: forall e. Event -> Eff (electron :: ELECTRON | e) Unit
```


