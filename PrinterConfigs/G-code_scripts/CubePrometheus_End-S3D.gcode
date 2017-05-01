; END SCRIPT START
M104 S0                           ;extruder heater off
M140 S0                           ;heated bed heater off (if you have it)
G91                                  ;relative positioning
G1 E-3 F300                     ;retract the filament a bit before lifting the nozzle to release some of the pressure
G90                                  ;absolute positioning
M107                                ; turn off fan
G1 Z145 F2500                ; move bed to bottom lest it drops down after motors off
G1 X15 Y145 F6000         ; home X axis
M84                                  ; disable motors
; END SCRIPT END
