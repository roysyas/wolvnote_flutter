import 'package:wolvnote_flutter/common/constants.dart';
import 'package:wolvnote_flutter/common/date_time_helper.dart';
import 'package:wolvnote_flutter/di/providers.dart';
import 'package:wolvnote_flutter/domain/model/note_entity.dart';
import 'package:wolvnote_flutter/presentation/note/notes/note_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoteViewModel extends Notifier<NoteState> {
  @override
  NoteState build() => const NoteState();

  void resetState(){
    state = NoteState();
  }

  void titleUpdate(String title) {
    state = state.copyWith(noteTitle: title);
  }

  void contentUpdate(String content) {
    state = state.copyWith(notes: content);
  }

  void insertOrUpdate() {
    if (state.isEdit) {
      prepareUpdate();
    } else {
      prepareInsert();
    }
  }

  void prepareInsert() async {
    NoteEntity noteEntity = NoteEntity(
      noteTitle: state.noteTitle,
      noteContent: state.notes,
      noteCategory: Constants.CATEGORY_NOTE,
      noteCreateDate: DateTimeHelper.formattedDateTime(),
    );
    await insertNote(noteEntity);
  }

  void prepareUpdate() async {
    NoteEntity noteEntity = NoteEntity(
      noteId: state.noteId,
      noteTitle: state.noteTitle,
      noteContent: state.notes,
      noteCategory: Constants.CATEGORY_NOTE,
      noteLastEditDate: DateTimeHelper.formattedDateTime(),
      noteCreateDate: state.createDate,
    );
    await updateNote(noteEntity);
  }

  Future<void> insertNote(NoteEntity noteEntity) async {
    state = state.copyWith(isLoading: true, error: null, isSuccess: false);
    try {
      final insert = ref.read(insertNoteUseCaseProvider);
      await insert(noteEntity);
      state = state.copyWith(isLoading: false, isSuccess: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> updateNote(NoteEntity noteEntity) async {
    state = state.copyWith(isLoading: true, error: null, isSuccess: false);
    try {
      final update = ref.read(updateNoteUseCaseProvider);
      await update(noteEntity);
      state = state.copyWith(isLoading: false, isSuccess: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> getNote(int id) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final get = ref.read(getNoteUseCaseProvider);
      final notes = await get(id);
      state = state.copyWith(
        isLoading: false,
        noteTitle: notes.noteTitle,
        noteId: notes.noteId,
        notes: notes.noteContent,
        createDate: notes.noteCreateDate,
        isEdit: true,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
