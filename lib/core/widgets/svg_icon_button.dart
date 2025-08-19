import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SVGIconButton extends StatelessWidget {
  const SVGIconButton({
    required this.iconPath,
    required this.color,
    this.padding = 4.0,
    this.size = 24,
    this.onPressed,
    super.key,
  });

  final double padding;
  final String iconPath;
  final Color color;
  final double size;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: SvgPicture.asset(
          iconPath,
          width: size,
          height: size,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        ),
      ),
    );
  }
}
