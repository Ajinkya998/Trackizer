import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tackizer/common/color_extension.dart';

class ArcModel {
  final Color color;
  final double value;

  ArcModel({required this.color, required this.value});
}

class CustomArc180Painter extends CustomPainter {
  double radians(double degrees) => degrees * (pi / 180);
  final double start;
  final double end;
  final double width;
  final double bgWidth;
  final double blurWidth;
  final double space;
  final List<ArcModel> drwArcs;

  CustomArc180Painter({
    this.start = 0,
    this.end = 180,
    this.width = 15,
    this.bgWidth = 10,
    this.blurWidth = 4,
    this.space = 4,
    required this.drwArcs,
  });
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height), radius: size.width / 2);

    Paint backgroundPaint = Paint();
    backgroundPaint.color = TColor.gray60.withOpacity(0.5);
    backgroundPaint.style = PaintingStyle.stroke;
    backgroundPaint.strokeWidth = bgWidth;
    backgroundPaint.strokeCap = StrokeCap.round;

    double startVal = start + 180.0;
    double drawVal = startVal;
    canvas.drawArc(
        rect, radians(startVal), radians(180), false, backgroundPaint);

    for (var arcObj in drwArcs) {
      Paint activePaint = Paint();
      activePaint.color = arcObj.color;
      activePaint.style = PaintingStyle.stroke;
      activePaint.strokeWidth = width;
      activePaint.strokeCap = StrokeCap.round;

      Paint shadowPaint = Paint()
        ..style = PaintingStyle.stroke
        ..color = arcObj.color.withOpacity(0.3)
        ..strokeWidth = width + blurWidth
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

      Path path = Path();
      path.addArc(rect, radians(drawVal), radians(arcObj.value - space));
      canvas.drawPath(path, shadowPaint);
      canvas.drawArc(rect, radians(drawVal), radians(arcObj.value - space),
          false, activePaint);

      drawVal = drawVal + arcObj.value + space;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CustomArc180Painter oldDelegate) => false;
}
