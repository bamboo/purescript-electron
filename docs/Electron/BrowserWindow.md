## Module Electron.BrowserWindow

#### `BrowserWindowOption`

``` purescript
data BrowserWindowOption
  = Width Int
  | Height Int
  | WebPreferences (Array WebPreference)
```

##### Instances
``` purescript
Generic BrowserWindowOption
```

#### `BrowserWindowOptions`

``` purescript
type BrowserWindowOptions = Array BrowserWindowOption
```

#### `WebPreference`

``` purescript
data WebPreference
  = ZoomFactor Number
  | AllowDisplayingInsecureContent Boolean
  | AllowRunningInsecureContent Boolean
  | OverlayScrollbars Boolean
```

##### Instances
``` purescript
Generic WebPreference
```

#### `BrowserWindow`

``` purescript
data BrowserWindow :: *
```

#### `newBrowserWindow`

``` purescript
newBrowserWindow :: forall eff. BrowserWindowOptions -> Eff (electron :: ELECTRON | eff) BrowserWindow
```

#### `loadURL`

``` purescript
loadURL :: forall eff. BrowserWindow -> String -> Eff (electron :: ELECTRON | eff) Unit
```

#### `onClose`

``` purescript
onClose :: forall eff. BrowserWindow -> Eff (electron :: ELECTRON | eff) Unit -> Eff (electron :: ELECTRON | eff) Unit
```

#### `WebContents`

``` purescript
data WebContents :: *
```

#### `webContents`

``` purescript
webContents :: forall eff. BrowserWindow -> Eff (electron :: ELECTRON | eff) WebContents
```

#### `openDevTools`

``` purescript
openDevTools :: forall eff. WebContents -> DevToolOptions -> Eff (electron :: ELECTRON | eff) Unit
```

Opens the devtools.

[Official Electron documentation](http://electron.atom.io/docs/all/#webcontents-opendevtools-options)

#### `DevToolOption`

``` purescript
data DevToolOption
  = Detach Boolean
```

##### Instances
``` purescript
Generic DevToolOption
```

#### `DevToolOptions`

``` purescript
type DevToolOptions = Array DevToolOption
```

#### `send`

``` purescript
send :: forall a eff. WebContents -> String -> a -> Eff (electron :: ELECTRON | eff) Unit
```

#### `onDidFinishLoad`

``` purescript
onDidFinishLoad :: forall eff. WebContents -> Eff (electron :: ELECTRON | eff) Unit -> Eff (electron :: ELECTRON | eff) Unit
```


