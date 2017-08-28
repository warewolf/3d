use <Metric/M2.scad>;

$fs = 0.5;
$fa = 2;

w = 45;
d = 32;
h = 30;

hole_centers = 28.575/2; // confirmed correct

socket_inset = 3;
tube_dia=19;

underside_width = 35;
underside_depth = 24;

module blah() {
difference() {

  cylinder(h,d=socket_dia,true);
  
  // NutM2(h=4.6);
}
}

module main() {
  rotate([0,180,0])
  difference() {
    color("red") translate([0,0,0]) cylinder(h=h,d2=35,d1=60);
    translate([0,0,-socket_inset]) housing(height=h);
    translate([0,0,h-socket_inset]) color("blue") cylinder(h=3,d=.5+tube_dia);
    translate([-hole_centers,0,h+1.5]) color("green") BoltM2(l=h);
    translate([hole_centers,0,h+1.5]) color("green") BoltM2(l=h);
    translate([0,50,0]) rotate([90,0,0]) cylinder(h=100,d=35);
  }
}


module housing(height=16) {
  color("gray") hull() {
    translate([-hole_centers,0,0]) cylinder(h=height,r=3.5);
    cylinder(h=height, d=26);
    translate([hole_centers,0,0]) cylinder(h=height,r=3.5);
  }
}

main();
