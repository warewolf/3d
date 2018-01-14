// http://www.openscad.org/cheatsheet/index.html?version=2015.03 


// 56.50mm apart ---> ()  () <----
// 35 apart () <--> ()
// 10mm dia ---> () <---
$fn = 32;


module connector( radius, separation, height, perimeter ) {
  difference() {
  cube([perimeter+separation,(radius*2)+perimeter,height]);
  #translate([.5*perimeter+radius,0.5*perimeter+radius,0])      cylinder(h = height, r = radius, center=false);
  #translate([separation-radius+(0.5*perimeter),radius+(0.5*perimeter),0]) cylinder(h = height, r = radius, center=false);
  }
}

module main() {
  connector(perimeter=2, radius = 5, separation = 56.50, height = 2);
}

main();
