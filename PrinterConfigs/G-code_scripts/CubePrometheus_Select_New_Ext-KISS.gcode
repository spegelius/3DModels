; SELECT NEW EXT START
M104 S<TEMP>
T<EXT+0>
G90                                     ; absolute positioning
G1 X118 Y112 F9000          ; move to purge zone
G91                                     ; relative positioning

G1 E123 F1500                  ; 25mm/s feed
G1 X-40 E1.4 F1500          ; prime trail

G1 Y1 F3000                      ; Y shift
G1 X50 E1.5 F1500            ; purge trail
G1 Y1 F3000                      ; Y shift
G1 X-50 E1.5 F1500           ; purge trail

G1 Y1 F3000                      ; Y shift
G1 X50 E1.5 F1500            ; purge trail
G1 Y1 F3000                      ; Y shift
G1 X-50 E1.5 F1500            ; purge trail

G1 Y1 F3000                      ; Y shift
G1 X50 E1.5 F1500            ; purge trail
G1 Y1 F3000                      ; Y shift
G1 X-50 E1.5 F1500            ; purge trail

G1 Y1 F3000                      ; Y shift
G1 X50 E1.5 F1500            ; purge trail
G1 Y1 F3000                      ; Y shift
G1 X-50 E1.5 F1500          ; purge trail
G1 Y1 F3000                      ; Y shift
G1 X25 E0.75 F1500         ; purge trail
G1 X26 E0.75 F1000         ; purge trail
G1 Y-5 F1000                     ; wipe
G1 E-2.6000 F4800           ; retract
G1 Y-5 F1000                     ; wipe

G90                                     ; absolute positioning

G92 E0                               ; reset extruder position
; SELECT NEW EXT END