; LAYER CHANGE START
G90                                  ; absolute positioning
G1 X128 Y108 F9000      ; move to purge zone
G91                                  ; relative positioning

G1 X-0.3 Y-1 F3000         ; position
G1 Z-0.1 F1800               ; minus z hop

G1 E2 F4800                    ; prime
G1 X-45 E1.4 F3000         ; purge trail
G1 X-5  E0.1 F3000          ; wipe
G1 Y15 E0.5 F3000          ; Y shift
G1 X45 E1.4 F3000          ; purge trail
G1 X8 Y1 E0 F1000          ; wipe
G1 E-2.6000 F4800          ; retract
G1 X0 Y-10 E0 F1000        ; wipe

G1 Z0.1 F1800                 ; plus z hop

G90                                  ; absolute positioning
; LAYER CHANGE END