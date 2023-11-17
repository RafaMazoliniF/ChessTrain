import 'package:flutter/material.dart';

abstract mixin class Piece implements Widget {
  abstract final String color;

  bool canMove(int i1, int j1, int i2, int j2, List<List<String>> layout,
      bool isWhitesTurn);
  bool isWithinBounds(List<int> position) {
    return position[0] >= 0 &&
        position[0] < 8 &&
        position[1] >= 0 &&
        position[1] < 8;
  }

  bool isFriend(List<int> position, List<List<String>> layout) {
    return layout[position[0]][position[1]][0] == color[0];
  }
}
