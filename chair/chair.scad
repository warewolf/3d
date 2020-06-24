/* usage:
 * diameter is how large the "coin" is.
 * divisons is how many "bumps" there are
 * height is how tall the "coin" is, the bumps are either inset or outset from the top surface of the "coin"
 * bump_height is the height difference from the surface of the "coin"
 * centerhole_dia is the diameter of the hole punched in the dead center (e.g. for a screw to go through)
 * z_offset is the offset (both negative and positive) for the "inside" (closest to center) of the spoke to be adjusted
 */

main(diameter = 20, divisions=5, height=2, bump_height=1.5, centerhole_dia=3, z_offset=.50);


slop = 0.1;

function circumference(radius) = 2*PI*radius;
function arc_length(radius,angle) = circumference(radius)*(angle/360);
  
module male( diameter, divisions, bump_height,z_offset) {
  bump_diameter = arc_length(diameter/2,360/divisions)/2;
  for(angle_offset = [0:360/divisions:360] ) {
     rotate([0,0,angle_offset]) hull() {
       translate([bump_diameter/3,0,z_offset])                       resize([0,0,bump_height]) sphere(d=bump_diameter/5); // inside
       // 9/24ths is a magic number, no clue why.  This keeps the inset and outset from overlapping.
       translate([(diameter/2)-(9/24*bump_diameter)-slop,0,0]) resize([0,0,bump_height]) sphere(d=3/4*bump_diameter); // outside
     };
  }
}

$fn=36;

module inset(diameter, divisions, bump_height,z_offset) {
  bump_radius = 360/diameter/divisions;
  difference() {
    color("blue") male(diameter, divisions, bump_height,z_offset=0+z_offset );
    cylinder(d=diameter,h=bump_height);
  }
}

module outset(diameter, divisions, bump_height, z_offset) {
  bump_radius = 360/diameter/divisions;
  intersection() {
    translate([0,0,0]) rotate([0,0,360/divisions/2]) color("red") male(diameter, divisions, bump_height, z_offset=0-z_offset );
    cylinder(d=diameter,h=bump_height);
  }
}


module main(diameter = 20, divisions=6, height=3, bump_height=2, centerhole_dia=8, z_offset=1) {
  assert(height > bump_height,"Height must be greater than bump_height");
  difference() {
    union() {
      difference() {
	cylinder(d=diameter,h=height);
	translate([0,0,height+slop]) inset(diameter, divisions, bump_height, z_offset=z_offset);
      } 
      translate([0,0,height-slop]) outset(diameter, divisions, bump_height, z_offset=z_offset);
    }
    translate([0,0,0-0.5]) cylinder(d=centerhole_dia,h=3*2);
  }
}


