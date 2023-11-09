import 'package:chess/pieces/piece.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Rook extends StatelessWidget with Piece {
  final String color;

  const Rook({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return color == "white"
        ? SvgPicture.asset('assets/pieces/wR.svg')
        : SvgPicture.asset('assets/pieces/bR.svg');
  }

  @override
  bool canMove(int fromX, int fromY, int toX, int toY) {
    return false;
  }
}
