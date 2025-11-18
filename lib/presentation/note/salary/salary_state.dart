class SalaryState {
  final String? noteTitle;
  final String? notes;
  final bool isLoading;
  final bool isSuccess;
  final bool isEdit;
  final String? createDate;
  final int? noteId;
  final String? lastEditDate;
  final String? error;

  const SalaryState({
    this.noteTitle,
    this.notes,
    this.isLoading = false,
    this.isSuccess = false,
    this.isEdit = false,
    this.createDate,
    this.noteId,
    this.lastEditDate,
    this.error
  });

  SalaryState copyWith({
    String? noteTitle,
    String? notes,
    bool? isLoading,
    bool? isSuccess,
    bool? isEdit,
    String? createDate,
    int? noteId,
    String? lastEditDate,
    String? error
  }) {
    return SalaryState(
      noteTitle: noteTitle ?? this.noteTitle,
      notes: notes ?? this.notes,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isEdit: isEdit ?? this.isEdit,
      createDate: createDate ?? this.createDate,
      noteId: noteId ?? this.noteId,
      lastEditDate: lastEditDate ?? this.lastEditDate,
      error: error ?? this.error
    );
  }
}
