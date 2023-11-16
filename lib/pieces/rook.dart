import 'package:chess/pieces/piece.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Rook extends StatelessWidget with Piece {
  @override
  final String color;

  const Rook({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return color == "white"
        ? SvgPicture.asset('assets/pieces/wR.svg')
        : SvgPicture.asset('assets/pieces/bR.svg');
  }

  @override
  bool canMove(int i1, int j1, int i2, int j2, List<List<String>> layout) {
    List<List<int>> movePossibilities = [];
    List<int> newPosition = [];

    if (i1 != i2 && j1 != j2) {
      return false;
    }

    //If movement is vertical
    for (int j = 0; j <= 7; j++) {
      newPosition = [i1, j];

      if (!newPosition.equals([i1, j1]) &&
          !hasPieceBarrier([i1, j1], newPosition, layout) &&
          !isFriend(newPosition, layout)) {
        movePossibilities.add(newPosition);
      }
    }

    //If movement is horizontal
    for (int i = 0; i <= 7; i++) {
      newPosition = [i, j1];

      if (!newPosition.equals([i1, j1]) &&
          !hasPieceBarrier([i1, j1], newPosition, layout) &&
          !isFriend(newPosition, layout)) {
        movePossibilities.add(newPosition);
      }
    }

    //Verification
    if (!movePossibilities
        .any((element) => const ListEquality().equals(element, [i2, j2]))) {
      return false;
    }

    return true;
  }
}

bool hasPieceBarrier(List<int> currentPosition, List<int> targetPosition,
    List<List<String>> layout) {
  //If the movement is vertical
  if (currentPosition[1] == targetPosition[1]) {
    //Orientation of the movement
    if (currentPosition[0] < targetPosition[0]) {
      for (int i = currentPosition[0] + 1; i < targetPosition[0]; i++) {
        if (layout[i][currentPosition[1]] != "00") {
          return true;
        }
      }
    } else {
      for (int i = currentPosition[0] - 1; i > targetPosition[0]; i--) {
        if (layout[i][currentPosition[1]] != "00") {
          return true;
        }
      }
    }
  }

  //If the movement is horizontal
  else if (currentPosition[0] == targetPosition[0]) {
    //Orientation of the movement
    if (currentPosition[1] < targetPosition[1]) {
      for (int j = currentPosition[1] + 1; j < targetPosition[1]; j++) {
        if (layout[currentPosition[0]][j] != "00") {
          return true;
        }
      }
    } else {
      for (int j = currentPosition[1] - 1; j > targetPosition[1]; j--) {
        if (layout[currentPosition[0]][j] != "00") {
          return true;
        }
      }
    }
  }

  return false;
}
