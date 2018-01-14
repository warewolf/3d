include <constants.scad>

main();

module main() {
  difference() {
  dent_plug();
  translate([0,0,-2]) color("red") cylinder(h = 2, r=((0.35*burger_diameter)/2));
  }
}

module dent_plug() {
  union() {
  translate([0,0,2.0]) resize([0,0,.25*burger_thickness],auto=[false,false,true]) sphere(((0.35*burger_diameter))/2);
  color("orange") cylinder(h = 2, r=((0.35*burger_diameter)/2));
  }
}
