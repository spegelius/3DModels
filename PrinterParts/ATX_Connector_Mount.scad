include <../PCParts/common.scad>;


////// VARIABLES //////
atx_connector_w = 52.15;
atx_connector_l = 10;
atx_connector_h = 13;
atx_connector_pins = 24;
atx_connector_pins_w = 47.5;

pcie_connector_w = 14.2;
pcie_connector_l = 10;
pcie_connector_h = 13;
pcie_connector_pins = 6;
pcie_connector_pins_w = 9.5;

pin_d = 1.1;

mount_w = atx_connector_w + pcie_connector_w + 5+4;
mount_l = atx_connector_h + 9;

echo(mount_w);

y_offset = 2.2;


////// VIEW //////
//debug();
//mock_atx_connector();
//mock_pcie_connector();
//mock_connector_pcb();

mount();
//mount_top();

////// MODULES //////
function pin_spacing(w,pin_d,pins) = (w-pin_d)/(pins/2);
function x_offset(w,pins_w) = (w-pins_w)/2;

module _mock_connector(w,l,h,pins,pins_w) {
    module bent_pin(pin_l) {
        cube([pin_d, pin_d, 6.9-pin_d]);
        translate([0,0,6.9-pin_d]) cube([pin_d, pin_l, pin_d]);
    }
    
    cube([w, l, h]);
    
    spacing = pin_spacing(w,pin_d,pins);
    echo(spacing);
    x_offset = x_offset(w,pins_w);

    
    for (i = [0:(pins/2)-1]) {
        translate([x_offset+i*spacing,y_offset,h]) bent_pin(11.3);
    }
    
    y_offset_2 = l - y_offset - pin_d;
    for (i = [0:(pins/2)-1]) {
        translate([x_offset+i*spacing,y_offset_2,h-(6.5-pin_d)]) bent_pin(7);
    }
}

module mock_atx_connector() {
    
    _mock_connector(atx_connector_w,atx_connector_l,atx_connector_h,atx_connector_pins,atx_connector_pins_w);
}

module mock_pcie_connector() {
    
    _mock_connector(pcie_connector_w,pcie_connector_l,pcie_connector_h,pcie_connector_pins,pcie_connector_pins_w);
}

module mock_connector_pcb() {
    w = mount_w-5;
    echo(w);
    
    row1_x = -w/2+43.6+fan_connector_width/2;
    row1_y = -35/2+21.1+fan_connector_length/2;
    
    row2_x = -w/2+28.4+fan_connector_width/2;
    row2_y = -35/2+6+fan_connector_length/2;
    
    spacing = (36.4-fan_connector_width)/4;

    union() {
        translate([0,0,1.8/2]) cube([w,35,1.8], center=true);
        
        translate([-w/2+11.75+fan_connector_length/2,-35/2+17.3+fan_connector_width/2,1.78]) rotate([0,0,90]) mock_fan_connector_male();

        translate([row1_x,row1_y,1.78]) mock_fan_connector_male();
        translate([row1_x+spacing,row1_y,1.78]) mock_fan_connector_male();
        translate([row1_x+2*spacing,row1_y,1.78]) mock_fan_connector_male();

        translate([row2_x, row2_y,1.78]) mock_fan_connector_male();
        translate([row2_x+spacing,row2_y,1.78]) mock_fan_connector_male();
        translate([row2_x+2*spacing,row2_y,1.78]) mock_fan_connector_male();
        translate([row2_x+3*spacing,row2_y,1.78]) mock_fan_connector_male();
        translate([row2_x+4*spacing,row2_y,1.78]) mock_fan_connector_male();
    }
}

module _side_notch(l) {
    rotate([0,45,0]) cube([2,l,2], center=true);
}

module mount() {
    
    spacing_a = pin_spacing(atx_connector_w,pin_d,atx_connector_pins);
    spacing_p = pin_spacing(pcie_connector_w,pin_d,pcie_connector_pins);
    
