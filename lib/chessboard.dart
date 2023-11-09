import 'package:chess/Models/chessboardmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Chessboard extends StatelessWidget {
  const Chessboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final board = Provider.of<ChessboardModel>(context, listen: true);

    final letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'];
    List<Widget> squares = [];

    //Alternate colors
    var isWhite = false;
    for (var i = 0; i < 8; i++) {
      for (var j = 0; j < 8; j++) {
        //Gesture detection
        squares.add(GestureDetector(
          onTap: () => board.isSecondTap
              ? board.movePiece(
                  board.firstTapLocation[0], board.firstTapLocation[1], i, j)
              : board.firstTap(i, j),
          //Create the square
          child: Container(
            color: isWhite
                ? Colors.white
                : const Color.fromARGB(255, 131, 162, 180),
            child: Stack(
              children: [
                //Square index
                if (j == 0)
                  Text(
                    (i + 1).toString(),
                    style: TextStyle(
                        fontSize: 10,
                        color: isWhite
                            ? const Color.fromARGB(255, 131, 162, 180)
                            : Colors.white),
                  ),
                if (i == 7)
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      letters[j],
                      style: TextStyle(
                        fontSize: 10,
                        color: isWhite
                            ? const Color.fromARGB(255, 131, 162, 180)
                            : Colors.white,
                      ),
                    ),
                  ),
                //Piece
                Center(
                  child: board.pieces[board.layout[i][j]],
                ),
              ],
            ),
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
