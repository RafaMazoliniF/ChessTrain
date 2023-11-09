import 'package:chess/pieces/piece.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class Pawn extends StatelessWidget with Piece {
  final String color;
  bool isFirstMove = true;

  Pawn({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return color == "white"
        ? SvgPicture.asset('assets/pieces/wP.svg')
        : SvgPicture.asset('assets/pieces/bP.svg');
  }

  @override
  bool canMove(int fromX, int fromY, int toX, int toY) {
    int movX = toY - fromY;
    int movY = toX - fromX;

    if (color == "white") {
      if (isFirstMove) {
        if (movX == 0 && (movY == -2 || movY == -1)) {
          isFirstMove = false;
          return true;
        }
      } else {
        if (movX == 0 && movY == -1) {
          return true;
        }
      }
    }

    return false;
  }
}
