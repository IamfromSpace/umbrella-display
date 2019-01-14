/**
 * Copyright 2018 Nathan Fairhurst.
 */

module male(
  height, // the height of the entire piece
  width, // width of the entire piece
  tolerance // Room for error
) {
  translate([0,0, -tolerance / 2])
    union()
      cylinder(height / 2 + tolerance, width / 2 + tolerance, width / 2 + tolerance);
      cylinder(height + tolerance, width / 4 + tolerance, width / 4 + tolerance);
}

module link(
  height, // the height of the entire piece
  width, // diameter of the largest cylinder
  arm_length, // center to center distance
  tolerance // Room for error
) {
  difference() {
    union() {
      male(height, width, 0);
      translate([0, -width / 4, 0])
        cube([arm_length, width / 2, height / 2]);
      translate([arm_length, 0, 0])
        cylinder(height, width / 2, width / 2);
      translate([arm_length - width , -width / 4, 0])
        cube([width, width / 2, height]);
    }
    translate([arm_length, 0, 0])
      male(height,width,tolerance);
  }
}

link(
  10, // height
  10, // width
  80, // arm_length
  0.3, // tolerance
  $fn=30
);