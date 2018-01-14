include <constants.scad>

main();

module main() {
  union() {
  difference() {
  difference() {
    union() {
      support();
      press_plate();
    }
    translate([0,0,0]) dent_plug();
  }
  press_plate_cutoff();
  }
  }
}

module support_cutout() {
  color("orange") translate([0,0,2]) cylinder(h=14,r=12*.8);
}

module support() {
  union() {
    color("red") translate([0,0,16]) resize([0,0,6],auto=[false,false,true]) sphere(12);
    difference() {
      color("green") translate([0,0,3]) cylinder(h=13,r=12);
      support_cutout();
    }
    for (i = [0 : press_support_pillars]) rotate([0,0,i*(360/press_support_pillars)]) support_arm();
  }
}

module support_arm() {
  arm_length = 40;
  arm_angle = 69;
  arm_horiz_offset = 42;
  arm_vert_offset = -1;
  arm_dia = 10;
  
  difference() {
    translate([0,arm_horiz_offset,arm_vert_offset]) rotate([arm_angle,0,0]) color("blue") cylinder(h=arm_length,r=.5*arm_dia);
    translate([0,arm_horiz_offset+1,arm_vert_offset]) rotate([arm_angle,0,0]) color("blue") cylinder(h=arm_length+2,r=.5*arm_dia/1.5);
  }
}

module dent_plug() {
  color("orange") cylinder(h=2, r=(part_mating_fudge+(0.35*burger_diameter))/2);
}

module press_plate_cutoff() {
    translate([0,0,0.1-press_disc_thickness-3]) cylinder(h=press_disc_thickness+3, r=(burger_diameter+part_mating_fudge+4)/2);
}

module press_plate() {
   rcylinder(r1=(burger_diameter+part_mating_fudge)/2, r2 = (burger_diameter+part_mating_fudge)/2, h = press_disc_thickness, b= edge_rounding);
}
