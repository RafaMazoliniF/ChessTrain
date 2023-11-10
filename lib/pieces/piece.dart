import 'package:chess/Models/chessboardmodel.dart';
import 'package:flutter/material.dart';

abstract mixin class Piece implements Widget {
  bool canMove(int i1, int j1, int i2, int j2, List<List<String>> layout);
}
