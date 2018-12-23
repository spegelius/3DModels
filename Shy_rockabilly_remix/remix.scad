
part = 0;
import("z:\\3DModels\\_downloaded\\Shy_Rockabilly_Extruder\\files\\Shy_Rockabilly_Face.stl", convexity=3);

/* [Vibration Absorber] */
AbsorberWidth = 15;  // [10:0.1:30]
AbsorberThickness = 2;  // [1:0.1:3]
AbsorberLevelNumber = 2;  // [1:3]

PieceThickness = 5; // [2:0.1:10]
ScrewDiameter = 3; // [2.5:0.1:10]
SupportScrewOffset = 31;  // [10:0.1:100]

NemaScrewOffset = 31;  // [10:0.1:100]
NemaSlidingSize = 5;  // [2:0.1:10]
GearEntraxis = 42.5;  // [10:0.1:100]
baseLength = (NemaSlidingSize+NemaScrewOffset+ScrewDiameter+2*PieceThickness)/2+GearEntraxis;
baseWidth = NemaScrewOffset+2*PieceThickness;

springDim=[1.5*baseWidth, AbsorberWidth, 2*PieceThickness, AbsorberThickness, AbsorberLevelNumber];

module spring(width=50, height=20, thickness=2, level=2, levelLength=5, extrude=15) {
  linear_extrude(height=extrude, center=true) {
    springShape(width=width, height=height, thickness=thickness, level=level, levelLength=levelLength);
  }
}

module springShape(width=50, height=20, thickness=2, level=2, levelLength=0) {
	if(height/(2*level) < thickness) {
		echo("Too many level defined regarding to height and thickness");
	} else {
    translate([0, thickness/2])
      difference() {
        springForm(width=width-thickness, step=(height-thickness)/(2*level-1), level=level, levelLength=levelLength, offset=thickness/2);
        springForm(width=width-thickness, step=(height-thickness)/(2*level-1), level=level, levelLength=levelLength, offset=-thickness/2);
      }
	}
}

module springForm(width=50, step=3, level=1, levelLength=0, offset=1) {
  union() {
    for(l=[0:level-1]) {
      translate([0, (2*l+0.5)*step]) {
        if(l>0) {
          translate([0, -step])
            concave(width=width, height=step, levelLength=levelLength, offset=offset);
        }
        convex(width=width, height=step, offset=offset);
      }
    }
  }
}

module convex(width=30, height=10, offset=0) {
  size = width-height;
  h = height+2*offset;
  hull() {
    translate([size/2, 0])
      circle(d=h);
    translate([-size/2, 0])
      circle(d=h);
  }
}

module concave(width=30, height=10, levelLength=0, offset=0) {
  size = width-height-2*levelLength;
  h = height-2*offset;
  difference() {
    square([size, h+0.1], center=true);
    translate([size/2, 0])
      circle(d=h);
    translate([-size/2, 0])
      circle(d=h);
  }
}

module supportBracket(thickness=2*springDim[3]) {
  translate([34.2, 0, 0]) {
    if((part==1) && PreventWarping) {
      translate([springDim[1]/2, springDim[0]/12-springDim[0]/2, 0])
        cylinder(d=max(2*springDim[1], 2*springDim[0]/6), h=0.2);
      translate([springDim[1]/2, -springDim[0]/12+springDim[0]/2, 0])
        cylinder(d=max(2*springDim[1], 2*springDim[0]/6), h=0.2);
    }
    translate([0, 0, springDim[2]/2]) {
    rotate([0, 0, -90])
      spring(width=springDim[0], height=springDim[1], thickness=springDim[3], level=springDim[4], levelLength=springDim[0]/6, extrude=springDim[2]);
    translate([springDim[1], 0, 0]) {
      rotate([0, -90, 0]) {
        difference() {
          hull() {
            cube([springDim[2], 3*springDim[0]/4, thickness], center=true);
            translate([springDim[2]+ScrewDiameter, SupportScrewOffset/2, 0])
              cylinder(d=2*PieceThickness+ScrewDiameter, h=thickness, center=true);
            translate([springDim[2]+ScrewDiameter, -SupportScrewOffset/2, 0])
              cylinder(d=2*PieceThickness+ScrewDiameter, h=thickness, center=true);
          }
          translate([springDim[2]+ScrewDiameter, SupportScrewOffset/2, 0])
            cylinder(d=ScrewDiameter, h=thickness+0.2, center=true);
          translate([springDim[2]+ScrewDiameter, -SupportScrewOffset/2, 0])
            cylinder(d=ScrewDiameter, h=thickness+0.2, center=true);
          }
        }
      }
    }
  }
}

$fn=30;
union() {
    supportBracket();
    translate([28, -12.5, 0]) cube(size = [7,25,7], center = false);
}
