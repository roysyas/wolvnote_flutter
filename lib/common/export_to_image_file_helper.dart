import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wolvnote_flutter/domain/model/path_data.dart';

class ExportToImageFileHelper{
  static Future<String> exportToImageFile({
    required Size size,
    required String title,
    required List<PathData> paths,
  }) async {

    final titleReplace = title.replaceAll(" ", "");
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final fileName = "${titleReplace}_$timestamp.jpg";

    final directory = await getApplicationDocumentsDirectory();
    final file = File("${directory.path}/$fileName");

    final image = await _saveBitmap(size, paths);
    final pngBytes = await image.toByteData(format: ui.ImageByteFormat.png);

    await file.writeAsBytes(pngBytes!.buffer.asUint8List());

    return file.path;
  }

  static Future<ui.Image> _saveBitmap(Size size, List<PathData> paths) async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // White background
    canvas.drawRect(Offset.zero & size, paint);

    // Draw all paths
    for (final pathData in paths) {
      _drawPath(
        canvas: canvas,
        path: pathData.path ?? [],
        color: pathData.color ?? Colors.black,
        thickness: pathData.weight ?? 0.0,
      );
    }

    final picture = recorder.endRecording();
    return picture.toImage(size.width.toInt(), size.height.toInt());
  }

  static void _drawPath({
    required Canvas canvas,
    required List<Offset> path,
    required Color color,
    required double thickness,
  }) {
    if (path.isEmpty) return;

    final uiPath = Path();
    uiPath.moveTo(path.first.dx, path.first.dy);

    const smoothness = 5;

    for (int i = 1; i < path.length; i++) {
      final from = path[i - 1];
      final to = path[i];
      final dx = (from.dx - to.dx).abs();
      final dy = (from.dy - to.dy).abs();

      if (dx >= smoothness || dy >= smoothness) {
        uiPath.quadraticBezierTo(
          (from.dx + to.dx) / 2,
          (from.dy + to.dy) / 2,
          to.dx,
          to.dy,
        );
      }
    }

    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(uiPath, paint);
  }
}