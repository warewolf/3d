$fs=.5;
$fa=5;

// vim: foldmethod=marker commentstring=/*\ %s\ */
// 2.0mm height

slop = .2;
module oldhead( height, radius, separation) {
  translate([0,0-(.5*separation),0]) union() {
    hull() {
      translate([0-separation,0,0]) color("red") cylinder(h = height,r = radius);
      translate([0,separation,0]) color("red") cylinder(h = height,r = radius);
    }

    hull() {
      translate([separation,0,0]) color("red") cylinder(h = height,r = radius);
      translate([0,separation,0]) color("red") cylinder(h = height,r = radius);
    }
  }
}

module head( height, radius, separation) {/* {{{ */
  rotate([0,0,180]) hull() {
    translate([0-separation,0,0]) color("red") cylinder(h = height,r = radius);
    translate([0,separation*2,0]) color("green") cylinder(h = height,r = radius);
    translate([separation,0,0]) color("blue") cylinder(h = height,r = radius);
  }
} /* }}} */

module neck(height, width, depth) {
  translate([0-(.5*width),0-depth,0]) 
  difference() { 
    cube([width,depth,height], center=false);
    // translate([(width*.65)/2,0,0-.5*slop]) cube([.5*slop+(.35*width),(1/6)*depth,height+slop], center=false);
    translate([(0-.5*slop)+((width*.65)/2),0-.5*slop,0-.5*slop]) cube([slop+(.35*width),(.5*slop)+((1/6)*depth),height+slop], center=false);
  }
}

module body(height,radius,separation, width, depth,cutout) {
  difference() {
    union() { 
      head( height=height, radius=radius, depth=depth, separation=separation);
      neck( height=height, width=width, depth=depth);
    }
   // concave cutouts for capturing gunk with the tool 
   translate([0-cutout,-25,0]) translate([0,0,0-(.5*slop)]) cylinder(r=40,h=height+slop);
   translate([cutout,-25,0]) translate([0,0,0-(.5*slop)]) cylinder(r=40,h=height+slop);
  }
}

module extension(height, width, depth) {
  translate([0-(.5*width),0-depth,0]) 
  union() {
      cube([width,depth,height], center=false);
    translate([(.5*slop)+(width*.65)/2,depth,0]) cube([(.35*width)-slop,(1/6)*depth,height], center=false);
  }
}

module main() {
  body( depth=160, height=2, radius=5, separation=15, width=15,cutout=45);
     translate([-40 ,0,0])
  //  translate([-0 ,-160,0]) // testing
extension( height=2, width=15, depth=160);
}




main();
