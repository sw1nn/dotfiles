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

smeKeys :: [([Char], X ())]
smeKeys =
    [ ("M-p"        , safeSpawn "yeganesh_run" [])
    , ("M-g"        , runOrRaise "thunar" (className =? "Thunar"))
    , ("M-s"        , runOrRaise "skype"    (className =? "Skype"))
    , ("M-m"        , safeSpawn "mumble" [] )
    -- , ("M-S-g"      , safePromptSelection "firefox-nightly")
    -- , ("M-w"        , goToSelected defaultGSConfig)
    -- , ("M-C-n"      , appendFilePrompt largeXPConfig { bgColor = colorOrange, fgColor = colorDarkGray } notesFile)
    , ("M-`"    , focusUrgent)
    , ("M-i"    , raiseMaybe (runInTerm "-title irssi" "sh -c 'tmux -D -R -S irc irssi'") (title =? "irssi"))
    -- , ("M-S-i"  , raiseMaybe (runInTerm "-title irssi" "sh -c 'ssh -t webframp@astrotrain screen -D -R -S irc irssi'") (title =? "irssi"))
    -- , ("M-m"    , raiseMaybe (runInTerm "-title mutt" "sh -c 'screen -D -R -S mail mutt'") (title =? "mutt"))
    , ("M-b"    , sendMessage ToggleStruts)
    -- move window to and focus NonEmpty wss except scratchpad
    , ("M-C-s"    , shiftAndView Next)
    , ("M-C-d"    , shiftAndView Prev)
    , ("M-f"      , nextScreen)
    , ("M-a"      , prevScreen)
    , ("M-S-f"    , shiftNextScreen)
    , ("M-S-a"    , shiftPrevScreen)
    , ("M-<Tab>"  , toggleWS)
    , ("M--"      , toggleWS)
    -- Media keys
    , ("<F4>", unsafeSpawn "amixer -q set Master toggle")
    , ("<F5>", unsafeSpawn "amixer -q set Master 1000- unmute")
    , ("<F6>", unsafeSpawn "amixer -q set Master 1000+ unmute")
    -- Screenshot
    , ("<XF86LaunchA>" , unsafeSpawn "scrot '%Y-%m-%d-%H%M_$wx$h.png' -e 'mv $f ~/screenshots/'")
    , ("<XF86LaunchB>" , unsafeSpawn "scrot '%Y-%m-%d-%H%M_$wx$h.png' -e '/usr/bin/imgurbash $f'")
    , ("<XF86MonBrightnessUp>", unsafeSpawn "xbacklight -inc 5")
    , ("<XF86MonBrightnessDown>", unsafeSpawn "xbacklight -dec 5")
    , ("<XF86KbdBrightnessUp>", unsafeSpawn "xbacklight -dec 5")
    , ("<XF86KbdBrightnessDown>", unsafeSpawn "xbacklight -dec 5")
    ]
    where -- | non-empty workspaces less scratchpad
        shiftAndView dir = findWorkspace getSortByIndexNoSP dir NonEmptyWS 1
                >>= \t -> (windows . W.shift $ t) >> (windows . W.greedyView $ t)
        getSortByIndexNoSP =
                fmap (.scratchpadFilterOutWorkspace) getSortByIndex


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
       , manageHook             = smeManageHook
       -- , mouseBindings          = smeMouseBindings
       }
       `additionalKeysP` smeKeys

strutsKey XConfig { XMonad.modMask = modMask } = (modMask, xK_b)

-- Main
main = do
     h <- spawnPipe statusBarCmd
     xmonad $ withUrgencyHook NoUrgencyHook $ ewmh smeConfig { logHook = smeLogHook h }
