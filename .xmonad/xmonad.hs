-- XMonad config file - sean.escriva@gmail.com
--
import XMonad hiding (Tall)
-- Hooks
import XMonad.Hooks.DynamicLog hiding (xmobar, xmobarPP, xmobarColor, sjanssenPP, byorgeyPP)
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.ManageDocks (avoidStruts, manageDocks, ToggleStruts(..))
import XMonad.Hooks.ManageHelpers (isDialog, doCenterFloat)
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName

-- Actions
-- import XMonad.Actions.CycleWS (nextScreen, prevScreen, shiftNextScreen, shiftPrevScreen, toggleWS, Direction1D(..), WSType(..), findWorkspace)
-- import XMonad.Actions.UpdatePointer
-- Utils
import XMonad.Actions.Search (google, wikipedia, selectSearch, promptSearch)
import XMonad.Util.Run (safeSpawn, unsafeSpawn, runInTerm, spawnPipe)
import XMonad.Util.Scratchpad (scratchpadSpawnActionTerminal, scratchpadManageHook, scratchpadFilterOutWorkspace)
import XMonad.Util.WorkspaceCompare(getSortByIndex)
-- Layouts
import XMonad.Layout.NoBorders (smartBorders, noBorders)
import XMonad.Layout.ResizableTile (ResizableTall(..))
import XMonad.Layout.HintedTile
import XMonad.Layout.Grid (Grid(..))
import XMonad.Layout.StackTile(StackTile(..))
import XMonad.Layout.PerWorkspace (onWorkspace)
import XMonad.Layout.IM
import XMonad.Layout.Reflect (reflectHoriz)
import XMonad.Layout.Named
import XMonad.Layout.Tabbed
import XMonad.Layout.HintedTile
import XMonad.Prompt
import System.Exit
import Control.Monad (liftM2)
import Graphics.X11.ExtraTypes.XF86

-- Prompt
-- import XMonad.Prompt

import System.IO (hPutStrLn)
import Data.Ratio ((%))
import qualified XMonad.StackSet as W
import qualified Data.Map        as M


