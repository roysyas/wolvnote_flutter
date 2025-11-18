import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wolvnote_flutter/common/constants.dart';
import 'package:wolvnote_flutter/common/date_time_helper.dart';
import 'package:wolvnote_flutter/common/salary_calculation.dart';
import 'package:wolvnote_flutter/di/providers.dart';
import 'package:wolvnote_flutter/domain/model/note_entity.dart';
import 'package:wolvnote_flutter/presentation/note/salary/salary_state.dart';

class SalaryViewModel extends Notifier<SalaryState> {
  @override
  SalaryState build() => const SalaryState();

  void resetState() {
    state = SalaryState();
  }

  void titleUpdate(String title) {
    state = state.copyWith(noteTitle: title);
  }

  void calculate(String amount) {
    state = state.copyWith(
      notes: SalaryCalculation.calculate(amount.replaceAll(".", "")),
    );
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
      noteCategory: Constants.CATEGORY_SALARY,
      noteCreateDate: DateTimeHelper.formattedDateTime(),
    );
    await insertNote(noteEntity);
  }

  void prepareUpdate() async {
    NoteEntity noteEntity = NoteEntity(
      noteId: state.noteId,
      noteTitle: state.noteTitle,
      noteContent: state.notes,
      noteCategory: Constants.CATEGORY_SALARY,
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
