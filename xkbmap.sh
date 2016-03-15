#!/bin/sh
#
# Keyboard configuration script
#
# Requirements: setxkbmap xcape

# grp:alt_shift_toggle        Toggle layout with Alt+Shift
# grp_led:scroll              Use ScrollLock LED as indicator
# caps:ctrl_modifier          Use CapsLock as Ctrl key in combos
# compose:ralt                Use RAlt as Compose key
# terminate:ctrl_alt_bkspc    Enable Ctrl+Alt+Backspace combo
# grp:switch us,ru            Layouts
setxkbmap \
  -option \
  -option grp:alt_shift_toggle \
  -option grp_led:scroll \
  -option caps:ctrl_modifier \
  -option compose:ralt \
  -option terminate:ctrl_alt_bkspc \
  -option grp:switch \
  us,ru

# Use CapsLock as Escape key
xcape -e 'Caps_Lock=Escape'

exit 0
