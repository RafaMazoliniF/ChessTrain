import 'package:chess/Models/chessboardmodel.dart';
import 'package:chess/pieces/piece.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Knight extends StatelessWidget with Piece {
  final String color;

  const Knight({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return color == "white"
        ? SvgPicture.asset('assets/pieces/wN.svg')
        : SvgPicture.asset('assets/pieces/bN.svg');
  }

  @override
  bool canMove(
      int fromX, int fromY, int toX, int toY, List<List<String>> layout) {
    return false;
  }
}
