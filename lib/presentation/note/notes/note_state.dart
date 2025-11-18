class NoteState {
  final bool isLoading;
  final bool isSuccess;
  final String? error;
  final String? noteTitle;
  final String? notes;
  final int? noteId;
  final bool isEdit;
  final String? createDate;
  final String? lastEditDate;

  const NoteState({
    this.isLoading = false,
    this.isSuccess = false,
    this.error,
    this.noteTitle,
    this.notes,
    this.noteId,
    this.isEdit = false,
    this.createDate,
    this.lastEditDate,
  });

  NoteState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? error,
    String? noteTitle,
    String? notes,
    int? noteId,
    bool? isEdit,
    String? createDate,
    String? lastEditDate,
  }) {
    return NoteState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? this.error,
      noteTitle: noteTitle ?? this.noteTitle,
      notes: notes ?? this.notes,
      noteId: noteId ?? this.noteId,
      isEdit: isEdit ?? this.isEdit,
      createDate: createDate ?? this.createDate,
      lastEditDate: lastEditDate ?? this.lastEditDate,
    );
  }
}
