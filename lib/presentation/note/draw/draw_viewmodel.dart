import 'dart:convert';
import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wolvnote_flutter/common/date_time_helper.dart';
import 'package:wolvnote_flutter/common/export_to_image_file_helper.dart';
import 'package:wolvnote_flutter/domain/model/draw_content_data.dart';
import 'package:wolvnote_flutter/domain/model/draw_data.dart';
import 'package:wolvnote_flutter/domain/model/note_entity.dart';
import 'package:wolvnote_flutter/domain/model/path_data.dart';
import 'package:wolvnote_flutter/presentation/note/draw/draw_state.dart';
import '../../../common/constants.dart';
import '../../../di/providers.dart';

class DrawViewModel extends Notifier<DrawState>{
  @override
  DrawState build() => DrawState();

  void resetState(){
    state = DrawState();
  }

  void defaultWeight(){
    state = state.copyWith(selectedWeight: 1.0);
  }

  void titleUpdate(String title){
    if(state.drawData == null){
      state = state.copyWith(drawData: DrawData());
    }

    state = state.copyWith(
      drawData: state.drawData?.copyWith(
        noteTitle: title
      )
    );
  }

  void onSelectColor(Color color){
    state = state.copyWith(selectedColor: color);
  }

  void onGetSize(Size size){
    if(state.drawData == null){
      state = state.copyWith(drawData: DrawData());
    }
    if(state.drawData?.contentData == null){
      state = state.copyWith(
        drawData: state.drawData?.copyWith(
          contentData: DrawContentData()
        )
      );
    }

    state = state.copyWith(
        drawData: state.drawData?.copyWith(
            contentData: state.drawData?.contentData?.copyWith(
              size: size
            )
        )
    );
  }

  void onSelectWeight(double weight){
    state = state.copyWith(selectedWeight: weight);
  }

  void onPathEnd(){
    final currentPathData = state.currentPath;
    if(currentPathData == null) return;

    final updatedList = [
      ...?state.drawData?.contentData?.pathDataList,
      currentPathData,
    ];

    state = state.copyWith(
      currentPath: null,
      drawData: state.drawData?.copyWith(
        contentData: state.drawData?.contentData?.copyWith(
          pathDataList: updatedList
        )
      )
    );
  }

  void onNewPathStart(){
    state = state.copyWith(
      currentPath: PathData(
        id: DateTimeHelper.getId(),
        color: state.selectedColor,
        path: [],
        weight: state.selectedWeight
      )
    );
  }

  void onDraw(Offset offset){
    final currentPathData = state.currentPath;
    if(currentPathData == null) return;

    final updatedPath = [...?currentPathData.path, offset];

    state = state.copyWith(
      currentPath: currentPathData.copyWith(
        path: updatedPath
      )
    );
  }

  void onClearCanvasClick(){
    state = state.copyWith(
      currentPath: null,
      drawData: state.drawData?.copyWith(
        contentData: state.drawData?.contentData?.copyWith(
          pathDataList: []
        )
      )
    );
  }

  void insertOrUpdate() {
    if (state.isEdit) {
      prepareUpdate();
    } else {
      prepareInsert();
    }
  }

  void prepareExport(){
    ExportToImageFileHelper.exportToImageFile(size: state.drawData!.contentData!.size!, title: state.drawData!.noteTitle!, paths: state.drawData!.contentData!.pathDataList!);
    insertOrUpdate();
  }

  void prepareInsert() async {
    NoteEntity noteEntity = NoteEntity(
      noteTitle: state.drawData?.noteTitle,
      noteContent: jsonEncode(state.drawData?.contentData),
      noteCategory: Constants.CATEGORY_DRAW,
      noteCreateDate: DateTimeHelper.formattedDateTime(),
    );
    await insertNote(noteEntity);
  }

  void prepareUpdate() async{
    NoteEntity noteEntity = NoteEntity(
      noteId: state.drawData?.noteId,
      noteTitle: state.drawData?.noteTitle,
      noteContent: jsonEncode(state.drawData?.contentData),
      noteCategory: Constants.CATEGORY_DRAW,
      noteLastEditDate: DateTimeHelper.formattedDateTime(),
      noteCreateDate: state.drawData?.createDate,
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
      final content = DrawContentData.fromJson(jsonDecode(notes.noteContent ?? ''));
      state = state.copyWith(drawData: DrawData());
      state = state.copyWith(
        isLoading: false,
        isEdit: true,
        drawData: state.drawData?.copyWith(
          noteTitle: notes.noteTitle,
          createDate: notes.noteCreateDate,
          noteId: notes.noteId,
          lastEditDate: notes.noteLastEditDate,
          contentData: content
        )
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}