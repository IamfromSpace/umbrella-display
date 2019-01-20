/**
 * Copyright 2018 Nathan Fairhurst.
 */

use <umbrella.scad>
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
  translate([column_dist / 2, row_dist / 2]) {
    display(
      rows,
      columns,
      row_dist,
      column_dist,
      false, // has_top_connectors
      false, // has_bottom_connectors
      false, // has_left_connectors
      false, // has_right_connectors
      true, // lean_first
      0.3, // tolerance
      $fn=30
    );
    for(y = [0:rows - 1])
      for(x = [0:columns - 1])
        // fudging the math on the umbrella offset from rotation
        translate([x * column_dist, y * row_dist + (y == 0 ? 0 : -6), 0])
          rotate([y == 0 ? 0 : -17, 0, 0])
            umbrella(y == 0 ? 50 : 15);
  }
}

demo();
