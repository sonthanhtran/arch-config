import XMonad
import XMonad.Util.EZConfig
import XMonad.Layout.ThreeColumns
import XMonad.Layout.NoBorders
import XMonad.Actions.MostRecentlyUsed

myLayout = tiled ||| Mirror tiled ||| noBorders Full
    where
        tiled = Tall nmaster delta ratio
        nmaster = 1
        ratio = 1/2
        delta = 3/100

myKey = [ ((mod1Mask, xK_Tab), mostRecentlyUsed [xK_Alt_L, xK_Alt_R] xK_Tab) ]

main :: IO ()
main = xmonad . configureMRU $ def
        { layoutHook = myLayout
        , terminal = "urxvt"
        , modMask = mod4Mask 
        }
        `additionalKeys` myKey
