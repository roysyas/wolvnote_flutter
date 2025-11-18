import 'package:wolvnote_flutter/domain/model/draw_content_data.dart';

class DrawData {
  final DrawContentData? contentData;
  final String? noteTitle;
  final String? createDate;
  final int? noteId;
  final String? lastEditDate;

  DrawData({
    this.contentData,
    this.noteTitle,
    this.createDate,
    this.noteId,
    this.lastEditDate,
  });

  DrawData copyWith({
    DrawContentData? contentData,
    String? noteTitle,
    String? createDate,
    int? noteId,
    String? lastEditDate,
  }) {
    return DrawData(
      contentData: contentData ?? this.contentData,
      noteTitle: noteTitle ?? this.noteTitle,
      createDate: createDate ?? this.createDate,
      noteId: noteId ?? this.noteId,
      lastEditDate: lastEditDate ?? this.lastEditDate,
    );
  }

  factory DrawData.fromJson(Map<String, dynamic> json) {
    return DrawData(
      contentData: DrawContentData.fromJson(json['contentData']),
      noteTitle: json['noteTitle'] ?? "",
      createDate: json['createDate'] ?? "",
      noteId: json['noteId'],
      lastEditDate: json['lastEditDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'contentData': contentData?.toJson(),
      'noteTitle': noteTitle,
      'createDate': createDate,
      'noteId': noteId,
      'lastEditDate': lastEditDate,
    };
  }
}
