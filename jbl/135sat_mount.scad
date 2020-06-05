include <MCAD/units.scad>

tongue_width = 13; 
tongue_length = 49; 
tongue_height1 = 5;
// tongue_height2 = 26;
tongue_height2 = 19.5;
ball_bump_d = 6.5;
bottom_inset_cyl = ball_bump_d;
speaker_hole = (11/32)*inch; // in
slop=0.2;

split = 0;



module mount(){
  difference() {
    union() {
      translate([0,0,tongue_height2]) sphere(r=ball_bump_d+.025, $fn=36); // bump sphere at the top
      difference() {
	hull() {
	  translate([0,tongue_length,0]) cylinder(d=tongue_width, h=tongue_height1, $fn=36); // body short
	  cylinder(d=tongue_width, h=tongue_height2, $fn=36); // body tall
	}
	translate([0,0,0-(.5*slop)]) cylinder(r=bottom_inset_cyl+slop,h=5+slop, $fn=36); // cutout at back of mount
	translate([0,0,.5*5]) cube([15,8,5+slop],center=true); // square off a sharp corner in the inset
      }
    }
    cylinder(d=5,h=13, $fn=36); // metal rod insert
    translate([0,0,16]) cylinder(d=5,h=13, $fn=36); // metal rod insert
  }
}

if (split == 1) {
  rotate([0,90,0]) difference() {
  mount();
  translate([0,0-ball_bump_d,0-.5*slop]) cube([20,69,26]);
  }
} else {
  mount();
}
