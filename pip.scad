/**
 * Copyright 2018 Nathan Fairhurst.
 */

module pip(
  lean_angle, // the angle at which the umbrella will lean
  height, // how tall the cone should be
  wall_width, // how much space their should be between the hole edge and the cone edge
  pick_diameter, // the diameter of a toothpick
  tolerance // Room for error
) {
  slot_offset = wall_width / cos(lean_angle);
  width = 3 * tolerance + 2 * wall_width + pick_diameter;
  bottom_width = tan(lean_angle) * height * 2 + width;

  intersection() {
    translate([-(pick_diameter + wall_width * 2 + tolerance * 3) / 2,-(bottom_width + tolerance) / 2, 0])
      cube([pick_diameter + wall_width * 2 + tolerance * 3, bottom_width + tolerance, height]);
    difference () {
      cylinder(height, bottom_width / 2, width / 2);
      translate([0, 0, height])
        rotate([lean_angle, 0, 0])
          translate([0, 0, -2.5 * height])
            cylinder(5 * height, pick_diameter / 2 + tolerance, pick_diameter / 2 + tolerance);
    }
  }
}

pip(
  25, // lean_angle
  10, // height
  2, // wall_width
  2, // pick_diameter
  0.3, // tolerance
  $fn=30
);
