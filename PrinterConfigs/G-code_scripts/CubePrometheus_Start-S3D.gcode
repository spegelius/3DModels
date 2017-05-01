; START SCRIPT START
G92 E0  ; reset extruder position
M104 S[extruder0_temperature]  T0
M140 S[bed0_temperature]
M190 S[bed0_temperature]
G28                                ;move to endstops
G29
M109 S[extruder0_temperature]  T0

;G1 X0 Y0 F2500
;G1 Z0.2 F1000    ;move Z close
;G1 X60.0 E9.0  F1000.0 ; intro line
;G1 X100.0 E12.5  F1000.0 ; intro line
;G1 E-2.4 F4800  ; retract

G1 Z0.2 F1000                 ;move Z close
G1 X128 Y108 F9000      ; move to purge zone
G91                                  ; relative positioning
G1 X5 Y-2 F3000             ; position
G1 X-4 Y8 E0.65 F1000   ; raft1
G1 X-1 F1000                  ; raft2
G1 X4 Y-8 E0.65 F1000   ; raft3
G1 X-1 F1000                  ; raft4
G1 X-4 Y8 E0.65 F1000   ; raft1
G1 X-1 F1000                  ; raft2
G1 X4 Y-8 E0.65 F1000   ; raft3
G1 X-1 F1000                  ; raft4
G1 X-4 Y8 E0.65 F1000   ; raft1
G1 X-1 F1000                  ; raft2
G1 X4 Y-8 E0.65 F1000   ; raft3
G1 X-1 F1000                  ; raft4
G1 X-4 Y8 E0.65 F1000   ; raft1
G1 X-1 F1000                  ; raft2
G1 X4 Y-8 E0.65 F1000   ; raft3
G1 X-1 F1000                  ; raft4
G1 X-4 Y8 E0.65 F1000   ; raft1
G1 X-1 F1000                  ; raft2
G1 X4 Y-8 E0.65 F1000   ; raft3
G1 X-1 F1000                  ; raft4
G1 X-4 Y8 E0.65 F1000   ; raft1
G1 X-1 F1000                  ; raft2
G1 X4 Y-8 E0.65 F1000   ; raft3
G1 X-1 F1000                  ; raft4
G1 X-4 Y8 E0.65 F1000   ; raft1
G1 X-1 F1000                  ; raft2
G1 X4 Y-8 E0.65 F1000   ; raft3
G1 X-1 F1000                  ; raft4
G1 X-4 Y8 E0.65 F1000   ; raft1
G1 X-1 F1000                  ; raft2
G1 X4 Y-8 E0.65 F1000   ; raft3
G1 X-1 F1000                  ; raft4
G1 X-4 Y8 E0.65 F1000   ; raft1
G1 X-1 F1000                  ; raft2
G1 X4 Y-8 E0.65 F1000   ; raft3
G1 X-1 F1000                  ; raft4
G1 X-4 Y8 E0.65 F1000   ; raft1
G1 X-1 F1000                  ; raft2
G1 X4 Y-8 E0.65 F1000   ; raft3
G1 X-1 F1000                  ; raft4
G1 X-4 Y8 E0.65 F1000   ; raft1
G1 X-1 F1000                  ; raft2
G1 X4 Y-8 E0.65 F1000   ; raft3
G1 X-1 F1000                  ; raft4
G1 X-4 Y8 E0.65 F1000   ; raft1
G1 X-1 F1000                  ; raft2
G1 X4 Y-8 E0.65 F1000   ; raft3
G1 X-1 F1000                  ; raft4
G1 X-4 Y8 E0.65 F1000   ; raft1
G1 X-1 F1000                  ; raft2
G1 X4 Y-8 E0.65 F1000   ; raft3
G1 X-1 F1000                  ; raft4
G1 X-4 Y8 E0.65 F1000   ; raft1
G1 X-1 F1000                  ; raft2
G1 X4 Y-8 E0.65 F1000   ; raft3
G1 X-1 F1000                  ; raft4
G1 X-4 Y8 E0.65 F1000   ; raft1
G1 X-1 F1000                  ; raft2
G1 X4 Y-8 E0.65 F1000   ; raft3
G1 X-1 F1000                  ; raft4
G1 X-4 Y8 E0.65 F1000   ; raft1
G1 X-1 F1000                  ; raft2
G1 X4 Y-8 E0.65 F1000   ; raft3
G1 X-1 F1000                  ; raft4
G1 X-4 Y8 E0.65 F1000   ; raft1
G1 X-1 F1000                  ; raft2
G1 X4 Y-8 E0.65 F1000   ; raft3
G1 X-1 F1000                  ; raft4
G1 X-4 Y8 E0.65 F1000   ; raft1
G1 X-1 F1000                  ; raft2
G1 X4 Y-8 E0.65 F1000   ; raft3
G1 X-1 F1000                  ; raft4
G1 X-4 Y8 E0.65 F1000   ; raft1
G1 X-1 F1000                  ; raft2
G1 X4 Y-8 E0.65 F1000   ; raft3
G1 X-1 F1000                  ; raft4
G1 X-4 Y8 E0.65 F1000   ; raft1
G1 X-1 F1000                  ; raft2
G1 X4 Y-8 E0.65 F1000   ; raft3
G1 X-1 F1000                  ; raft4
G1 X-4 Y8 E0.65 F1000   ; raft1
G1 X-1 F1000                  ; raft2
G1 X4 Y-8 E0.65 F1000   ; raft3
G1 X-1 F1000                  ; raft4
G1 X-4 Y8 E0.65 F1000   ; raft1
G1 X-1 F1000                  ; raft2
G1 X4 Y-8 E0.65 F1000   ; raft3
G1 X-1 F1000                  ; raft4
G1 X-4 Y8 E0.65 F1000   ; raft1
G1 X-1 F1000                  ; raft2
G1 X4 Y-8 E0.65 F1000   ; raft3
G1 X-1 F1000                  ; raft4
G1 X-4 Y8 E0.65 F1000   ; raft1
G1 X-1 F1000                  ; raft2
G1 X4 Y-8 E0.65 F1000   ; raft3
G1 X-1 F1000                  ; raft4
G1 X-4 Y8 E0.65 F1000   ; raft1
G1 X-1 F1000                  ; raft2
G1 X4 Y-8 E0.65 F1000   ; raft3
G1 X-1 F1000                  ; raft4
G1 X-4 Y8 E0.65 F1000   ; raft1
G1 X-1 F1000                  ; raft2
G1 X4 Y-8 E0.65 F1000   ; raft3
G1 X-1 F1000                  ; raft4
G1 X-4 Y8 E0.65 F1000   ; raft1
G1 X-1 F1000                  ; raft2
G1 X4 Y-8 E0.65 F1000   ; raft3
G1 X-1 F1000                  ; raft4
G1 X-4 Y8 E0.65 F1000   ; raft1
G1 X-1 F1000                  ; raft2
G1 X4 Y-8 E0.65 F1000   ; raft3
G1 X-1 F1000                  ; raft4

; nullify first tool change
;G91  ; relative positioning
;G1 E-18 F1000
;G92 E0  ; reset extruder position
; START SCRIPT END