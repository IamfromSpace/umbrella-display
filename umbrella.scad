/**
 * Copyright 2018 Nathan Fairhurst.
 */

module umbrella(open_angle) {
  umbrella_length = 41.275;
  expansion = sin(open_angle) * umbrella_length;
  downward = cos(open_angle) * umbrella_length;

  cylinder(12.7, 0.5, 2);
  translate([0, 0, 12.7])
    cylinder(88.9, 2, 2);
  translate([0, 0, 92.075])
    cylinder(9.525, 4.7625, 4.7625);
  translate([0, 0, 92.075 - downward])
    cylinder(downward, expansion + 4.7625, 4.7625);
}

umbrella(45);
