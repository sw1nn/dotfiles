-- xmonad.hs
-- XMonad config file - sean.escriva@gmail.com
--
import XMonad
-- Hooks
import XMonad.Hooks.DynamicLog hiding (xmobar, xmobarPP, xmobarColor, sjanssenPP, byorgeyPP)
import XMonad.Hooks.UrgencyHook (withUrgencyHook, NoUrgencyHook(..), focusUrgent)
import XMonad.Hooks.ManageDocks (avoidStruts, manageDocks, ToggleStruts(..))
import XMonad.Hooks.ManageHelpers (isFullscreen, isDialog, doFullFloat, doCenterFloat)
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops
-- Actions
import XMonad.Actions.CycleWS (nextScreen, prevScreen, shiftNextScreen, shiftPrevScreen, toggleWS, Direction1D(..), WSType(..), findWorkspace)
import XMonad.Actions.WindowGo (title, raiseMaybe, runOrRaise) --, (=?))
import XMonad.Actions.UpdatePointer
-- Utils
import XMonad.Util.Run (safeSpawn, unsafeSpawn, runInTerm, spawnPipe)
import XMonad.Util.EZConfig hiding (additionalMouseBindings, removeMouseBindings)
import XMonad.Util.Scratchpad (scratchpadSpawnAction, scratchpadManageHook, scratchpadFilterOutWorkspace)
import XMonad.Util.WorkspaceCompare (getSortByIndex)
-- Layouts
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Layout.ResizableTile (ResizableTall(..))
import XMonad.Layout.Grid (Grid(..))
import XMonad.Layout.Magnifier (magnifiercz)
import XMonad.Layout.PerWorkspace (onWorkspace)
import XMonad.Layout.IM
import XMonad.Layout.Reflect (reflectHoriz)
import XMonad.Layout.Named

-- Prompt
-- import XMonad.Prompt

import System.IO (hPutStrLn)
import Data.Char (isSpace)
import qualified XMonad.StackSet as W
import qualified Data.Map        as M

-- import Graphics.X11.ExtraTypes.XF86

-- basic colors
cyan = "#00a0df"

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

-- fonts
barFont  = "terminus"
barXFont = "inconsolata:size=10"
xftFont  = "xft: inconsolata-10"

myWorkspaces    = ["1:web","2:edit","3:term","4","5:art","6","7","8:IM","9:music"]


statusBarCmd = "dzen2" ++
               " -bg '" ++ soBackground ++ "'" ++
               " -fg '" ++ soBrightBlue ++ "'" ++
               " -sa c" ++
               " -fn '" ++ barXFont ++ "'" ++
               " -w 1300 -x 0 -y 0 -ta l -expand r -e ''" ++
               " -xs 1"

mTerm    = "urxvtc"

smePP = defaultPP
        { ppCurrent = dzenColor soBrightRed soBackground . wrap "" ""
        , ppVisible = dzenColor soBrightBlue soBackground . wrap "" ""
        , ppSep     = dzenColor soWhite soBackground " ^r(1x8) "
        , ppUrgent  = dzenColor soBackground soYellow . wrap "[" "]"
        , ppTitle   = dzenColor soWhite "" . trim
        }

standardLayouts = Mirror tiled |||
                  defaultTall  |||
                  Full         |||
                  messaging
                where
                  tiled         = Tall nmaster delta ratio
                  defaultTall   = ResizableTall 1 (3/100) (1/2) []
                  nmaster       = 1
                  ratio         = toRational (2/(1 + sqrt 5 :: Double)) -- golden ratio
                  delta         = 0.03

-- grids = magnifiercz 1.2 (GridRatio (4/3)) |||
--         GridRatio (4/3)

gimp     = reflectHoriz $
           named "Gimp" $
           withIM (11/64) (Role "gimp-toolbox") $
           ResizableTall 2 (1/118) (11/20) [5/4,5/4,5/4]

messaging = named "Messaging" $
            withIM (1/8) (Role "buddy_list") Grid

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- launch a terminal
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)

    -- launch dmenu
    , ((modm,               xK_p     ), spawn "yeganesh")

    -- launch gmrun
    , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")

    -- close focused window
    , ((modm .|. shiftMask, xK_c     ), kill)

     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)

    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )

    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window and the master window
    , ((modm,               xK_Return), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)

    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    , ((modm              , xK_b     ), sendMessage ToggleStruts)

    -- Quit xmonad
    --, ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")

    , ((0 , xK_F4), spawn "amixer -q set Master toggle")
    , ((0 , xK_F5), spawn "amixer -q set Master 1000- unmute")
    , ((0 , xK_F6), spawn "amixer -q set Master 1000+ unmute")
    , ((0 , xK_F7), spawn "googleplay-ctl prev")
    , ((0 , xK_F8), spawn "googleplay-ctl pause-play")
    , ((0 , xK_F9), spawn "googleplay-ctl next")
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

-- smeMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
--     -- mod-button1, Set the window to floating mode and move by dragging
--     [ ((modMask, button1), (\w -> focus w >> mouseMoveWindow w))
--     -- mod-button2, Raise the window to the top of the stack
--     , ((modMask, button2), (\w -> focus w >> windows W.swapMaster))
--     -- mod-button3, Set the window to floating mode and resize by dragging
--     , ((modMask, button3), (\w -> focus w >> mouseResizeWindow w))
--     -- cycle through workspaces
--     , ((controlMask .|. modMask, button4), nextScreen)
--     , ((controlMask .|. modMask, button5), prevScreen)
--     ]

smeManageHook :: ManageHook
smeManageHook = composeAll
              [ resource  =? "desktop_window" --> doIgnore
              , className =? "MPlayer" --> doFloat
              , className =? "Pidgin"  --> doShift "8:IM"
              , title     =? "RescueTime Offline Time" --> doFloat
              , isFullscreen           --> doFullFloat
              , isDialog               --> doCenterFloat
              ] <+> manageDocks

smeLogHook h = do
           dynamicLogWithPP $ smePP { ppOutput = hPutStrLn h }

smeConfig = defaultConfig
       { terminal = "urxvtc"
       , focusFollowsMouse      = False
       , modMask                = mod3Mask -- command key
       , focusedBorderColor     = soGreen
       , workspaces             = myWorkspaces
       , layoutHook             = avoidStruts $
                                  smartBorders (
                                               onWorkspace "5-art" gimp standardLayouts
                                               )
       , keys                   = myKeys
       , manageHook             = smeManageHook
       -- , mouseBindings          = smeMouseBindings
       }

strutsKey XConfig { XMonad.modMask = modMask } = (modMask, xK_b)

-- Main
main = do
     h <- spawnPipe statusBarCmd
     xmonad $ withUrgencyHook NoUrgencyHook $ ewmh smeConfig { logHook = smeLogHook h }
