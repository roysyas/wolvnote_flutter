import 'package:flutter/material.dart';
import 'package:wolvnote_flutter/common/path_painter.dart';
import 'package:wolvnote_flutter/domain/model/path_data.dart';
import 'package:wolvnote_flutter/presentation/note/draw/component/draw_event.dart';

class DrawView extends StatelessWidget{
  final List<PathData> paths;
  final PathData? currentPath;
  final Function(DrawEvent) onAction;

  const DrawView({
    super.key,
    required this.paths,
    required this.currentPath,
    required this.onAction
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        // Notify Compose's onSizeChanged equivalent
        WidgetsBinding.instance.addPostFrameCallback((_) {
          onAction(OnGetSize(
            Size(size.maxWidth, size.maxHeight),
          ));
        });

        return Container(
          width: size.maxWidth,
          height: size.maxHeight,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 1,
            ),
          ),
          child: ClipRect(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onPanStart: (details) {
                onAction(OnNewPathStart(details.localPosition));
              },
              onPanUpdate: (details) {
                onAction(OnDraw(details.localPosition));
              },
              onPanEnd: (_) {
                onAction(OnPathEnd());
              },
              onPanCancel: () {
                onAction(OnPathEnd());
              },
              child: CustomPaint(
                painter: PathPainter(
                  paths: paths,
                  currentPath: currentPath,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}