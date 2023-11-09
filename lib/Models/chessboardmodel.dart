import 'package:chess/pieces/piece.dart';
import 'package:flutter/material.dart';
import 'package:chess/pieces/bishop.dart';
import 'package:chess/pieces/king.dart';
import 'package:chess/pieces/knight.dart';
import 'package:chess/pieces/pawn.dart';
import 'package:chess/pieces/queen.dart';
import 'package:chess/pieces/rook.dart';

class ChessboardModel with ChangeNotifier {
  List<List<String>> layout = [
    ['bR', 'bN', 'bB', 'bK', 'bQ', 'bB', 'bN', 'bR'],
    ['bP', 'bP', 'bP', 'bP', 'bP', 'bP', 'bP', 'bP'],
    ['00', '00', '00', '00', '00', '00', '00', '00'],
    ['00', '00', '00', '00', '00', '00', '00', '00'],
    ['00', '00', '00', '00', '00', '00', '00', '00'],
    ['00', '00', '00', '00', '00', '00', '00', '00'],
    ['wP', 'wP', 'wP', 'wP', 'wP', 'wP', 'wP', 'wP'],
    ['wR', 'wN', 'wB', 'wK', 'wQ', 'wB', 'wN', 'wR'],
  ];

  final Map<String, Piece> pieces = {
    "bR": const Rook(color: "black"),
    "bN": const Knight(color: "black"),
    "bB": const Bishop(color: "black"),
    "bQ": const Queen(color: "black"),
    "bK": const King(color: "black"),
    "bP": Pawn(color: "black"),
    "wR": const Rook(color: "white"),
    "wN": const Knight(color: "white"),
    "wB": const Bishop(color: "white"),
    "wQ": const Queen(color: "white"),
    "wK": const King(color: "white"),
    "wP": Pawn(color: "white"),
  };

  bool isSecondTap = false;
  List<int> firstTapLocation = [];

  void firstTap(int x, int y) {
    if (layout[x][y] != "00") {
      isSecondTap = true;
      firstTapLocation = [x, y];
    }
    notifyListeners();
  }

  void movePiece(int fromX, int fromY, int toX, int toY) {
    String movedPiece = layout[fromX][fromY];

    Piece? piece = pieces[movedPiece];
    if (piece == null) {
      return;
    } else {
      if (piece.canMove(fromX, fromY, toX, toY)) {
        layout[fromX][fromY] = "00";
        layout[toX][toY] = movedPiece;
      }

      isSecondTap = false;
      notifyListeners();
    }
  }
}
