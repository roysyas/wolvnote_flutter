import 'dart:ui';

abstract class DrawEvent {
  const DrawEvent();
}

// ===== MENU EVENTS =====
class OnClearCanvasClick extends DrawEvent {
  const OnClearCanvasClick();
}

class InsertNote extends DrawEvent {
  const InsertNote();
}

class InsertAndExport extends DrawEvent {
  const InsertAndExport();
}

// ===== DRAWING EVENTS =====
class OnNewPathStart extends DrawEvent {
  final Offset position;
  const OnNewPathStart(this.position);
}

class OnDraw extends DrawEvent {
  final Offset position;
  const OnDraw(this.position);
}

class OnPathEnd extends DrawEvent {
  const OnPathEnd();
}

class OnGetSize extends DrawEvent {
  final Size size;
  const OnGetSize(this.size);
}