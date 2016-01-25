## Module Electron.Shell

#### `showItemInFolder`

``` purescript
showItemInFolder :: forall e. String -> Eff (electron :: ELECTRON | e) Unit
```

Show the given file in a file manager. If possible, select the file.

#### `openItem`

``` purescript
openItem :: forall e. String -> Eff (electron :: ELECTRON | e) Unit
```

Open the given file in the desktop's default manner.

#### `openExternal`

``` purescript
openExternal :: forall e. String -> Eff (electron :: ELECTRON | e) Unit
```

Open the given external protocol URL in the desktop's default manner.
(For example, mailto: URLs in the user's default mail agent.)

#### `moveItemToTrash`

``` purescript
moveItemToTrash :: forall e. String -> Eff (electron :: ELECTRON | e) Boolean
```

Move the given file to trash and returns a boolean status for the operation.

#### `beep`

``` purescript
beep :: forall e. Eff (electron :: ELECTRON | e) Unit
```

Play the beep sound.


