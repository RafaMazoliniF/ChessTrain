import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Knight extends StatelessWidget {
  final String color;

  const Knight({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return color == "white"
        ? SvgPicture.asset('assets/pieces/wN.svg')
        : SvgPicture.asset('assets/pieces/bN.svg');
  }
}
