import 'package:wolvnote_flutter/domain/model/checklist_data.dart';

class CheckListState {
  final CheckListData? checkListData;
  final bool isLoading;
  final bool isSuccess;
  final bool isEdit;
  final String? error;

  const CheckListState({
    this.checkListData,
    this.isLoading = false,
    this.isSuccess = false,
    this.isEdit = false,
    this.error
});

  CheckListState copyWith({
    CheckListData? checkListData,
    bool? isLoading,
    bool? isSuccess,
    bool? isEdit,
    String? error
}){
    return CheckListState(
      checkListData: checkListData ?? this.checkListData,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isEdit: isEdit ?? this.isEdit,
      error: error ?? this.error
    );
  }
}