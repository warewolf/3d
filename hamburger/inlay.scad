include <constants.scad>

// scale_size = 1;
// scale_size = 0.95;
scale_size = 0.99;
scale(v=[scale_size,scale_size,scale_size]) main();

module main() {
  difference() {
      translate([0,0,edge_rounding/2]) rotate([180,0,0]) union() {
      lip();
      translate([0,0,-wall_thickness+1]) insert();
    }
   translate([0,0,-2]) dent_plug();
  }
}

module dent_plug() {
  color("orange") cylinder(h=2, r=(part_mating_fudge+(0.35*burger_diameter))/2);
}

module insert() {
  cylinder(h = wall_thickness, r = (part_mating_fudge+insert_diameter)/2);
}

module lip() {
  difference() {
    color("red") translate([0,0,mold_height/2]) rcylinder(r1 = (part_mating_fudge+burger_diameter-wall_thickness)/2, r2 = (part_mating_fudge+burger_diameter-wall_thickness)/2, h = mold_height, b=edge_rounding);
    color("blue") translate([0,0,insert_lip]) cylinder(h=mold_height, r=(part_mating_fudge+burger_diameter)/2);
  }
}
  
