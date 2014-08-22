-- XMonad config file - sean.escriva@gmail.com
--
import XMonad
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
import XMonad.Layout.Grid (Grid(..))
import XMonad.Layout.StackTile(StackTile(..))
import XMonad.Layout.PerWorkspace (onWorkspace)
import XMonad.Layout.IM
import XMonad.Layout.Reflect (reflectHoriz)
import XMonad.Layout.Named
import XMonad.Layout.Tabbed
import XMonad.Prompt
import System.Exit
import Control.Monad (liftM2)

-- Prompt
-- import XMonad.Prompt

import System.IO (hPutStrLn)
import Data.Ratio ((%))
import qualified XMonad.StackSet as W
import qualified Data.Map        as M

-- import Graphics.X11.ExtraTypes.XF86

-- solarized
soBackground         = "#002b36"
soForeground         = "#657b83"
soBlack              = "#073642"
soBrightBlack        = "#002b36"
soRed                = "#dc322f"
soBrightRed          = "#cb4b16"
soGreen              = "#859900"
soBrightGreen        = "#586e75"
soYellow             = "#b58900"
soBrightYellow       = "#657b83"
soBlue               = "#268bd2"
soBrightBlue         = "#839496"
soMagenta            = "#d33682"
soBrightMagenta      = "#6c71c4"
soCyan               = "#2aa198"
soBrightCyan         = "#93a1a1"
soWhite              = "#eee8d5"
soBrightWhite        = "#fdf6e3"

colorNormalBorder    = soGreen
colorFocusedBorder   = soBrightGreen

transBackground      = "[75]" ++ soBackground
barFont = "aldrich-11"

myWorkspaces    = ["1:web","2:edit","3:term","4:virt","5:gimp","6","7","8:im","9:music"]

statusBarCmd = "dzen2" ++
               " -bg '" ++ soBackground ++ "'" ++
               " -fg '" ++ soBrightBlue ++ "'" ++
               " -sa c" ++
               " -fn '" ++ barFont ++ "'" ++
               " -w 1920 -x 0 -y 0 -ta l -expand r -e ''" ++
               " -xs 2"

nwsUrgencyHook = withUrgencyHook dzenUrgencyHook {args = ["-xs", "1", "-fg", soBrightBlue]}

myTerminal           = "gnome-terminal"
myScratchpadTerminal = "scratchpad"

nwsPP h = defaultPP
        { ppSort    = fmap (.scratchpadFilterOutWorkspace) getSortByIndex
        , ppCurrent = dzenColor soBrightRed soBackground . wrap "" ""
        , ppVisible = dzenColor soBrightBlue soBackground . wrap "" ""
        , ppSep     = dzenColor soWhite soBackground " ^r(1x8) "
        , ppUrgent  = dzenColor soBackground soYellow . wrap "[" "]"
        , ppTitle   = dzenColor soWhite "" . trim
        , ppOutput  = hPutStrLn h
        , ppLayout  = dzenColor soWhite "" .
            (\x -> case x of
                "Mirror Tall"-> pad "^i(/home/neale/dotfiles/icons/layout-mirror-black.xbm)"
                "Messaging"  -> pad "^i(/home/neale/dotfiles/icons/layout-im.xbm)"
                "Gimp"       -> pad "^i(/home/neale/dotfiles/icons/layout-gimp.xbm)"
                "Full"       -> pad "^i(/home/neale/dotfiles/icons/layout-full.xbm)"
                _            -> pad $ shorten 10 x)}

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
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
    , ((modm,                 xK_b      ), sendMessage ToggleStruts)
    , ((modm .|. shiftMask,   xK_g      ), promptSearch defaultXPConfig google)
    , ((modm .|. controlMask, xK_g      ), selectSearch google)
    , ((modm,                 xK_q      ), spawn "xmonad --recompile; xmonad --restart")
    , ((0,                    xK_F4     ), spawn "volume-ctl mute")
    , ((0,                    xK_F5     ), spawn "volume-ctl volume-down")
    , ((0,                    xK_F6     ), spawn "volume-ctl volume-up")
    , ((0,                    xK_F7     ), spawn "spotify-ctl prev")
    , ((0,                    xK_F8     ), spawn "spotify-ctl toggle-pause")
    , ((0,                    xK_F9     ), spawn "spotify-ctl next")
    , ((modm .|. shiftMask,   xK_equal  ), spawn "browser http://plus.google.com")
    , ((0,                    xK_Print  ), spawn "sleep 0.2; scrot -s -e 'mv $f ~/screenshots/'")
    ]
    ++
    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_e, xK_r, xK_w] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

eagle = className =? "Eagle" --> do
  doShift "6:"

