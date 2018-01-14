hose_diameter = 18.75;

bracket_thickness = 15; 
wall_bracket_thickness = 2;

ring_thickness = 2;


zip_tie_width = 2;
zip_tie_thickness = 1;

standoff_height = 5; //from OD of ring

hole_size = 3;

// defaults: $fa=12, $fs=2
// $fn=50;
$fs = 1;
$fa = 2;



module cutout() {   
    cylinder(d=hose_diameter,h=bracket_thickness,center=true);
    translate([hose_diameter/2,0,0]) cube([hose_diameter/1.3,hose_diameter/1.3,bracket_thickness],center=true);
}

module bracket() {
    translate([(-(hose_diameter+(2*ring_thickness))/2)-standoff_height+wall_bracket_thickness/2,0,0]) {
        difference() {
            cube([wall_bracket_thickness,hose_diameter+ring_thickness*2+hole_size*3,bracket_thickness],center=true);
            //holes();
        }
    }    
}

module standoff() {
    //translate([-hose_diameter/2,0,0]) cube([standoff_height*2,hose_diameter/1.3,bracket_thickness],center=true);    
    translate([-hose_diameter/2-ring_thickness-standoff_height/2,0,0]) cube([standoff_height,hose_diameter/1.3,bracket_thickness],center=true);
    color("blue") cube([hose_diameter+ring_thickness*2,hose_diameter/1.3,bracket_thickness],center=true);
}

module zip_tie_slot() {
    difference() {
        union() {
            cylinder(d=hose_diameter+(2*ring_thickness),h=zip_tie_width,center=true);
            cube([hose_diameter+(2*ring_thickness)+zip_tie_thickness*2,hose_diameter+(2*ring_thickness),zip_tie_width],center=true);
        }
        cylinder(d=hose_diameter+(2*ring_thickness)-(2*zip_tie_thickness),h=zip_tie_width,center=true);        
    }
    
}

module ring() {   
    cylinder(d=hose_diameter+(2*ring_thickness),h=bracket_thickness,center=true);    
}

module hole() {
    rotate([0,90,0]) cylinder(d=hole_size,h=wall_bracket_thickness+1,center=true);
}

module holes() {
    distance = (hose_diameter+ring_thickness*2)/2+hole_size/2;
    translate([0,-distance,0]) hole();
    translate([0,distance,0]) hole();
}

module clamp() {
difference() {
    union() {
        ring();
        standoff();
        bracket();
    }
    //zip_tie_slot();
    cutout();
    
}
}

module main() {
  minkowski() {
    sphere(r=0.25);
    clamp();
  } 
}

main();
