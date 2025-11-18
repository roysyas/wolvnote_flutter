import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wolvnote_flutter/di/providers.dart';
import 'package:wolvnote_flutter/domain/model/checklist_item.dart';
import 'package:wolvnote_flutter/presentation/note/checklist/component/add_item_view.dart';
import 'package:wolvnote_flutter/presentation/note/checklist/component/checklist_item_view.dart';
import '../../ui/custom_widgets/input_title.dart';

class CheckListPage extends ConsumerStatefulWidget {
  final int? noteId;

  const CheckListPage({super.key, this.noteId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckListPageState();
}

class _CheckListPageState extends ConsumerState<CheckListPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      if (widget.noteId != null) {
        final vm = ref.read(checklistViewModelProvider.notifier);
        await vm.getNote(widget.noteId!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(checklistViewModelProvider);
    final vm = ref.read(checklistViewModelProvider.notifier);
    final theme = Theme.of(context);

    if (state.isSuccess) {
      Future.microtask((){
        vm.resetState();
        Navigator.pop(context);
      });
    }

    Widget inputTitle = Align(
      alignment: Alignment.bottomCenter,
      child: InputTitle(
        onClick: (value) {
          vm.titleUpdate(value);
        },
      ),
    );

    Widget content = Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            state.checkListData?.noteTitle ?? "",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: theme.colorScheme.primary,
            ),
          ),
        ),
        state.checkListData?.createDate != null
            ? Align(
                alignment: Alignment.centerRight,
                child: Text(
                  state.checkListData?.createDate ?? "",
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.colorScheme.outlineVariant,
                  ),
                ),
              )
            : SizedBox.shrink(),
        state.checkListData?.lastEditDate != null
            ? Align(
                alignment: Alignment.centerRight,
                child: Text(
                  state.checkListData?.lastEditDate ?? "",
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.colorScheme.outlineVariant,
                  ),
                ),
              )
            : SizedBox.shrink(),
        SizedBox(height: 8),
        Expanded(
          flex: 1,
          child: ListView.builder(
            itemCount: state.checkListData?.contentData?.length,
            itemBuilder: (context, index) {
              final data = state.checkListData;
              if(data != null){
                final list = data.contentData;
                if(list != null){
                  final item = list[index];
                  return CheckListItemView(
                    checkListItem: item,
                    onChecked: () {
                      if(item.id != null){
                        vm.checkItem(item.id!);
                      }
                    },
                    onRemove: () {
                      if (item.id != null) {
                        vm.removeItem(item.id!);
                      }
                    },
                  );
                }
              }
              return null;
            },
          ),
        ),
        SizedBox(height: 8),
        AddItemView(
          list: state.checkListData?.contentData ?? [],
          onClick: (CheckListItem value) {
            vm.addItem(value);
          },
          onInsert: () {
            vm.insertOrUpdate();
          },
        ),
      ],
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: state.checkListData?.noteTitle == null ? inputTitle : content,
        ),
      ),
    );
  }
}
