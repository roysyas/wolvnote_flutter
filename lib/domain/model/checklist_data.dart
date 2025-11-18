import 'package:wolvnote_flutter/domain/model/checklist_item.dart';

class CheckListData {
  final List<CheckListItem>? contentData;
  final String? noteTitle;
  final int? noteId;
  final String? createDate;
  final String? lastEditDate;

  CheckListData({
    this.contentData,
    this.noteTitle,
    this.noteId,
    this.createDate,
    this.lastEditDate,
  });

  CheckListData copyWith({
    List<CheckListItem>? contentData,
    String? noteTitle,
    int? noteId,
    String? createDate,
    String? lastEditDate,
  }) {
    return CheckListData(
      contentData: contentData ?? this.contentData,
      noteTitle: noteTitle ?? this.noteTitle,
      noteId: noteId ?? this.noteId,
      createDate: createDate ?? this.createDate,
      lastEditDate: lastEditDate ?? this.lastEditDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'contentData': contentData?.map((e) => e.toJson()).toList(),
      'noteTitle': noteTitle,
      'noteId': noteId,
      'createDate': createDate,
      'lastEditDate': lastEditDate,
    };
  }

  factory CheckListData.fromJson(Map<String, dynamic> json) {
    return CheckListData(
      contentData: (json['contentData'] as List?)
          ?.map((e) => CheckListItem.fromJson(e))
          .toList(),
      noteTitle: json['noteTitle'],
      noteId: json['noteId'],
      createDate: json['createDate'],
      lastEditDate: json['lastEditDate'],
    );
  }
}
