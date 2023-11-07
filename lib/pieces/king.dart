import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class King extends StatelessWidget {
  final String color;

  const King({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return color == "white"
        ? SvgPicture.asset('assets/pieces/wK.svg')
        : SvgPicture.asset('assets/pieces/bK.svg');
  }
}
