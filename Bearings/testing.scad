
cube_side = 3;
circle_dia = 3;
circle_circumfence = circle_dia*PI;

diameter = 15;
inner_diameter = diameter-circle_dia;

steps = 360;

circumfence = inner_diameter*PI;
step_len = circumfence/steps;
step_degrees = steps/(circle_circumfence/step_len);

echo(circle_circumfence);
echo(circumfence);
echo(step_len);
echo(step_degrees);

for (i=[0:steps-1]) {
    
    rotate([0,0,i*(360/steps)]) translate([diameter/2-circle_dia/2,0,0]) rotate([0,0,i*(360/steps)*-step_degrees]) cube([cube_side,cube_side,cube_side], center=true);
    //%rotate([0,0,i*(360/steps)]) translate([diameter/2,0,0]) cylinder(d=circle_dia, h=6);
}