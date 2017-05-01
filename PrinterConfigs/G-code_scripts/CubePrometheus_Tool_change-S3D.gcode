; TOOL CHANGE START

G90                                     ; absolute positioning
G1 X128 Y108 F9000          ; move to purge zone
G1 E0 F4800                       ; feed filament
G91                                     ; relative positioning

G1 Z-0.1 F1800                  ; minus z hop
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

G1 Z0.1 F1800                   ; plus z hop

T[new_tool]

G91                                    ; relative positioning
G1 E118 F1500                  ; 25mm/s feed
G1 X-40 E4 F900                ; prime trail
G90                                    ; absolute positioning
G92 E0                               ; reset extruder position
; TOOL CHANGE END