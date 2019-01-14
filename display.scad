/**
 * Copyright 2018 Nathan Fairhurst.
 */

use <link.scad>
use <pip.scad>

module display(
  rows, // 
  columns, // 
  row_dist, // how wide the cone should be at the base
  column_dist, // how much space their should be between the hole edge and the cone edge
  tolerance // Room for error
) {
  for(i = [0:rows - 1])
    translate([-column_dist, i * row_dist, 0])
      link(5, 10, column_dist * (columns + 1), tolerance); // TODO: Parameterize

  for(i = [0:columns - 1])
    translate([i * column_dist, -row_dist, 0])
      rotate([0, 0, 90])
        link(5, 10, row_dist * (rows + 1), tolerance); // TODO: Parameterize

  for(y = [0:rows - 1])
    for(x = [0:columns - 1])
      translate([x * column_dist, y * row_dist, 0])
        pip(25,15,10,2,1,tolerance); // TODO: Parameterize
}

display(
  3, // rows
  4, // columns
  40, // row_dist
  30, // column_dist
  0.3, // tolerance
  $fn=30
);
