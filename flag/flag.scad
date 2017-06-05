$fn = 32;
fudge = 0.2;

module base( width = width, height = height, cutout = cutout ) {
 difference() {
   union() {
     translate([0,0,height]) cylinder(h = 3, d1 = .85*width, d2=.25*width);
     translate([0,0,.5*height])
     intersection() {
       rotate([0,0,45]) cube([width,width,height],true); 
       cube([width,width,height],true); 
     };
   }
   // make cutout slightly larger
   cube([cutout+fudge,cutout+fudge,height*4],true);
 }
}


module flag( height = height, width = width, depth = depth) {
  width = ratio * height;
  pole = 1.9*height;
  union() {
    difference() {
      cube([width,height,depth]);
	translate([.9*width,.9*height+width,0]) cylinder( h = depth, r = width);
	translate([0-.1*width,0-.9*width,0]) cylinder( h = depth, r = width);
    }
  cube([depth,pole+height,depth]);
  }
}

module main() {
                      base(width = 25, height = 3, cutout = 3);
  translate([20,0,0]) flag(height = 15, ratio = 1.6, depth = 3);
}

main();
