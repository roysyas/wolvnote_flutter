import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:wolvnote_flutter/common/rectangle_painter.dart';
import 'package:wolvnote_flutter/domain/model/draw_content_data.dart';
import 'package:wolvnote_flutter/presentation/note/home/component/note_title_component.dart';

class DrawComponent extends StatelessWidget{
  final String noteTitle;
  final String noteContent; // JSON

  const DrawComponent({
    super.key,
    required this.noteTitle,
    required this.noteContent,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final data = DrawContentData.fromJson(jsonDecode(noteContent));

    const thumbnailSize = Size(148, 237);
    final originalSize = data.size ?? const Size(1, 1);

    final scaleX = thumbnailSize.width / originalSize.width;
    final scaleY = thumbnailSize.height / originalSize.height;
    final scale = math.min(scaleX, scaleY);

    return Card(
      color: theme.colorScheme.secondary,
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: SizedBox(
              width: thumbnailSize.width,
              height: thumbnailSize.height,
              child: CustomPaint(
                painter: RectanglePainter(
                  paths: data.pathDataList ?? [],
                  scale: scale,
                ),
              ),
            ),
          ),
          NoteTitleComponent(title: noteTitle),
        ],
      ),
    );
  }
}