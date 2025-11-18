class NoteEntity {
  final int? noteId;
  final String? noteCreateDate;
  final String? noteTitle;
  final String? noteContent;
  final int? noteCategory;
  final String? noteLastEditDate;

  NoteEntity({
    this.noteId,
    this.noteCreateDate,
    this.noteTitle,
    this.noteContent,
    this.noteCategory,
    this.noteLastEditDate,
  });
}
