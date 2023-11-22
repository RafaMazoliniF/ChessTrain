import 'package:chess/pieces/piece.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class Rook extends StatelessWidget with Piece {
  @override
  final String color;

  Rook({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return color == "white"
        ? SvgPicture.asset('assets/pieces/wR.svg')
        : SvgPicture.asset('assets/pieces/bR.svg');
  }

  @override
  void setMovePossibilites(int i, int j, List<List<String>> layout) {
    List<List<int>> movePossibilitiesAux = [];
    for (int k = i + 1; k <= 7; k++) {
      var possibility = layout[k][j];
      if (possibility[0] == color[0]) {
        break;
      } else {
        movePossibilitiesAux.add([k, j]);
        if (possibility != "00") {
          break;
        }
      }
    }
    for (int k = i - 1; k >= 0; k--) {
      var possibility = layout[k][j];
      if (possibility[0] == color[0]) {
        break;
      } else {
        movePossibilitiesAux.add([k, j]);
        if (possibility != "00") {
          break;
        }
      }
    }
    for (int k = j + 1; k <= 7; k++) {
      var possibility = layout[i][k];
      if (possibility[0] == color[0]) {
        break;
      } else {
        movePossibilitiesAux.add([i, k]);
        if (possibility != "00") {
          break;
        }
      }
    }
    for (int k = j - 1; k >= 0; k--) {
      var possibility = layout[i][k];
      if (possibility[0] == color[0]) {
        break;
      } else {
        movePossibilitiesAux.add([i, k]);
        if (possibility != "00") {
          break;
        }
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
