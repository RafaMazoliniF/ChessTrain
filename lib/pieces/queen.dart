import 'package:chess/Models/chessboardmodel.dart';
import 'package:chess/pieces/piece.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Queen extends StatelessWidget with Piece {
  final String color;

  const Queen({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return color == "white"
        ? SvgPicture.asset('assets/pieces/wQ.svg')
        : SvgPicture.asset('assets/pieces/bQ.svg');
  }

  @override
  bool canMove(
      int fromX, int fromY, int toX, int toY, List<List<String>> layout) {
    return false;
  }
}
