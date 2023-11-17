import 'package:collection/collection.dart';
import 'package:chess/pieces/piece.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Bishop extends StatelessWidget with Piece {
  @override
  final String color;

  const Bishop({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return color == "white"
        ? SvgPicture.asset('assets/pieces/wB.svg')
        : SvgPicture.asset('assets/pieces/bB.svg');
  }

  @override
  bool canMove(int i1, int j1, int i2, int j2, List<List<String>> layout,
      bool isWhitesTurn) {
    if ((color == "white" && !isWhitesTurn) ||
        (color == "black" && isWhitesTurn)) {
      return false;
    }

    List<List<int>> movePossibilities = [];
    int dI = i2 - i1, dJ = j2 - j1;

    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        //Map all possible positions
        if (dI.abs() == dJ.abs() &&
            !hasPieceBarrier([i1, j1], [i2, j2], layout) &&
            !isFriend([i2, j2], layout)) {
          movePossibilities.add([i, j]);
        }
      }
    }

    //Verification
    if (!movePossibilities
        .any((element) => const ListEquality().equals(element, [i2, j2]))) {
      return false;
    }

    return true;
  }

  bool hasPieceBarrier(List<int> currentPosition, List<int> targetPosition,
      List<List<String>> layout) {
    int dI = targetPosition[0] - currentPosition[0];
    int dJ = targetPosition[1] - currentPosition[1];
    List<List<int>> possibilities = [];

    //Map all possible positions in the diagonal
    for (int i = 1; i < dI.abs() || i < dJ.abs(); i++) {
      //to top-left
      if (dI.isNegative && dJ.isNegative) {
        possibilities.add([currentPosition[0] - i, currentPosition[1] - i]);
      }

      //to top-right
      else if (dI.isNegative && !dJ.isNegative) {
        possibilities.add([currentPosition[0] - i, currentPosition[1] + i]);
      }

      //to bottom-left
      else if (!dI.isNegative && dJ.isNegative) {
        possibilities.add([currentPosition[0] + i, currentPosition[1] - i]);
      }

      //to bottom-right
      else {
        possibilities.add([currentPosition[0] + i, currentPosition[1] + i]);
      }
    }

    //Verify possibilities
    for (var possibilty in possibilities) {
      if (layout[possibilty[0]][possibilty[1]] != "00") {
        return true;
      }
    }

    return false;
  }
}
