import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Queen extends StatelessWidget {
  final String color;

  const Queen({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return color == "white"
        ? SvgPicture.asset('assets/pieces/wQ.svg')
        : SvgPicture.asset('assets/pieces/bQ.svg');
  }
}
