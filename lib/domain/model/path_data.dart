import 'dart:ui';

class PathData{
  final String? id;
  final Color? color;
  final double? weight;
  final List<Offset>? path;

  PathData({
    this.id,
    this.color,
    this.weight,
    this.path,
  });

  PathData copyWith({
    String? id,
    Color? color,
    double? weight,
    List<Offset>? path,
  }) {
    return PathData(
      id: id ?? this.id,
      color: color ?? this.color,
      weight: weight ?? this.weight,
      path: path ?? this.path
    );
  }

  factory PathData.fromJson(Map<String, dynamic> json) {
    return PathData(
      id: json['id'] as String,
      color: Color(json['color'] as int), // read int -> Color
      weight: (json['weight'] as num).toDouble(),
      path: (json['path'] as List<dynamic>)
          .map((p) => Offset((p['x'] as num).toDouble(), (p['y'] as num).toDouble()))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'color': color?.value, // write Color -> int
    'weight': weight,
    'path': path?.map((o) => {'x': o.dx, 'y': o.dy}).toList(),
  };
}