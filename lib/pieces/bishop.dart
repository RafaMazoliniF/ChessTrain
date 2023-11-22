import 'package:collection/collection.dart';
import 'package:chess/pieces/piece.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class Bishop extends StatelessWidget with Piece {
  @override
  final String color;
  late String enemy;

  Bishop({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    color == "white" ? enemy = "b" : enemy = "w";

    return color == "white"
        ? SvgPicture.asset('assets/pieces/wB.svg')
        : SvgPicture.asset('assets/pieces/bB.svg');
  }

  @override
  void setMovePossibilites(int i, int j, List<List<String>> layout) {
    List<List<int>> movePossibilitiesAux = [];
    for (var row = i + 1, column = j + 1;
        row <= 7 && column <= 7;
        row++, column++) {
      if (layout[row][column] == "00") {
        movePossibilitiesAux.add([row, column]);
      } else if (layout[row][column][0] == enemy) {
        movePossibilitiesAux.add([row, column]);
        break;
      } else {
        break;
      }
    }
    for (var row = i - 1, column = j + 1;
        row >= 0 && column <= 7;
        row--, column++) {
      if (layout[row][column] == "00") {
        movePossibilitiesAux.add([row, column]);
      } else if (layout[row][column][0] == enemy) {
        movePossibilitiesAux.add([row, column]);
        break;
      } else {
        break;
      }
    }

    for (var row = i + 1, column = j - 1;
        row <= 7 && column >= 0;
        row++, column--) {
      if (layout[row][column] == "00") {
        movePossibilitiesAux.add([row, column]);
      } else if (layout[row][column][0] == enemy) {
        movePossibilitiesAux.add([row, column]);
        break;
      } else {
        break;
      }
    }

    for (var row = i - 1, column = j - 1;
        row >= 0 && column >= 0;
        row--, column--) {
      if (layout[row][column] == "00") {
        movePossibilitiesAux.add([row, column]);
      } else if (layout[row][column][0] == enemy) {
        movePossibilitiesAux.add([row, column]);
        break;
      } else {
        break;
      }
    }

    movePossibilities = movePossibilitiesAux;
  }

  @override
  bool canMove(int i1, int j1, int i2, int j2, List<List<String>> layout,
      bool isWhitesTurn) {
    if ((color == "white" && !isWhitesTurn) ||
        (color == "black" && isWhitesTurn)) {
      return false;
    }

    //Verification
    if (!movePossibilities
        .any((element) => const ListEquality().equals(element, [i2, j2]))) {
      return false;
    }

    return true;
  }
}
