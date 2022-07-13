tower = 3;
gap = 15;
base=.5;
height = 10;

union() {
  cube([gap+2,gap+2,base],center=true);
  for (x=[0,1], y=[0,1]) {
     mirror([x,y,0]) translate([5,5,0]) cube([tower,tower,height]);
  }
}