    x_off_a = x_offset(atx_connector_w,atx_connector_pins_w) + 2.3;
    x_off_p = x_offset(pcie_connector_w,pcie_connector_pins_w) + 2.3+5+atx_connector_w;
    
    module hole() {
        $fn=20;
        d1 = 4;
        d2 = 3;
        cylinder(d1=d1,d2=d2,h=2);

        translate([0,5.5,0])
        cylinder(d1=d1,d2=d2,h=2);

        translate([0,9/2-2,20/2+1.99])
        cube([2,9,20],center=true);
    }
    
    difference() {
        union() {
            translate([0,1,0])
            cube([mount_w,mount_l,atx_connector_l+1.1]);

            translate([0,mount_l/2+1,atx_connector_l-2])
            _side_notch(mount_l);

            translate([mount_w,mount_l/2+1,atx_connector_l-2])
            _side_notch(mount_l);

            translate([-2,1,0])
            cube([3,mount_l,1.8]);

            translate([mount_w-1,1,0])
            cube([3,mount_l,1.8]);

            translate([mount_w/2,50,0])
            _connector_pcb_mount();
        }
        translate([1.9,-0.01,1])
        cube([atx_connector_w+0.1,atx_connector_h+0.2,atx_connector_l+2]);

        translate([6.9+atx_connector_w,-0.01,1])
        cube([pcie_connector_w+0.2,pcie_connector_h+0.1,pcie_connector_l+2]);
        
        for (i = [0:(atx_connector_pins/2)-1]) {
            translate([x_off_a+i*spacing_a,atx_connector_h+0.9,0]) hole();
        }
        
        for (i = [0:(pcie_connector_pins/2)-1]) {
            translate([x_off_p+i*spacing_p,pcie_connector_h+0.9,0]) hole();
        }
    }
    
    %translate([2,0,1+atx_connector_l]) rotate([-90,0,0]) mock_atx_connector();
    %translate([2+atx_connector_w+5,0,1+pcie_connector_l]) rotate([-90,0,0]) mock_pcie_connector();
    
    %translate([mount_w+5/2,1,atx_connector_l+1.1+2]) rotate([0,180,0]) mount_top();
}

module mount_top() {
    
    z_pos = (atx_connector_l+1.1)-(atx_connector_l-2)+2;
    
    difference() {
        cube([mount_w+5,mount_l+2,8]);
        translate([5/2-0.1,-0.01,2]) cube([mount_w+0.2,mount_l,10]);
        translate([5/2-0.1,mount_l/2,z_pos]) _side_notch(mount_l);
        translate([5/2+0.1+mount_w,mount_l/2,z_pos]) _side_notch(mount_l);
        translate([5.5+pcie_connector_w/2,0,-0.01]) cube([7,22,6], center=true);
        translate([4+pcie_connector_w+5+atx_connector_w/2,0,-0.01]) cube([9,22,6], center=true);
    }
}

module _connector_pcb_mount() {
    
    module mount_texts() {
        translate([8,12.8,1.8-0.59])
        linear_extrude(0.6)
        text("5V", size=7);

        translate([4,-19.7,1.8-0.59])
        linear_extrude(0.6)
        text("12V", size=7);
        
        translate([-27,-1.5,1.8-0.59])
        rotate([0,0,-90])
        linear_extrude(0.6)
        text("5VSB", size=4);

        translate([-21,-1.5,1.8-0.59])
        rotate([0,0,-90])
        linear_extrude(0.6)
        text("PS_ON", size=4, style="Bold", name="Arial");

        translate([-16,-1.5,1.8-0.59])
        rotate([0,0,-90])
        linear_extrude(0.6)
        text("GND", size=4);
        
    }
    
    difference(){
        translate([0,-7/2,1.8/2])
        cube([mount_w+4, 49, 1.8],center=true);

        translate([0,0,-1.8-0.01])
        mock_connector_pcb();

        mount_texts();
    }
}

module debug() {
    mount();
    translate([mount_w/2,50,1.8]) rotate([180,0,0]) connector_pcb_mount();
}

