#!/usr/local/bin/python

# extrusion parameters (mm)
extrusion_width   = 0.6
layer_height      = 0.3
filament_diameter = 1.75
retract_len = 2.7
retract_speed = 2000

# print speeds (mm/s)
travel_speed      = 150
first_layer_speed =  10
print_speed        =  10

# calibration object dimensions (mm)
layers        = 20
object_len    = 30

# center of print bed (mm)
offset_x = 150
offset_y = 150

# fan speed 0-255
fan_speed = 150

layer0_z = layer_height

# start gcode
start_gcode = """
; START SCRIPT START
M83  ; extruder relative mode
M140 S60 ; set bed temp
M190 S60 ; wait for bed temp
M104 S210 ; set extruder temp
G28 ; home
M420 S1 ; enable mesh bed leveling
M420 Z2
M109 S210
G1 X0 Y10 F4000
G1 Z0.2 F1500
G1 E5 F3000
G1 X60.0 E8.0  F1000.0 ; intro line
G1 X90.0 E7  F1000.0 ; intro line
G1 E-2.7 F2000
; START SCRIPT END
"""

end_gcode = """
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

from math import *

curr_x = offset_x
curr_y = offset_y
curr_z = layer0_z
curr_e = 0

def extrusion_volume_to_length(volume):
    return volume / (filament_diameter * filament_diameter * 3.14159 * 0.25)

def extrusion_for_length(length):
    return extrusion_volume_to_length(length * extrusion_width * layer_height)

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

def retract():
    global curr_e
    curr_e = -retract_len
    print("G1 E%.4f F%.0f" %(-retract_len, retract_speed))

def prime():
    global curr_e
    if curr_e < 0:
        curr_e = 0
        print("G1 E%.4f F%.0f" %(retract_len, retract_speed))

def goto(x, y, speed, z=None):
    global curr_x, curr_y
    curr_x = x + offset_x
    curr_y = y + offset_y
    if z is None:
        print("G1 X%.3f Y%.3f F%.0f" %(curr_x, curr_y, speed * 60))
    else:
        curr_z = z + curr_z
        print("G1 X%.3f Y%.3f Z%.3f F%.0f" %(curr_x, curr_y, speed * 60, curr_z))

# start gcode
print(start_gcode)

# disable backlash compensation
print("M425 X0 Y0 F0")

# goto z height at the center of the bed
print("G1 X%.3f Y%.3f Z%.3f F%.0f" % (curr_x, curr_y, curr_z, travel_speed * 60))

# bottom layer start position
brim_len = object_len - 2 * extrusion_width
goto(-brim_len/2, -brim_len/2, travel_speed)

prime()
for offset_i in range(8):
    offset = offset_i * extrusion_width
    line(brim_len+offset,0,first_layer_speed)
    line(0,brim_len+offset*2,first_layer_speed)
    line(-brim_len-offset*2,0,first_layer_speed)
    line(0,-brim_len-offset*2,first_layer_speed)
    line(offset,0,first_layer_speed)
    line(0,-extrusion_width,0)
retract()
up()


# bottom cube
b_layers = int(5 / layer_height)

# bottom cube start position
goto(-object_len/2, -object_len/2, travel_speed)
prime()
print("M106 S%.0f" % fan_speed)

for l in range(b_layers):
    line(object_len,0,print_speed)
    line(0,object_len,print_speed)
    line(-object_len,0,print_speed)
    line(0,-object_len,print_speed)
    up()

retract()
# actual test
bc_lure = 3
for l in range(layers):
    line(0,-bc_lure,0)
    line(0,bc_lure,0)
    prime()
    line(object_len,0,print_speed)
    retract()
    line(bc_lure,0,0)
    line(-bc_lure,0,0)
    prime()
    line(0,object_len,print_speed)
    retract()
    line(0,bc_lure,0)
    line(0,-bc_lure,0)
    prime()
    line(-object_len,0,print_speed)
    retract()
    line(-bc_lure,0,0)
    line(bc_lure,0,0)
    prime()
    line(0,-object_len,print_speed)
    retract()
    up()

# end gcode
print(end_gcode)