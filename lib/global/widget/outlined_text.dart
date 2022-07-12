import 'package:flutter/material.dart';

class StrokedText extends StatelessWidget {
  const StrokedText({
    Key? key,
    required this.text,
    required this.offset,
    required this.fontSize,
    required this.strokeColor,
    required this.textColor,
    this.strokeWidth = 1,
    this.textAlign = TextAlign.left,
  }) : super(key: key);
  final Offset offset;
  final String text;
  final double fontSize;
  final Color textColor;
  final double strokeWidth;
  final Color strokeColor;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Positioned(
          left: offset.dx,
          top: offset.dy,
          child: Text(
            text,
            textAlign: textAlign,
            style: TextStyle(
              fontSize: fontSize,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = strokeWidth
                ..color = strokeColor,
            ),
          ),
        ),
        // Solid text as fill.
        Text(
          text,
          textAlign: textAlign,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
