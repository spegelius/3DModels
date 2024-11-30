#!/usr/local/bin/python

# extrusion parameters (mm)
extrusion_width   = 0.45
layer_height      = 0.2
filament_diameter = 1.75

# print speeds (mm/s)
travel_speed      = 150
first_layer_speed =  20
slow_speed        =  10
fast_speed        =  60

# calibration object dimensions (mm)
layers        = 100
object_width  = 90
num_patterns  =  4
pattern_width =  5

# pressure advance gradient (s)
pressure_advance_min = 0.2
pressure_advance_max = 0.6

# center of print bed (mm)
offset_x = 70
offset_y = 70

layer0_z = 0.25

# pa/la command
#g_cmd = "M572 D0:1:2:3:4:5 S%.2f"
g_cmd = "M572 D0:1 S%.2f"
#g_cmd = "M900 K%.3f"
#g_cmd = "SET_PRESSURE_ADVANCE ADVANCE=%.3f"

# tool. set to None if no tool change needed
tool = None

# fan speed. 0-255
fan_speed = 255

# start gcode
start_gcode_prusa_PLA = """
M73 P0 R33
M73 C32
M201 X9000 Y9000 Z500 E10000 ; sets maximum accelerations, mm/sec^2
M203 X500 Y500 Z12 E120 ; sets maximum feedrates, mm / sec
M204 P2000 R1500 T2000 ; sets acceleration (P, T) and retract acceleration (R), mm/sec^2
M205 X10.00 Y10.00 Z0.20 E4.50 ; sets the jerk limits, mm/sec
M205 S0 T0 ; sets the minimum extruding and travel feed rate, mm/sec
M107
;TYPE:Custom
M862.3 P "MK2.5SMMU2S" ; printer model check
M862.1 P0.4 ; nozzle diameter check
M115 U3.11.0 ; tell printer latest fw version
G90 ; use absolute coordinates
M83 ; extruder relative mode
M104 S215 ; set extruder temp
M140 S60 ; set bed temp
Tx
M190 S60 ; wait for bed temp
M109 S215 ; wait for extruder temp
G28 W ; home all without mesh bed level
G80 ; mesh bed leveling

;go outside print area
G1 Y-3 F1000
G1 Z0.4 F1000
; select extruder
Tc
; purge line
G1 X55 F2000
G1 Z0.3 F1000
G92 E0
G1 X240 E25 F2200
G1 Y-2 F1000
G1 X55 E25 F1400
G1 Z0.2 F1000
G1 X5 E4 F1000
G92 E0
G21 ; set units to millimeters
G90 ; use absolute coordinates
M83 ; use relative distances for extrusion
M900 K0 ; Filament gcode LA 1.5
M107
"""

end_gcode_prusa = """
M107
;TYPE:Custom
; Filament-specific end gcode
G1 Z3.4 F720 ; Move print head up
G1 X0 Y210 F7200 ; park
G1 Z51.4 F720 ; Move print head further up
G1 E2 F5000
G1 E2 F5500
G1 E2 F6000
G1 E-15 F5800
G1 E-20 F5500
G1 E10 F3000
G1 E-10 F3100
G1 E10 F3150
G1 E-10 F3250
G1 E10 F3300

M140 S0 ; turn off heatbed
M107 ; turn off fan
M702 C
G4 ; wait
M104 S0 ; turn off temperature
M900 K0 ; reset LA
M84 ; disable motors
M73 P100 R0
"""

start_gcode_CR10_S5_PLA = """
M107
G90 ; use absolute coordinates
M83 ; extruder relative mode
M140 S60 ; set final bed temp
M104 S100 ; set temporary nozzle temp to prevent oozing during homing
G4 S10 ; allow partial nozzle warmup
G28 ; home all axis
M420 S1 ; enable mesh bed leveling
G1 Z25 F400
G1 X2 Y10 F3000
M190 S60 ; wait for bed temp to stabilize
M104 S210 ; set final nozzle temp
M109 S210 ; wait for nozzle temp to stabilize
G1 Z0.28 F240
G92 E0
G1 Y140 E10 F1500 ; prime the nozzle
G1 X2.3 F5000
G92 E0
G1 Y10 E10 F1200 ; prime the nozzle
G92 E0
G21 ; set units to millimeters
G90 ; use absolute coordinates
M83 ; use relative distances for extrusion
"""

end_gcode_CR10_S5 = """
G91; relative positioning
G1 Z5 F1500
G90 ; absolute positioning
G1 X5 Y404 F10800 ; present print
M140 S0 ; turn off heatbed
M104 S0 ; turn off temperature
M107 ; turn off fan
M84 X Y E ; disable motors
"""

