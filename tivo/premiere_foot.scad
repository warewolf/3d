include <MCAD/regular_shapes.scad>

slop=0.2;

$fn=64;
height = 7;
screw_rest_height=2.6;
screw_dia=4.25;

module main( width = 41.5, height = 7, id=10.5, screw_rest_height=2.6, screw_dia=4.25, inset_scale = 0.85) {
  difference() {
    union() {
      difference() {
	oval_torus(inner_radius = id/2, thickness=[width,height*2]); // main body
	oval_torus(inner_radius = 1.3*(id/2), thickness=[inset_scale*width,1.4*height]); // main body
      }
      cylinder(h=screw_rest_height*2,d = id*1.2,center=true); // shelf
    }
    translate([0,0,0-(.5*height)]) cube([width*3,width*3,height],center=true); // remove bottom half
    cylinder(h=height+slop,d = screw_dia,center=true); // cut out screw hole
  }
}

//difference() {
  main( width=30/2, id=10.5, inset_scale=.75);
//  rotate([0,0,240]) cube([100,100,100]);
//}
