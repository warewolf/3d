// screw head dia = 5.20 mm
// screw head height = 2.0 mm
// screw thread dia 3.0mm

$fs = 0.5;
$fa = 2;


screw_head_height=2;
groove_catch_height=2;
groove_travel_height=2;
screw_head_dia = 5.25;

length=2.5*screw_head_dia;


module top( width = 12, length = length, height = 2) {
  difference() {
    translate([0-(.5*width),0,0]) cube([width,length,height],false);
    translate([0,.75+(.5*screw_head_dia),0]) cylinder(d=screw_head_dia,h=height);
    translate([0-.5*3,screw_head_dia,0]) cube([3,length-.75-screw_head_dia-.75,height]);
  }
}

module bottom( width = 12, length = length, height = 2) {
  difference() {
    translate([0-(.5*width),0,0]) cube([width,length,height],false);
    translate([0-.5*screw_head_dia,.75,0]) cube([screw_head_dia,length-.75-.75-.75,height]);
  }
}

module foot() {
  union() {
    color("green") translate([0,0,2]) top();
    color("red") bottom();
  }
}

module left() {
  union() {
    foot();
    color("blue")   translate([screw_head_dia+.75,0,0]) cube([4*screw_head_dia,2.5*screw_head_dia,4]);
    color("yellow") translate([-6.0,length,0])          cube([12,4*screw_head_dia,4]);
  }
}

module right() {
  union() {
    foot();
    color("blue")   translate([0-(5*screw_head_dia)-.75,0,0]) cube([4*screw_head_dia,2.5*screw_head_dia,4]);
    color("yellow") translate([-6.0,0-length-screw_head_dia-2.5,0])          cube([12,4*screw_head_dia,4]);
  }
}
module main() {
  color("red") translate([10,20,0]) right();
  color("blue") translate([-10,-20,0]) left();
}

 rotate([180,0,0])
main();