myManageHook =
  scratchpadManageHook (W.RationalRect 0.4 0.5 0.6 0.4) <+>
  manageDocks <+>
  (composeAll . concat $
   [ [role       =? r --> doFloat       | r <- myRoleFloats]
   , [className  =? c --> doCenterFloat | c <- myCenterFloats]
   , [title      =? t --> doFloat       | t <- myTFloats]
   , [resource   =? r --> doFloat       | r <- myRFloats]
   , [resource   =? i --> doIgnore      | i <- myIgnores]
   , [(role      =? x <||> className =? x <||> title =? x <||> resource =? x) --> doShift      "1:web"   | x <- my1Shifts]
   , [(role      =? x <||> className =? x <||> title =? x <||> resource =? x) --> doShift      "2:edit"  | x <- my2Shifts]
   , [(role      =? x <||> className =? x <||> title =? x <||> resource =? x) --> doShift      "4:virt"  | x <- my4Shifts]
   , [(role      =? x <||> className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "5:gimp"  | x <- my5Shifts]
   , [(role      =? x <||> className =? x <||> title =? x <||> resource =? x) --> doShift      "6:"      | x <- my6Shifts]
   , [(role      =? x <||> className =? x <||> title =? x <||> resource =? x) --> doShift      "7:"      | x <- my7Shifts]
   , [(role      =? x <||> className =? x <||> title =? x <||> resource =? x) --> doShift      "8:im"    | x <- my8Shifts]
   , [(role      =? x <||> className =? x <||> title =? x <||> resource =? x) --> doShift      "9:music" | x <- my9Shifts]
   , [(role      =? x <||> className =? x <||> title =? x <||> resource =? x) --> doShift      "3:term"  | x <- my3Shifts]
   , [isDialog        --> doCenterFloat]
   ])
  where
    doShiftAndGo = doF . liftM2 (.) W.greedyView W.shift
    myRoleFloats = ["pop-up"]
    myCenterFloats = ["XGalaga", "Galculator", "Pinentry"]
    myTFloats = ["RescueTime Offline Time",
                 "Google+ Hangouts is sharing your screen with plus.google.com.",
                 "appear.in screen sharing is sharing your screen with appear.in.",
                 "LastPass: Free Password Manager",
                 "Hangouts - neale@mastodonc.com"]
    myRFloats = []
    myIgnores = ["desktop_window", "Xfce4-notifyd"]
    my1Shifts = ["browser"]
    my2Shifts = ["Emacs", "REmacs"]
    my3Shifts = ["Gnome-terminal", "st-256color"]
    my4Shifts = ["VirtualBox"]
    my5Shifts = ["Gimp"]
    my6Shifts = ["Eagle"]
    my7Shifts = []
    my8Shifts = ["Pidgin", "Skype", "Irc", "Slack", "Linphone",
                 "crx_knipolnnllmklapflnccelgolnpehhpl"]
    my9Shifts = ["play.google.com__music","Spotify","AudibleManager"]
    role = stringProperty "WM_WINDOW_ROLE"

-- solarized
soBackground         = "#002b36"
soForeground         = "#839496"
soBlack              = "#073642"
soRed                = "#dc322f"
soGreen              = "#859900"
soYellow             = "#b58900"
soBlue               = "#268bd2"
soMagenta            = "#d33682"
soCyan               = "#2aa198"
soWhite              = "#eee8d5"

soBrightBlack        = "#002b36"
soBrightRed          = "#cb4b16"
soBrightGreen        = "#586e75"
soBrightYellow       = "#657b83"
soBrightBlue         = "#839496"
soBrightMagenta      = "#6c71c4"
soBrightCyan         = "#93a1a1"
soBrightWhite        = "#fdf6e3"

colorNormalBorder    = soCyan
colorFocusedBorder   = soBrightCyan

transBackground      = "[75]" ++ soBackground
barFont = "aldrich-11"

myWorkspaces    = ["1:web","2:edit","3:term","4","5:gimp","6:aterm","7","8:im","9:music"]

statusBarCmd = "dzen2" ++
               " -o 100" ++
               " -bg '" ++ soBackground ++ "'" ++
               " -fg '" ++ soBrightBlue ++ "'" ++
               " -sa c" ++
               " -fn '" ++ barFont ++ "'" ++
               " -w 1920 -x 0 -y 0 -ta l -expand r -e ''" ++
               " -xs 1"

myTerminal           = "st"
myScratchpadTerminal = "scratchpad"

nwsPP h = defaultPP
        { ppSort    = fmap (.scratchpadFilterOutWorkspace) getSortByIndex
        , ppCurrent = dzenColor soBrightRed soBackground . wrap "" ""
        , ppVisible = dzenColor soBrightBlue soBackground . wrap "" ""
        , ppSep     = dzenColor soWhite soBackground " ^r(1x8) "
        , ppUrgent  = dzenColor soBackground soYellow . wrap "[" "]"
        , ppTitle   = dzenColor soWhite "" . shorten 96
        , ppOutput  = hPutStrLn h
        , ppLayout  = dzenColor soWhite "" .
            (\x -> case x of
                "Mirror Tall"-> pad "^i(/home/neale/dotfiles/icons/layout-mirror-black.xbm)"
                "Messaging"  -> pad "^i(/home/neale/dotfiles/icons/layout-im.xbm)"
                "Gimp"       -> pad "^i(/home/neale/dotfiles/icons/layout-gimp.xbm)"
                "Full"       -> pad "^i(/home/neale/dotfiles/icons/layout-full.xbm)"
                _            -> pad $ shorten 10 x)}


myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm .|. shiftMask,   xK_Return ), spawn $ myTerminal)
    , ((modm,                 xK_p      ), spawn "yeganesh_run")
    , ((modm .|. shiftMask,   xK_p      ), spawn "gmrun")
    , ((modm,                 xK_grave  ), scratchpadSpawnActionTerminal $ myScratchpadTerminal)
    , ((modm,                 xK_a      ), focusUrgent)
    , ((modm .|. shiftMask,   xK_c      ), kill)
    , ((modm,                 xK_space  ), sendMessage NextLayout)
    , ((modm .|. shiftMask,   xK_space  ), setLayout $ XMonad.layoutHook conf)
    , ((modm,                 xK_n      ), refresh)
    , ((modm,                 xK_Tab    ), windows W.focusDown)
    , ((modm,                 xK_j      ), windows W.focusDown)
    , ((modm,                 xK_k      ), windows W.focusUp)
    , ((0,                    xK_Pause  ), spawn "lock-screen")
    , ((modm,                 xK_m      ), windows W.focusMaster)
    , ((modm,                 xK_Return ), windows W.swapMaster)
    , ((modm .|. shiftMask,   xK_j      ), windows W.swapDown)
    , ((modm .|. shiftMask,   xK_k      ), windows W.swapUp)
    , ((modm,                 xK_h      ), sendMessage Shrink)
    , ((modm,                 xK_l      ), sendMessage Expand)
    , ((modm,                 xK_t      ), withFocused $ windows . W.sink)
    , ((modm .|. controlMask, xK_t      ), spawn "thunar")
    , ((modm,                 xK_comma  ), sendMessage (IncMasterN 1))
    , ((modm,                 xK_period ), sendMessage (IncMasterN (-1)))
    , ((modm,                 xK_a      ), spawn "volume-ctl toggle-control")
    , ((modm,                 xK_b      ), sendMessage ToggleStruts)
    , ((modm .|. shiftMask,   xK_g      ), promptSearch defaultXPConfig google)
    , ((modm .|. controlMask, xK_g      ), selectSearch google)
    , ((modm,                 xK_q      ), spawn "xmonad --recompile; xmonad --restart")
    , ((0,                    xK_F4     ), spawn "volume-ctl mute")
    , ((modm,                 xK_F4     ), spawn "google-hangout-ctl toggle-mute")
    , ((0,                    xK_F5     ), spawn "volume-ctl volume-down")
    , ((0,                    xK_F6     ), spawn "volume-ctl volume-up")
    , ((0,                    xF86XK_AudioLowerVolume), spawn "volume-ctl volume-down")
    , ((0,                    xF86XK_AudioRaiseVolume), spawn "volume-ctl volume-up")
    , ((0,                    xK_F7     ), spawn "spotify-ctl prev")
    , ((0,                    xK_F8     ), spawn "spotify-ctl toggle-pause")
    , ((0,                    xK_F9     ), spawn "spotify-ctl next")
    , ((modm .|. shiftMask,   xK_equal  ), spawn "browser http://plus.google.com")
    , ((modm .|. shiftMask,   xK_s ), spawn "sleep 0.2; scrot -s -e 'mv $f ~/screenshots/'")
    , ((modm .|. shiftMask .|. controlMask, xK_s ), spawn "sleep 0.2; scrot -e 'mv $f ~/screenshots/'")
    ]
    ++
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_r, xK_e] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

