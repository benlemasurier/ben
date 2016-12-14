import System.IO
import System.Exit
import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Grid
import XMonad.Util.NamedWindows
import XMonad.Util.Scratchpad
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig
import qualified XMonad.StackSet as W
import qualified Data.Map        as M

myTerminal = "urxvt"
myScreensaver = "xscreensaver-command -lock"
myLauncher = "rofi -show run"

manageScratchPad :: ManageHook
manageScratchPad = scratchpadManageHookDefault

-- Workspaces
myWorkspaces = ["1","2","3","4","5","6","7","8"]

------------------------------------------------------------------------
-- Window rules
-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
myManageHook = composeAll
    [ resource  =? "desktop_window" --> doIgnore
    , className =? "Gimp"           --> doFloat
    , isFullscreen --> (doF W.focusDown <+> doFullFloat)]


------------------------------------------------------------------------
-- Layouts
myLayout = avoidStruts (
    spacing 5 $ 
	    Tall 1 (3/100) (1/2) |||
	    ThreeColMid 1 (3/100) (1/2) |||
	    Full |||
	    Grid)

myNormalBorderColor  = "#2c3642"
myFocusedBorderColor = "#ffffff"
myBorderWidth = 1

------------------------------------------------------------------------
-- Key bindings
myModMask = mod1Mask

myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
  -- Start a terminal.  Terminal to start is specified by myTerminal variable.
  [ ((modMask .|. shiftMask, xK_Return),
     spawn $ XMonad.terminal conf)

  -- Spawn scratchpad
  , ((modMask, xK_s),
      scratchpadSpawnActionTerminal $ XMonad.terminal conf)

  -- lock the screen
  , ((modMask .|. controlMask, xK_l),
     spawn myScreensaver)

  -- spawn the launcher
  , ((modMask, xK_p),
     spawn myLauncher)

  -- Mute volume.
  , ((0, 0x1008ff12), spawn "amixer set Master toggle")

  -- Decrease volume.
  , ((0, 0x1008ff11), spawn "amixer set Master 1- unmute")

  -- Increase volume.
  , ((0, 0x1008ff13), spawn "amixer set Master 1+ unmute")
  
  -- Decrease brightness.
  , ((0, 0x1008ff03), spawn "xbacklight -dec 5")

  -- Increase brightness.
  , ((0, 0x1008ff02), spawn "xbacklight -inc 5")

  --------------------------------------------------------------------
  -- "Standard" xmonad key bindings

  -- Close focused window.
  , ((modMask .|. shiftMask, xK_c),
     kill)

  -- Cycle through the available layout algorithms.
  , ((modMask, xK_space),
     sendMessage NextLayout)

  --  Reset the layouts on the current workspace to default.
  , ((modMask .|. shiftMask, xK_space),
     setLayout $ XMonad.layoutHook conf)

  -- Resize viewed windows to the correct size.
  , ((modMask, xK_n),
     refresh)

  -- Move focus to the next window.
  , ((modMask, xK_Tab),
     windows W.focusDown)

  -- Move focus to the next window.
  , ((modMask, xK_j),
     windows W.focusDown)

  -- Move focus to the previous window.
  , ((modMask, xK_k),
     windows W.focusUp  )

  -- Move focus to the master window.
  , ((modMask, xK_m),
     windows W.focusMaster  )

  -- Swap the focused window and the master window.
  , ((modMask, xK_Return),
     windows W.swapMaster)

  -- Swap the focused window with the next window.
  , ((modMask .|. shiftMask, xK_j),
     windows W.swapDown  )

  -- Swap the focused window with the previous window.
  , ((modMask .|. shiftMask, xK_k),
     windows W.swapUp    )

  -- Shrink the master area.
  , ((modMask, xK_h),
     sendMessage Shrink)

  -- Expand the master area.
  , ((modMask, xK_l),
     sendMessage Expand)

  -- Push window back into tiling.
  , ((modMask, xK_t),
     withFocused $ windows . W.sink)

  -- Increment the number of windows in the master area.
  , ((modMask, xK_comma),
     sendMessage (IncMasterN 1))

  -- Decrement the number of windows in the master area.
  , ((modMask, xK_period),
     sendMessage (IncMasterN (-1)))

  -- Quit xmonad.
  , ((modMask .|. shiftMask, xK_q),
     io (exitWith ExitSuccess))

  -- Restart xmonad.
  , ((modMask, xK_q),
     restart "xmonad" True)
  ]
  ++

  -- mod-[1..9], Switch to workspace N
  -- mod-shift-[1..9], Move client to workspace N
  [((m .|. modMask, k), windows $ f i)
      | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
      , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

------------------------------------------------------------------------
-- Mouse bindings

myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
  [
    -- mod-button1, Set the window to floating mode and move by dragging
    ((modMask, button1),
     (\w -> focus w >> mouseMoveWindow w))

    -- mod-button2, Raise the window to the top of the stack
    , ((modMask, button2),
       (\w -> focus w >> windows W.swapMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modMask, button3),
       (\w -> focus w >> mouseResizeWindow w))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
  ]

------------------------------------------------------------------------
-- Run xmonad with configuration abovedefaults we set up.
main = do
  xmproc <- spawnPipe "xmobar ~/.xmonad/xmobar.hs"
  xmonad $ defaults {
        manageHook = manageDocks <+> myManageHook
  }

defaults = defaultConfig {
    -- simple stuff
    terminal           = myTerminal,
    borderWidth        = myBorderWidth,
    modMask            = myModMask,
    workspaces         = myWorkspaces,
    normalBorderColor  = myNormalBorderColor,
    focusedBorderColor = myFocusedBorderColor,

    -- key bindings
    keys               = myKeys,
    mouseBindings      = myMouseBindings,

    -- hooks, layouts
    layoutHook         = smartBorders $ myLayout,
    manageHook         = manageScratchPad <+> myManageHook
}
