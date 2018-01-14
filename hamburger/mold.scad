include <constants.scad>

main();

module main() {
  difference() {
    difference() {
      difference() {
	translate([0,0,0]) color("green") outside();
	translate([0,0,(mold_height/2)+wall_thickness]) color("red") inside();
      }
      translate([0,0,-1]) color("blue") inlay_cutout();
    }
    translate([0,0,burger_thickness+press_disc_thickness+insert_thickness]) color("black") fill_line();
  }
}


module fill_line() {
  cylinder(h = 1, r = 2+(burger_diameter/2));
}

module inlay_cutout() {
  cylinder(h = mold_height, r = insert_diameter/2);
}

module inside() {
  rcylinder(r1 = (burger_diameter-wall_thickness)/2, r2 = (burger_diameter-wall_thickness)/2, h = mold_height, b=edge_rounding);
}

module outside() {
  cylinder(h = mold_height, r = (burger_diameter+wall_thickness)/2);
}