nwsLogHook h = do
  dynamicLogWithPP $ nwsPP h

myTheme =
  defaultTheme { decoHeight = 16
               , activeColor = "#a6c292"
               , activeBorderColor = "#a6c292"
               , activeTextColor = "#000000"
               , inactiveBorderColor = "#000000"
               }

myLayoutHook =
  onWorkspace "1:web" webL $
  onWorkspace "2:edit" full $
  onWorkspace "3:term" termL $
  onWorkspace "5:gimp" gimpL $
  onWorkspace "6:aterm" termL $
  onWorkspace "8:im" imL $
  onWorkspace "9:music" full $
  standardLayouts
  where
    standardLayouts =
      (tiled |||
       Mirror tiled |||
       full)

    full = noBorders Full

    tiled =
      (HintedTile 1 (1/10) (1/3) TopLeft Tall)

    webL =
      tabLayout  ||| tiled ||| full

    termL = standardLayouts ||| Grid

    tabLayout =
      smartBorders (tabbed shrinkText myTheme)

    chatLayout = StackTile 1 (3/100) (1/2)

    imL =
      named "Messaging" $
      withIM ratio hangoutsRoster $
      reflectHoriz $
      withIM ircRatio irc chatLayout
      where ratio = (1%7)
            ircRatio = (1%2)
            hangoutsRoster  = And (ClassName "crx_knipolnnllmklapflnccelgolnpehhpl") (Role "app")
            irc  = Title "Irc"

    gimpL =
      named "Gimp" $
      withIM (0.11) (Role "gimp-toolbox") $
      reflectHoriz $
      withIM (0.15) (Role "gimp-dock") Full


nwsConfig = defaultConfig
       { terminal               = myTerminal
       , focusFollowsMouse      = False
       , modMask                = mod3Mask -- command key
       , focusedBorderColor     = soGreen
       , workspaces             = myWorkspaces
       , layoutHook             = avoidStruts myLayoutHook
       , keys                   = myKeys
       , manageHook             = myManageHook
       -- , mouseBindings          = smeMouseBindings
       }


-- Main
main = do
     h <- spawnPipe statusBarCmd
     xmonad $ withUrgencyHook NoUrgencyHook
            $ ewmh nwsConfig { logHook = nwsLogHook h }
