import 'package:chess/pieces/bishop.dart';
import 'package:chess/pieces/piece.dart';
import 'package:chess/pieces/rook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Queen extends StatelessWidget with Piece {
  @override
  final String color;
  late Bishop bishop;
  late Rook rook;

  Queen({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    bishop = Bishop(color: color);
    rook = Rook(color: color);

    return color == "white"
        ? SvgPicture.asset('assets/pieces/wQ.svg')
        : SvgPicture.asset('assets/pieces/bQ.svg');
  }

  @override
  bool canMove(int i1, int j1, int i2, int j2, List<List<String>> layout) {
    if (bishop.canMove(i1, j1, i2, j2, layout) ||
        rook.canMove(i1, j1, i2, j2, layout)) {
      return true;
    }

    return false;
  }
}
