import 'package:flutter/material.dart';
import 'package:chess/main.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  String? ritmoSelecionado;
  Abertura? aberturaSelecionada;

  @override
  Widget build(BuildContext context) {
    final ritmos = ['Bullet', 'Blitz', 'Rápido', 'Clássico'];
    final aberturas = [sicilian, french, carokann];

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Escolha o ritmo da partida e a abertura',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20), // Espaço entre o título e a lista suspensa
              Align(
                alignment: Alignment.centerLeft,
                child: DropdownButton<String>(
                  hint: Text('Escolha o ritmo da partida'),
                  value: ritmoSelecionado,
                  onChanged: (String? newValue) {
                    setState(() {
                      ritmoSelecionado = newValue;
                    });
                  },
                  items: ritmos.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20), // Espaço entre as listas suspensas
              Align(
                alignment: Alignment.centerLeft,
                child: DropdownButton<Abertura>(
                  hint: Text('Escolha a abertura'),
                  value: aberturaSelecionada,
                  onChanged: (Abertura? newValue) {
                    setState(() {
                      aberturaSelecionada = newValue;
                    });
                  },
                  items: aberturas.map<DropdownMenuItem<Abertura>>((Abertura value) {
                    return DropdownMenuItem<Abertura>(
                      value: value,
                      child: Text(value.nome),
                    );
                  }).toList(),
                ),
              ),
              ElevatedButton(
                child: Text('Iniciar'),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainApp(ritmo: ritmoSelecionado, abertura: aberturaSelecionada),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Abertura {
  final String nome;
  final List<List<String>> movimentos;

  Abertura(this.nome, this.movimentos);
}


var sicilian = Abertura('Defesa Siciliana', openingsicilian);
var carokann = Abertura('Defesa Caro-Kann', openingcarokann);
var french = Abertura('Defesa Francesa', openingfrench);
List<List<String>> openingsicilian = [
    ['bR1', 'bN1', 'bB1', 'bQ', 'bK', 'bB2', 'bN2', 'bR2'],
    ['bP1', 'bP2', '00', 'bP4', 'bP5', 'bP6', 'bP7', 'bP8'],
    ['00', '00', '00', '00', '00', '00', '00', '00'],
    ['00', '00', 'bP3', '00', '00', '00', '00', '00'],
    ['00', '00', '00', '00', 'wP5', '00', '00', '00'],
    ['00', '00', '00', '00', '00', '00', '00', '00'],
    ['wP1', 'wP2', 'wP3', 'wP4', '00', 'wP6', 'wP7', 'wP8'],
    ['wR1', 'wN1', 'wB1', 'wQ', 'wK', 'wB2', 'wN2', 'wR2'],
  ];
  List<List<String>> openingcarokann = [
    ['bR1', 'bN1', 'bB1', 'bQ', 'bK', 'bB2', 'bN2', 'bR2'],
    ['bP1', 'bP2', '00', 'bP4', 'bP5', 'bP6', 'bP7', 'bP8'],
    ['00', '00', 'bP3', '00', '00', '00', '00', '00'],
    ['00', '00', '00', '00', '00', '00', '00', '00'],
    ['00', '00', '00', '00', 'wP5', '00', '00', '00'],
    ['00', '00', '00', '00', '00', '00', '00', '00'],
    ['wP1', 'wP2', 'wP3', 'wP4', '00', 'wP6', 'wP7', 'wP8'],
    ['wR1', 'wN1', 'wB1', 'wQ', 'wK', 'wB2', 'wN2', 'wR2'],
  ];
    List<List<String>> openingfrench = [
    ['bR1', 'bN1', 'bB1', 'bQ', 'bK', 'bB2', 'bN2', 'bR2'],
    ['bP1', 'bP2', 'bP3', 'bP4', '00', 'bP6', 'bP7', 'bP8'],
    ['00', '00', '00', '00', 'bP5', '00', '00', '00'],
    ['00', '00', '00', '00', '00', '00', '00', '00'],
    ['00', '00', '00', '00', 'wP5', '00', '00', '00'],
    ['00', '00', '00', '00', '00', '00', '00', '00'],
    ['wP1', 'wP2', 'wP3', 'wP4', '00', 'wP6', 'wP7', 'wP8'],
    ['wR1', 'wN1', 'wB1', 'wQ', 'wK', 'wB2', 'wN2', 'wR2'],
  ];

