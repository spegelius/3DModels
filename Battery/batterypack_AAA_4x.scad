
module mock_battery_AAA() {
    cylinder(d=10.2,h=42.5,$fn=40);
    cylinder(d=3.7,h=1.6+42.5,$fn=20);
}

module mock_screw_m3() {
    cylinder(d=3,h=10,$fn=20);
    cylinder(d=6,h=2.4,$fn=20);
}

module battery_AAA() {
    difference() {
        cylinder(d=10,h=42.5+1.6-3.5,$fn=40);
        cylinder(d=2.8,h=50,$fn=12);
    }
}

battery_AAA();