import 'package:flutter/material.dart';

class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double sh = size.height; // for convenient shortage
    double sw = size.width; // for convenient shortage
    double cornerSide = sh * 0.5; // desirable value for corners side

    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Path path = Path()
      ..moveTo(cornerSide, -4)
      ..quadraticBezierTo(-12, -12, -4, cornerSide)
      ..moveTo(sw - cornerSide, sh + 4)
      ..quadraticBezierTo(sw + 12, sh + 12, sw + 4, sh - cornerSide);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BorderPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BorderPainter oldDelegate) => false;
}
