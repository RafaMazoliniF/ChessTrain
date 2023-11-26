import 'package:chess/pieces/piece.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:collection/collection.dart';

// ignore: must_be_immutable
class Pawn extends StatelessWidget with Piece {
  //Variáveis de classe
  @override
  final String color;
  bool isFirstMove = true;
  late int moveDirection; // 1 para brancas, -1 para pretas

  //Constrtutor do peão
  Pawn({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    color == "white" ? moveDirection = -1 : moveDirection = 1;

    return color == "white"
        ? SvgPicture.asset('assets/pieces/wP.svg')
        : SvgPicture.asset('assets/pieces/bP.svg');
  }

  @override
  void setMovePossibilites(int i, int j, List<List<String>> layout) {
    //Cria uma lista vazia que será preechida
    List<List<int>> movePossibilitiesAux = [];

    //Move to empity squares
    if (layout[i + moveDirection][j] == "00") {
      movePossibilitiesAux.add([i + moveDirection, j]);

      if (isFirstMove && layout[i + 2 * moveDirection][j] == "00") {
        movePossibilitiesAux.add([i + 2 * moveDirection, j]);
      }
    }

    //Capture enemies
    if (j + 1 <= 7 && isEnemy(i + moveDirection, j + 1, layout)) {
      movePossibilitiesAux.add([i + moveDirection, j + 1]);
    }

    if (j - 1 >= 0 && isEnemy(i + moveDirection, j - 1, layout)) {
      movePossibilitiesAux.add([i + moveDirection, j - 1]);
    }

    movePossibilities = movePossibilitiesAux;
  }

  //If the passed position is a enemy
  bool isEnemy(int i, int j, List<List<String>> layout) {
    if (color == "white" && layout[i][j][0] == "b") {
      return true;
    } else if (color == "black" && layout[i][j][0] == "w") {
      return true;
    }

    return false;
  }

  @override
  //Receves the "from" position, the "to" position and the current layout
  bool canMove(int i1, int j1, int i2, int j2, List<List<String>> layout,
      bool isWhitesTurn) {
    if ((color == "white" && !isWhitesTurn) ||
        (color == "black" && isWhitesTurn)) {
      return false;
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
