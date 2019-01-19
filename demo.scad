/**
 * Copyright 2018 Nathan Fairhurst.
 */

use <drawer.scad>
use <display.scad>

module demo()
{
  row_dist = 28.09875;
  column_dist = 47.625;

  drawer( // this should all be measured for real
    40,
    7 * column_dist,
    row_dist * 9,
    5,
    70,
    20
  );
  translate([column_dist / 2, row_dist / 2])
    display(
      9, // rows
      7, // columns
      row_dist,
      column_dist,
      false, // has_top_connectors
      false, // has_bottom_connectors
      false, // has_left_connectors
      false, // has_right_connectors
      0.3, // tolerance
      $fn=30
    );
}

demo();
