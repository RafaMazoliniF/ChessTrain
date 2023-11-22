import 'package:chess/pieces/bishop.dart';
import 'package:chess/pieces/piece.dart';
import 'package:chess/pieces/rook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class Queen extends StatelessWidget with Piece {
  @override
  final String color;
  late Bishop bishop = Bishop(color: color);
  late Rook rook = Rook(color: color);

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
  void setMovePossibilites(int i, int j, List<List<String>> layout) {
    List<List<int>> movePossibilitiesBishop = [];
    List<List<int>> movePossibilitiesRook = [];

    bishop.setMovePossibilites(i, j, layout);
    movePossibilitiesBishop = bishop.movePossibilities;
    rook.setMovePossibilites(i, j, layout);
    movePossibilitiesRook = rook.movePossibilities;

    movePossibilities = movePossibilitiesBishop + movePossibilitiesRook;
  }

  @override
  bool canMove(int i1, int j1, int i2, int j2, List<List<String>> layout,
      bool isWhitesTurn) {
    if ((color == "white" && !isWhitesTurn) ||
        (color == "black" && isWhitesTurn)) {
      return false;
    }

    if (bishop.canMove(i1, j1, i2, j2, layout, isWhitesTurn) ||
        rook.canMove(i1, j1, i2, j2, layout, isWhitesTurn)) {
      return true;
    }

    return false;
  }
}
