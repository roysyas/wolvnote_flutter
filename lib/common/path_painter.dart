import 'package:flutter/material.dart';
import 'package:wolvnote_flutter/domain/model/path_data.dart';

class PathPainter extends CustomPainter{
  final List<PathData> paths;
  final PathData? currentPath;

  PathPainter({
    required this.paths,
    required this.currentPath,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in paths) {
      if (p.path == null || p.path!.isEmpty) continue;

      final paint = Paint()
        ..color = p.color ?? Colors.black
        ..strokeWidth = p.weight ?? 2
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;

      final path = _convertOffsetsToPath(p.path!);
      canvas.drawPath(path, paint);
    }

    if (currentPath != null &&
        currentPath!.path != null &&
        currentPath!.path!.isNotEmpty) {
      final paint = Paint()
        ..color = currentPath!.color ?? Colors.black
        ..strokeWidth = currentPath!.weight ?? 2
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;

      final path = _convertOffsetsToPath(currentPath!.path!);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant PathPainter oldDelegate) {
    return oldDelegate.paths != paths ||
        oldDelegate.currentPath != currentPath;
  }

  Path _convertOffsetsToPath(List<Offset> points) {
    final path = Path();
    if (points.isEmpty) return path;

    path.moveTo(points.first.dx, points.first.dy);
    for (var i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
    return path;
  }
}