/**
 * Copyright 2018 Nathan Fairhurst.
 */

use <link.scad>
use <pip.scad>

function i(b) = b ? 1 : 0;

module display(
  rows, // 
  columns, // 
  row_dist, // how wide the cone should be at the base
  column_dist, // how much space their should be between the hole edge and the cone edge
  has_top_connectors,
  has_bottom_connectors,
  has_left_connectors,
  has_right_connectors,
  lean_first, // should the "front" pip lean like the others?
  tolerance // Room for error
) {
  for(i = [0:rows - 1])
    translate([-column_dist / 2, i * row_dist, 0])
      link(
        5,
        10,
        column_dist * columns,
        has_left_connectors,
        has_right_connectors,
        tolerance
      ); // TODO: Parameterize

  for(i = [0:columns - 1])
    translate([i * column_dist, -row_dist / 2, 0])
      rotate([0, 0, 90])
        link(
          5,
          10,
          row_dist * rows,
          has_bottom_connectors,
          has_top_connectors,
          tolerance
        ); // TODO: Parameterize

  for(y = [0:rows - 1])
    for(x = [0:columns - 1])
      translate([x * column_dist, y * row_dist, 0])
        // the first row stands straight up
        rotate([0, 0, 180])
          pip(lean_first && y == 0 ? 0 : 17, 20, 1, 2.5, tolerance); // TODO: Parameterize
}

display(
  9, // rows
  5, // columns
  31.2208333, // row_dist
  76.5175, // column_dist
  true, // has_top_connectors
  false, // has_bottom_connectors
  false, // has_left_connectors
  true, // has_right_connectors
  true, // lean_first
  0.3, // tolerance
  $fn=30
);
