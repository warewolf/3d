//outer=16;
//inner=4.25;
magnet_radius=3.35/2;
width_overhang=8;
length_overhang=1.7;

module magnets(inner = 4.25, outer = 16, magnet_radius=3.35/2) {
  for (spin = [ 0,180]) {
    rotate([0,0,spin]) translate([.5*outer,0,0]) cylinder(h=.95, r2=magnet_radius,r1=magnet_radius*1.15,$fn=100);
    rotate([0,0,spin]) translate([.5*inner,0,0]) cylinder(h=.95, r2=magnet_radius,r1=magnet_radius*1.15,$fn=100);
  }
  if (1) { // leave this enabled, makes for a faster print
    hull() {
      for (spin = [ 0,180]) {
	rotate([0,0,spin]) translate([.5*(outer-magnet_radius),0,0]) cylinder(h=.95, r2=magnet_radius/2,r1=.5*magnet_radius*1.15,$fn=100);
      }
    }
  }
}

module main(outer=16,inner=4.25) {
  difference() {
  hull() {
    for (blah = [-10,10]) {
      translate([blah,0,0.1]) cylinder(h=4,d=magnet_radius*width_overhang,$fn=100);
    }
  }
  // translate([0,0,4/2+.01]) cube([outer*length_overhang,magnet_radius*width_overhang,4],center=true);
  magnets(outer=outer,inner=inner,magnet_radius=magnet_radius);
  }
}

translate([0,0*15,0]) rotate([0,180,0]) main(inner=4);
translate([0,1*15,0]) rotate([0,180,0]) main(inner=4.25);
translate([0,2*15,0]) rotate([0,180,0]) main(inner=5);
