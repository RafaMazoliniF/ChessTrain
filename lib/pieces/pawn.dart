import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Pawn extends StatelessWidget {
  final String color;

  const Pawn({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return color == "white"
        ? SvgPicture.asset('assets/pieces/wP.svg')
        : SvgPicture.asset('assets/pieces/bP.svg');
  }
}
