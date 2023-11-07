import 'package:chess/chessboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF070926),
          title: const Center(child: Text("Chess")),
        ),
        body: Stack(
          children: [
            Container(
              color: const Color.fromARGB(230, 7, 9, 38),
            ),
            const Chessboard(),
          ],
        ),
      ),
    );
  }
}
