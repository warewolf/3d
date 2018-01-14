$fn = 10;

burger_diameter = 100; // ~ 4in
burger_thickness = 20; // ~ 3/4ths inch
//
//
edge_rounding = 3;
//
wall_thickness = 5; // mm
//
insert_thickness = 4;
insert_lip = 3;
insert_diameter = burger_diameter-(3*(wall_thickness+edge_rounding));
//
press_disc_thickness = 5;

mold_height = press_disc_thickness + insert_thickness + (1.35*burger_thickness);
//
part_mating_fudge = -2; // subtract 2mm from objects that fit inside other objects.

press_support_pillars = 7;

module rcylinder(r1=10,r2=10,h=10,b=2) {
  translate([0,0,-h/2]) hull() {
    rotate_extrude() translate([r1-b,b,0]) circle(r = b); 
    rotate_extrude() translate([r2-b, h-b, 0]) circle(r = b);
  }
}

