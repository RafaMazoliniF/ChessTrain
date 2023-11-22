import 'package:chess/Models/chessboardmodel.dart';
import 'package:chess/chessboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF070926),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.train,
                size: 35,
                color: Colors.white,
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Container(
              color: const Color.fromARGB(230, 7, 9, 38),
            ),
            ChangeNotifierProvider(
              create: (context) => ChessboardModel(),
              child: const Chessboard(),
            ),
          ],
        ),
      ),
    );
  }
}
