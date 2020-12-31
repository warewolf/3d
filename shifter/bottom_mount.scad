// vim: foldmethod=marker commentstring=\ //\ %s
//
include <MCAD/units.scad>;
include <MCAD/bearing.scad>;
include <MCAD/materials.scad>;
include <MCAD/teardrop.scad>;
include <MCAD/metric_fastners.scad>;
include <warewolf.scad>;

slop = 0.2;





module bottom_mount(with_nut = 0) {
  difference() {
    for (flip=[0,1]) mirror([0,flip,0]) union() {
      translate([4,0,25]) difference() {
	sphere(r=10,$fa=0.01); // bump to catch bearing ID
	translate([0+(.2*10),0,0]) cube([20,20,20],center=true);
      } 
      translate([0,0,25]) rotate([0,90,0]) cylinder(d=30,h=10,center=true);
      translate([5,-14,14-slop]) rotate([90,-00,-90]) fillet(radius=15,height=10,v=[1.8,0.9]);
      translate([0,-40,0]) scale(v=[1.2,1,1]) sphere(d=30, $fa=0.01);
      translate([0,0,-1]) cube([10,80,30], center=true);
      translate([0,-20,10]) rotate([-45,0,0]) cube([10,10,30], center=true);
    }
    translate([0,0,-15]) cube([80+slop,130,30],center=true); // bottom chop-off
    translate([-20,0,0]) scale([1,1.70,0.85]) rotate([0,90,0]) cylinder(d=30,h=50); // bottom cut-out
    translate([0,0,25]) rotate([0,90,0]) cylinder(d=5+slop,h=80,center=true);
   if (with_nut == 1) {
     translate([5-(0.8*3)+slop,0,25])rotate([0,90,0]) flat_nut(5);
   }
  }
}
 rotate([0,0,$t*360]) translate([5+5/2,0,0]) {
   translate([5,0,0]) bottom_mount(with_nut = 1);
   mirror([1,0,0]) translate([20,0,0]) bottom_mount();
}
