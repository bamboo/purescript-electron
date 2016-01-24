## Module Electron.App

#### `getAppPath`

``` purescript
getAppPath :: forall eff. Eff (electron :: ELECTRON | eff) String
```

#### `getPath`

``` purescript
getPath :: forall eff. Path -> Eff (electron :: ELECTRON | eff) String
```

#### `quit`

``` purescript
quit :: forall eff. Eff (electron :: ELECTRON | eff) Unit
```

#### `Path`

``` purescript
data Path
  = Home
  | Documents
  | AppData
```

#### `onReady`

``` purescript
onReady :: forall eff. Eff (electron :: ELECTRON | eff) Unit -> Eff (electron :: ELECTRON | eff) Unit
```

Emitted when Electron has finished initialization.

[Official Electron documentation](http://electron.atom.io/docs/all/#event-39-ready-39)


