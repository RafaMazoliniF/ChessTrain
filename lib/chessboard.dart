import 'package:chess/pieces/bishop.dart';
import 'package:chess/pieces/king.dart';
import 'package:chess/pieces/knight.dart';
import 'package:chess/pieces/pawn.dart';
import 'package:chess/pieces/queen.dart';
import 'package:chess/pieces/rook.dart';
import 'package:flutter/material.dart';

class Chessboard extends StatelessWidget {
  const Chessboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> squares = [];
    final letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'];
    final layout = [
      ['bR', 'bN', 'bB', 'bK', 'bQ', 'bB', 'bN', 'bR'],
      ['bP', 'bP', 'bP', 'bP', 'bP', 'bP', 'bP', 'bP'],
      ['00', '00', '00', '00', '00', '00', '00', '00'],
      ['00', '00', '00', '00', '00', '00', '00', '00'],
      ['00', '00', '00', '00', '00', '00', '00', '00'],
      ['00', '00', '00', '00', '00', '00', '00', '00'],
      ['wP', 'wP', 'wP', 'wP', 'wP', 'wP', 'wP', 'wP'],
      ['wR', 'wN', 'wB', 'wK', 'wQ', 'wB', 'wN', 'wR'],
    ];

    final Map<String, Widget> pieces = {
      "bR": const Rook(color: "black"),
      "bN": const Knight(color: "black"),
      "bB": const Bishop(color: "black"),
      "bQ": const Queen(color: "black"),
      "bK": const King(color: "black"),
      "bP": const Pawn(color: "black"),
      "wR": const Rook(color: "white"),
      "wN": const Knight(color: "white"),
      "wB": const Bishop(color: "white"),
      "wQ": const Queen(color: "white"),
      "wK": const King(color: "white"),
      "wP": const Pawn(color: "white"),
    };

    //Alternate colors
    var isWhite = false;
    for (var i = 0; i < 8; i++) {
      for (var j = 0; j < 8; j++) {
        squares.add(Container(
          color:
              isWhite ? Colors.white : const Color.fromARGB(255, 131, 162, 180),
          child: Stack(
            children: [
              if (j == 0)
                Text(
                  (i + 1).toString(),
                  style: TextStyle(
                      fontSize: 10,
                      color: isWhite ? const Color(0xFF8DB55F) : Colors.white),
                ),
              if (i == 7)
                Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    letters[j],
                    style: TextStyle(
                      fontSize: 10,
                      color: isWhite ? const Color(0xFF8DB55F) : Colors.white,
                    ),
                  ),
                ),
              Center(child: pieces[layout[i][j]] ?? Container()),
            ],
          ),
        ));
        isWhite = !isWhite;
      }
      isWhite = !isWhite;
    }

    //Grid
    return GridView.count(
      crossAxisCount: 8,
      children: squares,
    );
  }
}
