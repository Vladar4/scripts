#!/bin/sh
#
# Keyboard configuration script
#
# Requirements: setxkbmap xcape

setxkbmap \
  -option \
  -option grp:alt_shift_toggle \        # Toggle layout with Alt+Shift
  -option grp_led:scroll \              # Use ScrollLock LED as indicator
  -option caps:ctrl_modifier \          # Use CapsLock as Ctrl key in combos
  -option compose:ralt \                # Use RAlt as Compose key
  -option terminate:ctrl_alt_bkspc \    # Enable Ctrl+Alt+Backspace combo
  -option grp:switch \
  us,ru                                 # Layouts

xcape -e 'Caps_Lock=Escape'             # Use CapsLock as Escape key

exit 0
