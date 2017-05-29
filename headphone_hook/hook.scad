// http://www.openscad.org/cheatsheet/index.html?version=2015.03 
$fn = 16;

screw_dia = 3.505; // #6, .13", aka 9/64"
washer_dia = 9.525; // 3.8", #6 washer.

width = 25;

mount_depth = 38.1; // 1.5"
mount_width = width;
mount_height = 12;

hook_height = 12; // 2"
hook_width = width; // 1"
hook_depth = 57; // 2"

// ____ shoulder
// | 
// |
// | arm
// |
// |--------  hand
//
//


module mount_arm() {
    //# x,y,z
    cube([mount_width,mount_height,mount_depth],false);
    //cube([mount_width,mount_depth,mount_height],false);
}


module mount_shoulder() {
  translate([0,0,mount_depth]) cube([hook_width,mount_depth-10,hook_height-6],false);
}

module hook() {
    union() {
        mount_shoulder();
      difference() {
	mount_arm();
	rotate([5,0,0])  scale([1.05,1.5,1.05]) translate([-0.5,-15,.3*mount_height]) mount_arm();
      }
    }
}

// * disable
// ! show only
// # highlight / debug
// % transparent / background
module mount_hand( diameter, width, height, length) {
  union(){   
    intersection() {
    translate([0-(0.5*width),0,0]) color("yellow") cube([width,length,height], center=false);
    translate([0,0,height]) translate([0,-1,0-(0.5*diameter)]) rotate([-90,0,0]) color("gray") cylinder(h=length+2,d=diameter, center=false);
    }
    mount_hand_lip(diameter = width, width = 8, height = height, length = length);
  }
}


module mount_hand_lip( width, diameter, length, height) {
  
  intersection() { 
    translate([0,length,height+2]) translate([0,0,0-(0.5*diameter)]) rotate([-90,0,0]) cylinder(h = width-6, d = diameter+2, center = false);
    translate([0,length,0]) translate([0-(0.5*diameter),0,0]) cube([diameter,width,diameter], false);
  }
}

module screwdriver_hole(){
  translate([width/2,17,-3]) color("blue") cylinder(h=mount_depth+mount_depth, d = screw_dia, center = false);
}

module screw_head_hole() {
  translate([width/2,17,37]) color("pink") cylinder(h=4, d = .80*washer_dia, center = false);
}

module main() {

  difference() {
    minkowski() {
      sphere(1.5);
      union() {
	color("green") mount_shoulder();
	color("red") mount_arm();
	rotate([-3,0,0]) translate([12.5,0,0]) mount_hand(diameter = 32, width = 25, height = 12, length = hook_depth);
      }
    }
    screwdriver_hole();
    screw_head_hole();
  }
}

rotate([00,-90,0]) main();
