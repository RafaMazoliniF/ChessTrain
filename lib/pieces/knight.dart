import 'package:chess/pieces/piece.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:collection/collection.dart';

// ignore: must_be_immutable
class Knight extends StatelessWidget with Piece {
  @override
  final String color;
  late int i;
  late int j;

  Knight({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return color == "white"
        ? SvgPicture.asset('assets/pieces/wN.svg')
        : SvgPicture.asset('assets/pieces/bN.svg');
  }

  @override
  void setMovePossibilites(int i, int j, List<List<String>> layout) {
    movePossibilities = [
      [i + 2, j + 1],
      [i + 2, j - 1],
      [i - 2, j + 1],
      [i - 2, j - 1],
      [i + 1, j + 2],
      [i - 1, j + 2],
      [i + 1, j - 2],
      [i - 1, j - 2]
    ];

    // New legal possibilities
    movePossibilities = movePossibilities
        .where((possibility) =>
            isWithinBounds(possibility) && !isFriend(possibility, layout))
        .toList();
  }

  @override
  bool canMove(int i1, int j1, int i2, int j2, List<List<String>> layout,
      bool isWhitesTurn) {
    if ((color == "white" && !isWhitesTurn) ||
        (color == "black" && isWhitesTurn)) {
      return false;
    }

    setMovePossibilites(i1, j1, layout);

    //Verification
    if (!movePossibilities
        .any((element) => const ListEquality().equals(element, [i2, j2]))) {
      return false;
    }

    return true;
  }
}
