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

debug = 0;



module bootie(){
  difference() {
    union(){ 
      cylinder(d=9, h=21);
      cylinder(d=12.5, h=6.5);
    }
    cylinder(d=6.5, h=22);
  }
}

if (debug == 1) {
  difference() {
  bootie();
  translate([0,0-ball_bump_d,0-.5*slop]) cube([20,69,26]);
  }
} else {
  bootie();
}