start_gcode_Dollo3D = """
; START SCRIPT START
M83  ; extruder relative mode
M104 S210 ; set extruder temp
M140 S60 ; set bed temp
M190 S60 ; wait for bed temp
G28 ; home
M420 S1 ; enable mesh bed leveling
M420 Z2
M109 S210
G1 X0 Y10 F4000
G1 Z0.2 F1500
G1 E5 F3000
G1 X60.0 E8.0  F1000.0 ; intro line
G1 X90.0 E7  F1000.0 ; intro line
G1 E-4 F2000
; START SCRIPT END
"""

end_gcode_Dollo3D = """
; END SCRIPT START
G4 ; wait
T0
M104 S0 ; turn off temperature
M140 S0 ; turn off heatbed
M107 ; turn off fan
G91; relative positioning
G1 Z5 F1500
G90 ; absolute positioning
G1 X10 Y250; home X axis
M84 ; disable motors
; END SCRIPT END
"""

start_gcode_Dollo3D_RRF = """
; START SCRIPT START
M83  ; extruder relative mode
G10 P0 R210 S210; set extruder temp
M140 S60 ; set bed temp
M190 S60 ; wait for bed temp
G28 ; home
M116  ; wait all temps
G1 X70 Y70 F4000
G1 Z0.2 F1500
G1 E5 F3000
G1 X130.0 E8.0  F1000.0 ; intro line
G1 X160.0 E7  F1000.0 ; intro line
G1 Z1 F1500
G1 E-3 F2000
; START SCRIPT END
"""

end_gcode_Dollo3D_RRF = """
; END SCRIPT START
G4 ; wait
T0
M104 S0 ; turn off temperature
M140 S0 ; turn off heatbed
M107 ; turn off fan
G91; relative positioning
G1 Z5 F1500
G90 ; absolute positioning
G1 X10 Y250; home X axis
M84 ; disable motors
; END SCRIPT END
"""

start_gcode_tronxy_PLA = """
; START SCRIPT START
M83  ; extruder relative mode
G10 P0 R100 S100; set extruder temp
G10 P1 R100 S100; set extruder temp
G10 P2 R100 S100; set extruder temp
G10 P3 R100 S100; set extruder temp
G10 P4 R100 S100; set extruder temp
G10 P5 R100 S100; set extruder temp
M190 S60 ; wait for bed temp
G10 P0 R210 S210; set extruder temp
G10 P1 R210 S210; set extruder temp
G10 P2 R210 S210; set extruder temp
G10 P3 R210 S210; set extruder temp
G10 P4 R210 S210; set extruder temp
G10 P5 R210 S210; set extruder temp
G28 ; home
M116  ; wait all temps
; START SCRIPT END
"""

start_gcode_tronxy_PETG = """
; START SCRIPT START
M83  ; extruder relative mode
G10 P0 R100 S100; set extruder temp
G10 P1 R100 S100; set extruder temp
G10 P2 R100 S100; set extruder temp
G10 P3 R100 S100; set extruder temp
G10 P4 R100 S100; set extruder temp
G10 P5 R100 S100; set extruder temp
M190 S60 ; wait for bed temp
G10 P0 R240 S240; set extruder temp
G10 P1 R240 S240; set extruder temp
G10 P2 R240 S240; set extruder temp
G10 P3 R240 S240; set extruder temp
G10 P4 R240 S240; set extruder temp
G10 P5 R240 S240; set extruder temp
G28 ; home
M116  ; wait all temps
; START SCRIPT END
"""

end_gcode_tronxy = """
; END SCRIPT START
G4 ; wait
G91; relative positioning
G1 E-3.2 F2000
G10 P0 R0 S0 ; cool down
G10 P1 R0 S0 ; cool down
G10 P2 R0 S0 ; cool down
G10 P3 R0 S0 ; cool down
G10 P4 R0 S0 ; cool down
G10 P5 R0 S0 ; cool down
M140 S0 ; turn off heatbed
M107 ; turn off fan
G1 Z5 F1500
G90 ; absolute positioning
G1 X0 Y300; home X axis
M84 ; disable motors
; END SCRIPT END
"""

