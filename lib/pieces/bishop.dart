import 'dart:math';
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
  bool canMove(int fromX, int fromY, int toX, int toY) {
    int movX = toY - fromY;
    int movY = toX - fromX;

    if (color == "white") {
      if (pow(movX, 2) == pow(movY, 2)) {
        return true;
      }
    }

    return false;
  }
}
