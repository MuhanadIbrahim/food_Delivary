import 'package:flutter/material.dart';

class GradientIcon extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Gradient gradient;
  final VoidCallback? onTap;

  const GradientIcon({
    required this.icon,
    this.size = 20,
    required this.gradient,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Tooltip(
          message: 'Favorite Icon',
          child: Semantics(
            label: "Favorite Icon",
            child: ShaderMask(
              child: Icon(
                icon,
                size: size,
                color: Colors.white,
              ),
              shaderCallback: (Rect bounds) {
                final Rect rect = Rect.fromLTRB(0, 0, size!, size!);
                return gradient.createShader(rect);
              },
            ),
          ),
        ),
      ),
    );
  }
}
