import 'package:flutter/material.dart';

abstract mixin class Piece implements Widget {
  bool canMove(int fromX, int fromY, int toX, int toY);
}