myManageHook = scratchpadManageHook (W.RationalRect 0.4 0.5 0.6 0.4) <+>
               manageDocks <+>
               eagle       <+>
               (composeAll . concat $
    [ [isDialog        --> doCenterFloat]
    , [role       =? r --> doFloat  | r <- myRoleFloats]
    , [className  =? c --> doFloat  | c <- myCFloats]
    , [title      =? t --> doFloat  | t <- myTFloats]
    , [resource   =? r --> doFloat  | r <- myRFloats]
    , [resource   =? i --> doIgnore | i <- myIgnores]
    , [(className =? x <||> title =? x <||> resource =? x) --> doShift      "1:web"   | x <- my1Shifts]
    , [(className =? x <||> title =? x <||> resource =? x) --> doShift      "2:edit"  | x <- my2Shifts]
    , [(className =? x <||> title =? x <||> resource =? x) --> doShift      "4:virt"  | x <- my4Shifts]
    , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "5:gimp"  | x <- my5Shifts]
    , [(className =? x <||> title =? x <||> resource =? x) --> doShift      "6:"      | x <- my6Shifts]
    , [(className =? x <||> title =? x <||> resource =? x) --> doShift      "7:"      | x <- my7Shifts]
    , [(className =? x <||> title =? x <||> resource =? x) --> doShift      "8:im"    | x <- my8Shifts]
    , [(className =? x <||> title =? x <||> resource =? x) --> doShift      "9:music" | x <- my9Shifts]
    -- put this at the end in case we have terms with 'custom' class picked up above (e.g. Irc)
    , [(className =? x <||> title =? x <||> resource =? x) --> doShift      "3:term"  | x <- my3Shifts]
    ])
    where
    doShiftAndGo = doF . liftM2 (.) W.greedyView W.shift
    myRoleFloats = ["pop-up"]
    myCFloats    = ["MPlayer", "Nitrogen", "Sysinfo", "Galculator", "XFontSel", "Thunar", "dzen2"]
    myTFloats    = ["Downloads", "Save As...", "RescueTime Offline Time"]
    myRFloats    = []
    myIgnores    = ["desktop_window", "kdesktop"]
    my1Shifts    = ["Google-chrome-stable"]
    my2Shifts    = ["Emacs"]
    my3Shifts    = ["gnome-terminal"]
    my4Shifts    = ["VirtualBox", "Wine"]
    my5Shifts    = ["Gimp"]
    my6Shifts    = []
    my7Shifts    = []
    my8Shifts    = ["Pidgin", "Skype", "Irc"]
    my9Shifts    = ["play.google.com__music","Spotify"]
    role         = stringProperty "WM_WINDOW_ROLE"

nwsLogHook h = do
           dynamicLogWithPP $ nwsPP h

myTheme = defaultTheme { decoHeight = 16
                        , activeColor = "#a6c292"
                        , activeBorderColor = "#a6c292"
                        , activeTextColor = "#000000"
                        , inactiveBorderColor = "#000000"
                        }

myLayoutHook = onWorkspace "1:web" webL $
               onWorkspace "2:edit" fullL $
               onWorkspace "5:gimp" gimpL $
               onWorkspace "4:virt" fullL $
               onWorkspace "8:im" imL $
               onWorkspace "9:music" fullL $
               standardLayouts
   where
        standardLayouts =   avoidStruts  $ (tiled |||
                                            reflectTiled |||
                                            Mirror tiled |||
                                            Grid |||
                                            full)
        --Layouts
        tiled        = smartBorders (ResizableTall 1 (2/100) (1/2) [])
        reflectTiled = (reflectHoriz tiled)
        tabLayout    = (tabbed shrinkText myTheme)
        full         = noBorders Full
        chatLayout   = StackTile 1 (3/100) (1/2)
        --Im Layout
        imL = named "Messaging" $
              avoidStruts $
              smartBorders $
              withIM ratio pidginRoster $
              reflectHoriz $
              withIM ircRatio irc chatLayout
          where
            ratio = (1%7)
            ircRatio = (1%2)
            pidginRoster    = And (ClassName "Pidgin") (Role "buddy_list")
            irc  = Title "Irc"

        --Gimp Layout
        gimpL = named "Gimp" $
                avoidStruts $
                smartBorders $
                withIM (0.11) (Role "gimp-toolbox") $
                reflectHoriz $
                withIM (0.15) (Role "gimp-dock") Full

        --Web Layout
        webL      = avoidStruts $  tabLayout  ||| tiled ||| reflectHoriz tiled |||  full

        --VirtualLayout
        fullL = avoidStruts $ full

myStartupHook = setWMName "LG3D"

nwsConfig = defaultConfig
       { terminal               = myTerminal
       , focusFollowsMouse      = False
       , modMask                = mod3Mask -- command key
       , focusedBorderColor     = soGreen
       , workspaces             = myWorkspaces
       , layoutHook             = myLayoutHook
       , keys                   = myKeys
       , manageHook             = myManageHook
       , startupHook            = myStartupHook
       -- , mouseBindings          = smeMouseBindings
       }


-- Main
main = do
     h <- spawnPipe statusBarCmd
     xmonad $ nwsUrgencyHook $ ewmh nwsConfig { logHook = nwsLogHook h }
