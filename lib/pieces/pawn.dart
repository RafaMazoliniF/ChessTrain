import 'package:chess/Models/chessboardmodel.dart';
import 'package:chess/pieces/piece.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:collection/collection.dart';

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
  //Receves the "from" position, the "to" position and the current layout
  bool canMove(int i1, int j1, int i2, int j2, List<List<String>> layout) {
    List<List<int>> movePossibilities = [];
    if (color == "white") {
      //Define move possibilities
      isFirstMove
          ? movePossibilities = [
              [i1 - 1, j1],
              [i1 - 2, j1]
            ]
          : movePossibilities = [
              [i1 - 1, j1]
            ];

      //Check if is in move possibilities
      if (!movePossibilities
          .any((element) => const ListEquality().equals(element, [i2, j2]))) {
        return false;
      }

      for (var possibilty in movePossibilities) {
        //is the target of the move
        if (possibilty[0] == i2 && possibilty[1] == j2) {
          //if the target is white
          if (layout[i2][j2][0] == "w") {
            return false;
          }
        } else {
          if (layout[possibilty[0]][possibilty[1]] != "00") {
            return false;
          }
        }
      }
    }

    isFirstMove = false;
    return true;
  }
}
