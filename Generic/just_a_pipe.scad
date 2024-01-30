height = 12;
diameter = 6.7;
hole_diameter = 3.5;

$fn=100;


//pipe(6.7, 3.5, 12);
//pipe(8, 5.3, 40);
//pipe(8.5, 5.3, 40);
//pipe(8.5, 5.3, 85);
//pipe(8.5, 5.3, 61);
//pipe(8.5, 5.3, 68);
//pipe(8.5, 5.3, 91);
//pipe(8.5, 5.3, 90);
//pipe(8.5, 5.3, 99);
//pipe(8.5, 5.3, 97);
//pipe(8.5, 5.3, 98);
//pipe(8.5, 5.3, 96.25);
//pipe(8.5, 5.3, 93.75);
//pipe(8.5, 5.3, 93.5);
//pipe(8.5, 5.3, 58);
//pipe(8.5, 5.3, 56.25);
//pipe(8.5, 5.3, 53.75);
//pipe(8.5, 5.3, 53.5);
//pipe(8.5, 5.3, 87.8);
//pipe(8.5, 5.3, 90.9);
//pipe(8.5, 5.3, 116);
//pipe(8.5, 5.3, 111);
//pipe(8.5, 5.3, 106);
//pipe(8.5, 6.3, 131);
pipe(8.5, 6.3, 109.25);

//pipe(8.5, 5.3, 100);
//pipe(9, 5.3, 40);

//pipe(11, 7.2, 70);

module pipe(diameter, hole_diameter, height) {
    difference() {
        cylinder(d=diameter, h=height);
        cylinder(d=hole_diameter, h=height*3, center=true);
    }
}
