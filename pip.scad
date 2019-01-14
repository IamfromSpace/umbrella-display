/**
 * Copyright 2018 Nathan Fairhurst.
 */

module pip(
  lean_angle, // the angle at which the umbrella will lean
  height, // how tall the cone should be
  width, // how wide the cone should be at the base
  wall_width, // how much space their should be between the hole edge and the cone edge
  pick_diameter, // the diameter of a toothpick
  tolerance // Room for error
) {
  slot_offset = wall_width / cos(lean_angle);

  difference () {
    cylinder(height, width, 0);
    translate([0, 0, height])
      rotate([lean_angle,0,0])
        translate([0, -(wall_width + pick_diameter + tolerance), -2.5 * height])
          cylinder(5 * height, pick_diameter + tolerance, pick_diameter + tolerance);
  }
}

pip(
  25, // lean_angle
  10, // height
  10, // width
  2, // wall_width
  1, // pick_diameter
  0.3, // tolerance
  $fn=30
);
