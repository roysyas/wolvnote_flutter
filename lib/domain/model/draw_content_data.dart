import 'dart:ui';
import 'package:wolvnote_flutter/domain/model/path_data.dart';

class DrawContentData{
  final List<PathData>? pathDataList;
  final Size? size;

  DrawContentData({
    this.pathDataList,
    this.size,
  });

  DrawContentData copyWith({
    List<PathData>? pathDataList,
    Size? size,
  }) {
    return DrawContentData(
      pathDataList: pathDataList ?? this.pathDataList,
      size: size ?? this.size
    );
  }

  factory DrawContentData.fromJson(Map<String, dynamic> json) {
    return DrawContentData(
      pathDataList: (json['pathDataList'] as List<dynamic>)
          .map((e) => PathData.fromJson(e))
          .toList(),
      size: json['size'] == null
          ? null
          : Size(
        (json['size']['width'] as num).toDouble(),
        (json['size']['height'] as num).toDouble(),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pathDataList': pathDataList?.map((e) => e.toJson()).toList(),
      'size': size == null
          ? null
          : {
        'width': size!.width,
        'height': size!.height,
      },
    };
  }
}