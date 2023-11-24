import 'package:chess/chessboard.dart';
import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(
    child: MainApp(),
  ));
=======
import 'package:provider/provider.dart';
import 'package:chess/Models/Inicio.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/menu',
      routes: {
        '/menu': (context) => Inicio(),
        '/main': (context) => MainApp(),
      },
    ),
  );
>>>>>>> Stashed changes
}

class MainApp extends StatelessWidget {

  final String? ritmo;
  final Abertura? abertura;

  const MainApp({Key? key, this.ritmo, this.abertura}) : super(key: key);

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
<<<<<<< Updated upstream
            const Chessboard(),
=======
            ChangeNotifierProvider(
              create: (context) => ChessboardModel(abertura!.movimentos),
              child: const Chessboard(),
            ),
>>>>>>> Stashed changes
          ],
        ),
      ),
    );
  }
}
