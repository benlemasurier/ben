import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Grid
import XMonad.Util.NamedWindows
import XMonad.Util.Scratchpad
import XMonad.Util.EZConfig

myTerminal = "alacritty"
-- myTerminal = "urxvt"
myLockScreen = "xwobf /tmp/.lock.png && i3lock -i /tmp/.lock.png"
myLauncher = "rofi -show run"

manageScratchPad :: ManageHook
manageScratchPad = scratchpadManageHookDefault

myManageHook = composeAll
    [ resource  =? "desktop_window" --> doIgnore
    , className =? "Gimp"           --> doFloat]


myLayout = avoidStruts (
    spacing 5 $ 
        Tall 1 (3/100) (1/2) |||
        ThreeColMid 1 (3/100) (1/2) |||
        Full |||
        Grid)

myNormalBorderColor  = "#2c3642"
myFocusedBorderColor = "#ffffff"
myBorderWidth = 1

main = do
  xmonad $ defaults {
        manageHook = manageDocks <+> myManageHook
  }

defaults = defaultConfig {
    terminal           = myTerminal,
    borderWidth        = myBorderWidth,
    normalBorderColor  = myNormalBorderColor,
    focusedBorderColor = myFocusedBorderColor,

    layoutHook         = smartBorders $ myLayout,
    manageHook         = manageScratchPad <+> myManageHook,
    handleEventHook    = XMonad.Hooks.EwmhDesktops.fullscreenEventHook <+> docksEventHook
} `additionalKeysP`
    [ ("M-s",   scratchpadSpawnActionTerminal $ "urxvt" )
    , ("M-S-l", spawn myLockScreen)
    , ("M-p",   spawn myLauncher)
    , ("<XF86AudioMute>",   spawn "amixer set Master toggle")
    , ("<XF86AudioLowerVolume>",  spawn "amixer set Master 1- unmute")
    , ("<XF86AudioRaiseVolume>",  spawn "amixer set Master 1+ unmute")
    , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 5")
    , ("<XF86MonBrightnessUp>",   spawn "xbacklight -inc 5")
    ]
