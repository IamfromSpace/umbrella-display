/**
 * Copyright 2018 Nathan Fairhurst.
 */

module handled_edge(
  depth,
  width,
  wall_thickness,
  handle_width,
  handle_height,
) {
  difference() {
    translate([-wall_thickness,-wall_thickness,0])
      cube([width + wall_thickness * 2, depth + wall_thickness, wall_thickness]);
    if (handle_width && handle_height)
      translate([(width - handle_width + handle_height) / 2, depth / 2, -wall_thickness / 2]) {
        cylinder(wall_thickness * 2, handle_height / 2, handle_height / 2);
        translate([0, -handle_height / 2, 0])
          cube([handle_width - handle_height, handle_height, wall_thickness * 2]);
        translate([handle_width - handle_height, 0, 0])
          cylinder(wall_thickness * 2, handle_height / 2, handle_height / 2);
    }
  }
}

module drawer(
  depth,
  width,
  height,
  wall_thickness,
  handle_width,
  handle_height
) {
  translate([0, 0, -wall_thickness])
    cube([width, height, wall_thickness]);
  rotate([90, 0, 0])
    handled_edge(depth, width, wall_thickness);
  translate([0, height + wall_thickness, 0])
    rotate([90, 0, 0]) 
      handled_edge(depth, width, wall_thickness);
  translate([-wall_thickness, 0, 0])
    rotate([90, 0, 90])
      handled_edge(depth, height, wall_thickness, handle_width, handle_height);
  translate([width, 0, 0])
    rotate([90, 0, 90])
      handled_edge(depth, height, wall_thickness, handle_width, handle_height);
}

drawer(
  20,
  120,
  100,
  5,
  30,
  10
);
