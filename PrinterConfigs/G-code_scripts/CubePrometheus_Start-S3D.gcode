; START SCRIPT START
G92 E0  ; reset extruder position
M104 S[extruder0_temperature]  T0
M140 S[bed0_temperature]
M190 S[bed0_temperature]
G28                                ;move to endstops
G29
M109 S[extruder0_temperature]  T0

G90
G1 X128 Y108 F9000      ; move to purge zone
G1 Z0.2 F1000                 ; move Z close
G91                                  ; relative positioning
G1 X7 Y-2 F3000             ; position

G1 E2.5 F4800                   ; prime
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4
G1 X-4 Y16 E0.65 F1000   ; raft1
G1 X-1 F1000                    ; raft2
G1 X4 Y-16 E0.65 F1000   ; raft3
G1 X-1 F1000                    ; raft4

; nullify first tool change
;G91  ; relative positioning
;G1 E-18 F1000
;G92 E0  ; reset extruder position
; START SCRIPT END