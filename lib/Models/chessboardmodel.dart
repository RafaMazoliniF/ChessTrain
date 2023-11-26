import 'package:chess/pieces/piece.dart';
import 'package:flutter/material.dart';
import 'package:chess/pieces/bishop.dart';
import 'package:chess/pieces/king.dart';
import 'package:chess/pieces/knight.dart';
import 'package:chess/pieces/pawn.dart';
import 'package:chess/pieces/queen.dart';
import 'package:chess/pieces/rook.dart';

// The model of the chessboard.
class ChessboardModel with ChangeNotifier {
  bool isGameOver = false;

  //The game configuration. It is uptated at each move.
  List<List<String>> layout = [
    ['bR1', 'bN1', 'bB1', 'bQ', 'bK', 'bB2', 'bN2', 'bR2'],
    ['bP1', 'bP2', 'bP3', 'bP4', 'bP5', 'bP6', 'bP7', 'bP8'],
    ['00', '00', '00', '00', '00', '00', '00', '00'],
    ['00', '00', '00', '00', '00', '00', '00', '00'],
    ['00', '00', '00', '00', '00', '00', '00', '00'],
    ['00', '00', '00', '00', '00', '00', '00', '00'],
    ['wP1', 'wP2', 'wP3', 'wP4', 'wP5', 'wP6', 'wP7', 'wP8'],
    ['wR1', 'wN1', 'wB1', 'wQ', 'wK', 'wB2', 'wN2', 'wR2'],
  ];

  //The layout -> pieces translator.
  Map<String, Piece> pieces = {
    "bR1": Rook(color: "black"),
    "bN1": Knight(color: "black"),
    "bB1": Bishop(color: "black"),
    "bR2": Rook(color: "black"),
    "bN2": Knight(color: "black"),
    "bB2": Bishop(color: "black"),
    "bQ": Queen(color: "black"),
    "bK": King(color: "black"),
    "bP1": Pawn(color: "black"),
    "bP2": Pawn(color: "black"),
    "bP3": Pawn(color: "black"),
    "bP4": Pawn(color: "black"),
    "bP5": Pawn(color: "black"),
    "bP6": Pawn(color: "black"),
    "bP7": Pawn(color: "black"),
    "bP8": Pawn(color: "black"),
    "wR1": Rook(color: "white"),
    "wN1": Knight(color: "white"),
    "wB1": Bishop(color: "white"),
    "wR2": Rook(color: "white"),
    "wN2": Knight(color: "white"),
    "wB2": Bishop(color: "white"),
    "wQ": Queen(color: "white"),
    "wK": King(color: "white"),
    "wP1": Pawn(color: "white"),
    "wP2": Pawn(color: "white"),
    "wP3": Pawn(color: "white"),
    "wP4": Pawn(color: "white"),
    "wP5": Pawn(color: "white"),
    "wP6": Pawn(color: "white"),
    "wP7": Pawn(color: "white"),
    "wP8": Pawn(color: "white"),
  };

  //Move handler
  bool isWhitesTurn = true;
  bool isSecondTap = false;
  List<int> firstTapLocation = [];
  List<List<int>> possibleMoves = [];

  //Save the first tap location. Then, isSecondTap
  void firstTap(int i, int j) {
    if (layout[i][j] != "00") {
      isSecondTap = true;
      firstTapLocation = [i, j];
      handleMovePossibilites(i, j);
    }
    notifyListeners();
  }

  void handleMovePossibilites(int i, int j) {
    pieces[layout[i][j]]!.setMovePossibilites(i, j, layout);
    possibleMoves = pieces[layout[i][j]]!.movePossibilities;
  }

  //Receve the "from" and "to" location. Then, move the piece if canMove()
  void movePiece(int i1, int j1, int i2, int j2) async {
    String movedPiece = layout[i1][j1];

    Piece? piece = pieces[movedPiece];
    if (piece == null) {
      return;
    } else {
      if (piece.canMove(i1, j1, i2, j2, layout, isWhitesTurn)) {
        if (layout[i2][j2] == "bK") {
          endGame("white");
        }
        if (layout[i2][j2] == "wK") {
          endGame("black");
        }

        layout[i1][j1] = "00";
        layout[i2][j2] = movedPiece;
        isWhitesTurn = !isWhitesTurn;
      }

      isSecondTap = false;
      possibleMoves = [];

      notifyListeners();
    }
  }

  void endGame(String color) {
    isGameOver = true;
    notifyListeners();
  }

  void resetBoard() {
    isGameOver = false;
    isWhitesTurn = true;
    isSecondTap = false;
    firstTapLocation = [];
    possibleMoves = [];

    pieces = {
      "bR1": Rook(color: "black"),
      "bN1": Knight(color: "black"),
      "bB1": Bishop(color: "black"),
      "bR2": Rook(color: "black"),
      "bN2": Knight(color: "black"),
      "bB2": Bishop(color: "black"),
      "bQ": Queen(color: "black"),
      "bK": King(color: "black"),
      "bP1": Pawn(color: "black"),
      "bP2": Pawn(color: "black"),
      "bP3": Pawn(color: "black"),
      "bP4": Pawn(color: "black"),
      "bP5": Pawn(color: "black"),
      "bP6": Pawn(color: "black"),
      "bP7": Pawn(color: "black"),
      "bP8": Pawn(color: "black"),
      "wR1": Rook(color: "white"),
      "wN1": Knight(color: "white"),
      "wB1": Bishop(color: "white"),
      "wR2": Rook(color: "white"),
      "wN2": Knight(color: "white"),
      "wB2": Bishop(color: "white"),
      "wQ": Queen(color: "white"),
      "wK": King(color: "white"),
      "wP1": Pawn(color: "white"),
      "wP2": Pawn(color: "white"),
      "wP3": Pawn(color: "white"),
      "wP4": Pawn(color: "white"),
      "wP5": Pawn(color: "white"),
      "wP6": Pawn(color: "white"),
      "wP7": Pawn(color: "white"),
      "wP8": Pawn(color: "white"),
    };

    layout = [
      ['bR1', 'bN1', 'bB1', 'bQ', 'bK', 'bB2', 'bN2', 'bR2'],
      ['bP1', 'bP2', 'bP3', 'bP4', 'bP5', 'bP6', 'bP7', 'bP8'],
      ['00', '00', '00', '00', '00', '00', '00', '00'],
      ['00', '00', '00', '00', '00', '00', '00', '00'],
      ['00', '00', '00', '00', '00', '00', '00', '00'],
      ['00', '00', '00', '00', '00', '00', '00', '00'],
      ['wP1', 'wP2', 'wP3', 'wP4', 'wP5', 'wP6', 'wP7', 'wP8'],
      ['wR1', 'wN1', 'wB1', 'wQ', 'wK', 'wB2', 'wN2', 'wR2'],
    ];

    notifyListeners();
  }
}
