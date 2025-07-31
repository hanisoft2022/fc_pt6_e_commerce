import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SVGIconButton extends StatelessWidget {
  final String iconPath;
  final Color color;
  final double padding;

  const SVGIconButton({super.key, required this.iconPath, required this.color, this.padding = 4.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: SvgPicture.asset(iconPath, colorFilter: ColorFilter.mode(color, BlendMode.srcIn)),
    );
  }
}
