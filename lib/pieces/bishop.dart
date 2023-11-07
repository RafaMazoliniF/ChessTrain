import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Bishop extends StatelessWidget {
  final String color;

  const Bishop({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return color == "white"
        ? SvgPicture.asset('assets/pieces/wB.svg')
        : SvgPicture.asset('assets/pieces/bB.svg');
  }
}
