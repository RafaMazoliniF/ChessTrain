import 'package:chess/pieces/piece.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:collection/collection.dart';

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
  bool canMove(int i1, int j1, int i2, int j2, List<List<String>> layout) {
    List<List<int>> movePossibilities = [
      [i1 + 2, j1 + 1],
      [i1 + 2, j1 - 1],
      [i1 - 2, j1 + 1],
      [i1 - 2, j1 - 1],
      [i1 + 1, j1 + 2],
      [i1 - 1, j1 + 2],
      [i1 + 1, j1 - 2],
      [i1 - 1, j1 - 2]
    ];

    // New legal possibilities
    movePossibilities = movePossibilities
        .where((possibility) =>
            isWithinBounds(possibility) && !isFriend(possibility, layout))
        .toList();

    //Verification
    if (!movePossibilities
        .any((element) => const ListEquality().equals(element, [i2, j2]))) {
      return false;
    }

    return true;
  }

  bool isWithinBounds(List<int> position) {
    return position[0] >= 0 &&
        position[0] < 8 &&
        position[1] >= 0 &&
        position[1] < 8;
  }

  bool isFriend(List<int> position, List<List<String>> layout) {
    return layout[position[0]][position[1]][0] == color[0];
  }
}
