import 'package:flutter/material.dart';
import 'package:wolvnote_flutter/domain/model/path_data.dart';

class RectanglePainter extends CustomPainter{
  final List<PathData> paths;
  final double scale;

  RectanglePainter({
    required this.paths,
    required this.scale,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..color = Colors.white,
    );

    for (final p in paths) {
      if (p.path == null || p.path!.isEmpty) continue;

      final paint = Paint()
        ..color = p.color ?? Colors.black
        ..strokeWidth = p.weight ?? 2
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;

      final path = Path();
      final scaled = p.path!
          .map((offset) => offset * scale)
          .toList();

      path.moveTo(scaled.first.dx, scaled.first.dy);
      for (int i = 1; i < scaled.length; i++) {
        path.lineTo(scaled[i].dx, scaled[i].dy);
      }

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}