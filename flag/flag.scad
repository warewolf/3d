
fudge = 0.2;

module base( width = width, height = height, cutout = cutout ) {
 difference() {
   intersection() {
     rotate([0,0,45]) cube([width,width,height],true); 
     cube([width,width,height],true); 
   };
   cube([cutout+fudge,cutout+fudge,height],true);
 }
}

module main() {
  //base(width = 20, height = 3, cutout = 3);
  //translate([22,0,0])
  cylinder_flag(width = 10,height = 35, depth = 3, string = "1", font_size = 8, pole = 50, pole_width = 3);
}

module cylinder_flag(width = width, height = height, depth = depth, font_size = font_size, string = string) {
  cube([width,height,depth]);
  translate([.5*(0.75*height)-1,5,0]) color("green") cylinder(h=depth, d = .75*height);
}

module half_flag( width = width, height = height, depth = depth, font_size = font_size, string = string) {
  difference() {
    cube([width,height,depth] );
    translate([.60*height,.75*height,0]) cylinder(h = depth, d = .75*height);
  }
  intersection() {
    translate([width,0,0]) cube([width,height,depth]);
    translate([-1,8,0]) cylinder(h = depth, d = .75*height);
  }
}
module flag2( width = width, height = height, depth = depth, font_size = font_size, string = string) {
  difference() {
    cube([width,height,depth], true);
    translate([1.2*width,.50*width,0]) cylinder(h = depth, d = .85*height, center=true);
    translate([0-1.2*width,0-.50*width,0]) cylinder(h = depth, d = .85*height, center=true);
    rotate([0,0,90]) linear_extrude(height = depth*2) {
	text(text = str(string), font = font, size = font_size, valign = "center");
    }
  }
}

//rotate([0,0,90]) linear_extrude(height = depth*2) {
//	text(text = str(string), font = font, size = font_size, valign = "center");
//   }
main();
