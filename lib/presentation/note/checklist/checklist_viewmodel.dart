import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wolvnote_flutter/domain/model/checklist_item.dart';
import 'package:wolvnote_flutter/domain/model/note_entity.dart';
import 'package:wolvnote_flutter/presentation/note/checklist/checklist_state.dart';

import '../../../common/constants.dart';
import '../../../common/date_time_helper.dart';
import '../../../di/providers.dart';
import '../../../domain/model/checklist_data.dart';

class CheckListViewModel extends Notifier<CheckListState>{
  @override
  CheckListState build() => const CheckListState();

  void resetState(){
    state = CheckListState();
  }

  void titleUpdate(String title) {
    if (state.checkListData == null) {
      state = state.copyWith(
        checkListData: CheckListData()
      );
    }

    state = state.copyWith(
      checkListData: state.checkListData?.copyWith(
        noteTitle: title,
      ),
    );
  }

  void checkItem(String itemId){
    final data = state.checkListData;
    if (data == null || data.contentData == null) return;

    final updatedList = data.contentData!.map((item) {
      if (item.id == itemId) {
        return item.copyWith(checked: !(item.checked ?? false));
      }
      debugPrint('onChecked success');
      return item;
    }).toList();

    state = state.copyWith(
      checkListData: data.copyWith(
        contentData: updatedList,
      ),
    );
  }

  void addItem(CheckListItem item){
    final data = state.checkListData;

    if (data == null) {
      state = state.copyWith(
        checkListData: CheckListData(
          contentData: [item],
        ),
      );
      return;
    }

    final updatedList = <CheckListItem>[
      ...(data.contentData ?? []),
      item,
    ];

    state = state.copyWith(
      checkListData: data.copyWith(
        contentData: updatedList,
      ),
    );
  }

  void removeItem(String itemId){
    final data = state.checkListData;

    if (data == null || data.contentData == null) return;

    final updatedList = data.contentData!
        .where((item) => item.id != itemId)
        .toList();

    state = state.copyWith(
      checkListData: data.copyWith(
        contentData: updatedList,
      ),
    );
  }

  void insertOrUpdate() {
    if (state.isEdit) {
      prepareUpdate();
    } else {
      prepareInsert();
    }
  }

  String convertContentToJson(List<CheckListItem>? data) {
    final jsonList = data
        ?.map((item) => item.toJson())
        .toList() ?? [];

    return jsonEncode(jsonList);
  }

  void prepareInsert() async {
    NoteEntity noteEntity = NoteEntity(
      noteTitle: state.checkListData?.noteTitle,
      noteContent: convertContentToJson(state.checkListData?.contentData),
      noteCategory: Constants.CATEGORY_CHECKLIST,
      noteCreateDate: DateTimeHelper.formattedDateTime(),
    );
    await insertNote(noteEntity);
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

  void prepareUpdate() async{
    NoteEntity noteEntity = NoteEntity(
      noteId: state.checkListData?.noteId,
      noteTitle: state.checkListData?.noteTitle,
      noteContent: convertContentToJson(state.checkListData?.contentData),
      noteCategory: Constants.CATEGORY_CHECKLIST,
      noteLastEditDate: DateTimeHelper.formattedDateTime(),
      noteCreateDate: state.checkListData?.createDate,
    );
    await updateNote(noteEntity);
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

  List<CheckListItem> parseContentData(String? jsonStr) {
    if (jsonStr == null || jsonStr.isEmpty) {
      return [];
    }

    try {
      final decoded = jsonDecode(jsonStr);

      if (decoded is List) {
        return decoded
            .map((e) => CheckListItem.fromJson(e as Map<String, dynamic>))
            .toList();
      }

      // If the JSON is not a list
      return [];
    } catch (_) {
      // If JSON parsing fails
      return [];
    }
  }

  Future<void> getNote(int id) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final get = ref.read(getNoteUseCaseProvider);
      final notes = await get(id);
      final CheckListData data = CheckListData(
        noteId: notes.noteId,
        noteTitle: notes.noteTitle,
        createDate: notes.noteCreateDate,
        lastEditDate: notes.noteLastEditDate,
        contentData: parseContentData(notes.noteContent)
      );
      state = state.copyWith(
          isLoading: false,
          checkListData: data,
          isEdit: true
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
  
}