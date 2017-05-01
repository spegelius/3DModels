; START SCRIPT START
T0
M83  ; extruder relative mode
M104 S<TEMP> ; set extruder temp
M140 S<BED> ; set bed temp
M190 S<BED> ; wait for bed temp
G28  ; home all without mesh bed level
G29 ; autolevel

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
G90                                    ; absolute positioning
G1 X128 Y108 F9000          ; move to purge zone
G1 E0 F4800                       ; feed filament
G91                                     ; relative positioning

G1 X-50 E4.5 F6000           ; purge trail
G1 Y1 F3000                       ; Y shift
G1 X50 E4.5 F6000            ; purge trail
G1 Y1 F3000                      ; Y shift
G1 X-50 E4.5 F6000           ; purge trail
G1 Y1 F3000                       ; Y shift
G1 X50 E4.5 F6000            ; purge trail
G1 Y1 F3000                      ; Y shift
G1 X-10 E-20 F1500          ; drip trail
G1 E-15 F1500                   ; 25mm/s reshaping
G4 P2000                           ; 2s cooling period
G1 E-95 F1500                   ; 25mm/s long retract
G90                                    ; absolute positioning
G1 Z0.5 F1800                   ; Z lift
; START SCRIPT END