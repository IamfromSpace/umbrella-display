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
  tolerance // Room for error
) {
  for(i = [0:rows - 1])
    translate([has_left_connectors ? -column_dist / 2 : 0, i * row_dist, 0])
      link(
        5,
        10,
        column_dist * (columns - (i(!has_left_connectors) + i(!has_right_connectors)) / 2),
        has_left_connectors,
        has_right_connectors,
        tolerance
      ); // TODO: Parameterize

  for(i = [0:columns - 1])
    translate([i * column_dist, has_bottom_connectors ? -row_dist / 2 : 0, 0])
      rotate([0, 0, 90])
        link(
          5,
          10,
          row_dist * (rows - (i(!has_bottom_connectors) + i(!has_top_connectors)) / 2),
          has_bottom_connectors,
          has_top_connectors,
          tolerance
        ); // TODO: Parameterize

  for(y = [0:rows - 1])
    for(x = [0:columns - 1])
      translate([x * column_dist, y * row_dist, 0])
        pip(20,25,10,2,2,tolerance); // TODO: Parameterize
}

display(
  9, // rows
  7, // columns
  31.75, // row_dist
  46.0375, // column_dist
  true, // has_top_connectors
  false, // has_bottom_connectors
  false, // has_left_connectors
  true, // has_right_connectors
  0.3, // tolerance
  $fn=30
);
