import 'package:flutter/material.dart';

// ignore: must_be_immutable
mixin Piece implements Widget {
  abstract final String color;
  late List<List<int>> _movePossibilities;
  List<List<int>> get movePossibilities => _movePossibilities;
  set movePossibilities(List<List<int>> movePossibilities) {
    _movePossibilities = movePossibilities;
  }

  void setMovePossibilites(int i, int j, List<List<String>> layout);

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
