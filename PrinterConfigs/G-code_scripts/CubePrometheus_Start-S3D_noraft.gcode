; START SCRIPT START
G90
G92 E0  ; reset extruder position
M104 S215  T0
M140 S60
M190 S60
G28                                ;move to endstops
G29
M109 S215  T0
; START SCRIPT END