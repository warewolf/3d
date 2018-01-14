diameter = 41.35;
height = 6;
width = 1.75;

$fs = 0.5;
$fa = 2;


module spacer(diameter, height, width) {
  difference() {
  cylinder(d = diameter,h = height);
  cylinder(d = diameter-width,h = height);
  }
}

module main() {
  spacer(diameter = diameter, height = height, width = width);
}

main();
