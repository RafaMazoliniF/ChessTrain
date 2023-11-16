import 'package:chess/pieces/piece.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:collection/collection.dart';

// ignore: must_be_immutable
class Pawn extends StatelessWidget with Piece {
  @override
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

    //Whites
    if (color == "white") {
      if (i1 == 0) {
        return false;
      }

      //Define move possibilities
      isFirstMove
          ? movePossibilities = [
              [i1 - 1, j1],
              [i1 - 2, j1]
            ]
          : movePossibilities = [
              [i1 - 1, j1]
            ];

      //If has piece barrier
      layout[movePossibilities[0][0]][movePossibilities[0][1]] != "00"
          ? movePossibilities = []
          : {};

      //Can capture
      if (i1 - 1 >= 0 && j1 - 1 >= 0 && layout[i1 - 1][j1 - 1][0] == "b") {
        movePossibilities.add([i1 - 1, j1 - 1]);
      }

      if (i1 - 1 >= 0 && j1 + 1 <= 7 && layout[i1 - 1][j1 + 1][0] == "b") {
        movePossibilities.add([i1 - 1, j1 + 1]);
      }
    }

    //Blacks
    else {
      if (i1 == 7) {
        return false;
      }

      //Define move possibilities
      isFirstMove
          ? movePossibilities = [
              [i1 + 1, j1],
              [i1 + 2, j1]
            ]
          : movePossibilities = [
              [i1 + 1, j1]
            ];

      //If has piece barrier
      layout[movePossibilities[0][0]][movePossibilities[0][1]] != "00"
          ? movePossibilities = []
          : {};

      //Can capture
      if (i1 + 1 <= 7 && j1 - 1 >= 0 && layout[i1 + 1][j1 - 1][0] == "w") {
        movePossibilities.add([i1 + 1, j1 - 1]);
      }

      if (i1 + 1 <= 7 && j1 + 1 <= 7 && layout[i1 + 1][j1 + 1][0] == "w") {
        movePossibilities.add([i1 + 1, j1 + 1]);
      }
    }

    //Check if is in move possibilities
    if (!movePossibilities
        .any((element) => const ListEquality().equals(element, [i2, j2]))) {
      return false;
    }

    isFirstMove = false;
    return true;
  }
}
