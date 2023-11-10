import 'dart:math';
import 'package:chess/Models/chessboardmodel.dart';
import 'package:chess/pieces/piece.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Bishop extends StatelessWidget with Piece {
  final String color;

  const Bishop({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return color == "white"
        ? SvgPicture.asset('assets/pieces/wB.svg')
        : SvgPicture.asset('assets/pieces/bB.svg');
  }

  @override
  bool canMove(int i1, int j1, int i2, int j2, List<List<String>> layout) {
    int movJ = j2 - j1;
    int movI = i2 - i1;

    if (color == "white") {
      if (pow(movJ, 2) == pow(movI, 2)) {
        return true;
      }
    }

    return false;
  }
}
