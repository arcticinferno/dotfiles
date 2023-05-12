import XMonad

-- General
import Data.Maybe (isJust)

-- Qualified
import qualified XMonad.StackSet as W

-- Hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks

-- Util
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Run (ProcessConfig(emacs), spawnPipe)
import XMonad.Util.Ungrab ()

import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Layout.Simplest
import XMonad.Layout.SubLayouts

-- Layout
import XMonad.Layout.Spacing

-- System
import System.IO

type Keybind = (String, X ())

(<:>) :: String -> String -> Keybind
(<:>) x y = (x, spawn y)

implSpace i = spacingRaw False (Border i i i i) True (Border i i i i) True

xMod :: KeyMask
xMod = mod1Mask -- Alt

xBrowser :: Keybind
xBrowser = "M-u" <:> "kitty -e w3m -no-cookie https://duckduckgo.com/"

xScreenshot :: Keybind
xScreenshot = "M-h" <:> "flameshot gui"

xKB_CAVAL :: Keybind
xKB_CAVAL = "M-S-d f" <:> "kitty -e cava"

xYT :: Keybind
xYT = "M-S-h" <:> "~/.local/bin/youtube-scrape"

xTerminal :: Keybind
xTerminal = "M-S-<Return>" <:> "kitty -e tmux"

xLauncher :: Keybind
xLauncher = "M-p" <:> "rofi -show drun"

switchLang :: Keybind
switchLang = "M-v" <:> "~/.local/bin/switchlang"

xMusic :: Keybind
xMusic = "M-S-u" <:> "kitty -e \"ncmpcpp\""

xDoc :: Keybind
xDoc =
  "M-S-f" <:>
  "zathura ~/doc/$(/bin/ls ~/doc | rofi -dmenu -p \"Open: \") || return"

xEditFile :: Keybind
xEditFile = "M-f" <:> "~/.local/bin/fx"

xLayout =
  avoidStruts $
  smartBorders $
  subLayout [] (smartBorders Simplest) $ implSpace 10 $ layoutHook def

main = do
  xmproc0 <- spawnPipe "xmobar -x 0 ~/.xmobarrc -d"
  xmproc1 <- spawnPipe "xmobar -x 1 ~/.xmobarrc -d"
  xmproc2 <- spawnPipe "xmobar -x 2 ~/.xmobarrc -d"
  xmonad $
    docks $
    ewmhFullscreen $
    ewmh $
    def
      { borderWidth = 2
      , normalBorderColor = "#cccccc"
      , workspaces =
          [ " λ-dev "
          , " λ-sys "
          , " λ-music "
          , " λ-www "
          , " λ-vid "
          , " λ-doc "
          , " λ-gimp "
          , " λ-kvm "
          , " λ-game "
          ]
      , focusedBorderColor = "#cd8b00"
      , manageHook = manageDocks <+> manageHook def
      , layoutHook = avoidStruts $ xLayout -- Add spacing with 10 pixels
      , logHook =
          do let ppOutput' x =
                   hPutStrLn xmproc0 x >> hPutStrLn xmproc1 x >>
                   hPutStrLn xmproc2 x
             dynamicLogWithPP
               xmobarPP
                 { ppOutput = ppOutput'
                 , ppTitle = const "" -- This line has been changed to hide the active program title
                 , ppCurrent = xmobarColor "#ff6b6b" "" . id
                 , ppVisible = xmobarColor "#ff9ff3" "" . id
                 , ppHidden = xmobarColor "#80c8ff" "" . id
                 , ppHiddenNoWindows = xmobarColor "#80c8ff" "" . id
                 , ppSep = "   "
                 , ppWsSep = " "
                 }
      } `additionalKeysP`
    [ xBrowser
    , xLauncher
    , xTerminal
    , xMusic
    , xDoc
    , xScreenshot
    , xEditFile
    , switchLang
    , xYT
    , xKB_CAVAL
    ]
