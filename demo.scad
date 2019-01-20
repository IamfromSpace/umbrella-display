/**
 * Copyright 2018 Nathan Fairhurst.
 */

use <drawer.scad>
use <display.scad>

module demo()
{
  width = 382.5875;
  height = 280.9875;
  rows = 9;
  columns = 5;
  row_dist = height / rows;
  column_dist = width / columns;

  drawer( // this should all be measured for real
    40,
    width,
    height,
    5,
    70,
    20
  );
  translate([column_dist / 2, row_dist / 2])
    display(
      rows,
      columns,
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
