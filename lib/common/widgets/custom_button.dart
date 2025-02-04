import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final VoidCallback pressed;
  final Color? bgColor;
  final TextStyle? style;
  final double? width;
  final Color borderColor;
  final double? height;
  final Gradient? gradient;
  final Shadow? shadow;

  const CustomButton(
      {super.key,
      this.text,
      required this.pressed,
      this.bgColor,
      this.style,
      this.height = 50.0,
      this.width = 150,
      this.child,
      this.gradient,
      this.borderColor = const Color(0xff98bafd),
      this.shadow});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: bgColor, // Default background color
          gradient: gradient, // Apply gradient if provided
          borderRadius: BorderRadius.circular(100),

          border: Border.all(
            color: borderColor,
          ),

        ),
        alignment: Alignment.center,
        child: child ??
            Text(
              text ?? 'Get',
              style: style ??
                  Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                      ),
            ),
      ),
    );
  }
}