start_gcode_Cube_PLA = """
; START SCRIPT START
G21
G90
M80
M106 P0 S0  ; part cooling fan speed
M83  ; extruder relative mode
M140 S60 ; set bed temp
G10 P0 R100 S100; set extruder temp
G10 P1 R100 S100; set extruder temp
G10 P2 R100 S100; set extruder temp
G10 P3 R100 S100; set extruder temp
M190 S60 ; wait for bed temp
G10 P0 R210 S210; set extruder temp
G10 P1 R210 S210; set extruder temp
G10 P2 R210 S210; set extruder temp
G10 P3 R210 S210; set extruder temp
G28  ; home all
G29 ; autolevel
M116  ; wait all temps
M106 P1 S255  ; hot end fan speed
; START SCRIPT END
"""

end_gcode_Cube = """
; END SCRIPT START
G4               ; wait
G10 P0 R0 S0     ; cool down
G10 P1 R0 S0     ; cool down
G10 P2 R0 S0     ; cool down
G10 P3 R0 S0     ; cool down
M140 S0          ; turn off heatbed
M107             ; turn off fan
G1 X0 Y140 F3500 ; home X Y axis
G1 Z145 F2500    ; lower z axis
M84              ; disable motors
G4 P300000       ; wait for cool down
M81              ; turn off ATX
; END SCRIPT END
"""

#start_gcode = start_gcode_CR10_S5_PLA
#end_gcode = end_gcode_CR10_S5
#start_gcode = start_gcode_Dollo3D
#end_gcode = end_gcode_Dollo3D
start_gcode = start_gcode_Cube_PLA
end_gcode = end_gcode_Cube
#start_gcode = start_gcode_tronxy_PLA
#start_gcode = start_gcode_tronxy_PETG
#end_gcode = end_gcode_tronxy
#start_gcode = start_gcode_prusa_PLA
#end_gcode = end_gcode_prusa


from math import *


def extrusion_volume_to_length(volume):
    return volume / (filament_diameter * filament_diameter * 3.14159 * 0.25)

def extrusion_for_length(length):
    return extrusion_volume_to_length(length * extrusion_width * layer_height)

curr_x = offset_x
curr_y = offset_y
curr_z = layer0_z

# start gcode
print(start_gcode)

# tool change
if tool is not None:
   print("T%s" % tool)

# goto z height
print("G1 X%.3f Y%.3f Z%.3f F%.0f" % (curr_x, curr_y, curr_z, travel_speed * 60))

def up():
    global curr_z
    curr_z += layer_height
    print("G1 Z%.3f" % curr_z)

def line(x, y, speed):
    length = sqrt(x**2 + y**2)
    global curr_x, curr_y
    curr_x += x
    curr_y += y
    if speed > 0:
        print("G1 X%.3f Y%.3f E%.4f F%.0f" % (curr_x, curr_y, extrusion_for_length(length), speed * 60))
    else:
        print("G1 X%.3f Y%.3f F%.0f" % (curr_x, curr_y, travel_speed * 60))

def goto(x, y):
    global curr_x, curr_y
    curr_x = x + offset_x
    curr_y = y + offset_y
    print("G1 X%.3f Y%.3f" %(curr_x, curr_y))

line(-object_width/2,0,0)

for l in range(2):
    for offset_i in range(5):
        offset = offset_i * extrusion_width
        line(object_width + offset, 0, first_layer_speed)
        line(0, extrusion_width + offset * 2, first_layer_speed)
        line(-object_width - offset * 2, 0, first_layer_speed)
        line(0, -extrusion_width - offset * 2, first_layer_speed)
        line(offset, 0, first_layer_speed)
        line(0, -extrusion_width, 0)
    up()
    goto(-object_width / 2, 0)

segment = (object_width*1.0) / num_patterns
space = segment - pattern_width

# set fan speed
print("M106 S%d" % fan_speed)

layer_msgs = []
for l in range(layers):
    
    pressure_advance = (l / (layers * 1.0)) * (pressure_advance_max-pressure_advance_min) + pressure_advance_min;
    z = (l + 3) * layer_height

    msg = "; layer %d, z %.2f, pressure advance: %.3f" %(l, z, pressure_advance)
    layer_msgs.append(msg)
    print(msg)
    
    print(g_cmd % pressure_advance)
    
    for i in range(num_patterns):
        line(space/2, 0, fast_speed)
        line(pattern_width, 0, slow_speed)
        line(space/2, 0, fast_speed)
    
    line(0,extrusion_width,fast_speed)

    for i in range(num_patterns):
        line(-space/2, 0, fast_speed)
        line(-pattern_width, 0, slow_speed)
        line(-space/2, 0, fast_speed)
    
    line(0,-extrusion_width,fast_speed)
    up()

# end gcode
print(end_gcode)

# layer details
for msg in layer_msgs:
    print(msg)
