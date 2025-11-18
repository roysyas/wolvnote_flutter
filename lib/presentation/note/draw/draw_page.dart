import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wolvnote_flutter/common/constants.dart';
import 'package:wolvnote_flutter/di/providers.dart';
import 'package:wolvnote_flutter/presentation/note/draw/component/draw_event.dart';
import 'package:wolvnote_flutter/presentation/note/draw/component/draw_menu.dart';
import 'package:wolvnote_flutter/presentation/note/draw/component/draw_view.dart';
import 'package:wolvnote_flutter/presentation/ui/custom_widgets/input_title.dart';

class DrawPage extends ConsumerStatefulWidget{
  final int? noteId;
  const DrawPage({super.key, this.noteId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DrawPageState();
}

class _DrawPageState extends ConsumerState<DrawPage>{
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      if (widget.noteId != null) {
        final vm = ref.read(drawViewModelProvider.notifier);
        await vm.getNote(widget.noteId!);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(drawViewModelProvider);
    final vm = ref.read(drawViewModelProvider.notifier);
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
            state.drawData?.noteTitle ?? "",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: theme.colorScheme.primary,
            ),
          ),
        ),
        state.drawData?.createDate != null
            ? Align(
          alignment: Alignment.centerRight,
          child: Text(
            state.drawData?.createDate ?? "",
            style: TextStyle(
              fontSize: 12,
              color: theme.colorScheme.outlineVariant,
            ),
          ),
        )
            : SizedBox.shrink(),
        state.drawData?.lastEditDate != null
            ? Align(
          alignment: Alignment.centerRight,
          child: Text(
            state.drawData?.lastEditDate ?? "",
            style: TextStyle(
              fontSize: 12,
              color: theme.colorScheme.outlineVariant,
            ),
          ),
        )
            : SizedBox.shrink(),
        SizedBox(height: 8),
        Expanded(
            child: DrawView(
                paths: state.drawData?.contentData?.pathDataList ?? [],
                currentPath: state.currentPath,
                onAction: (event){
                  if(event is OnNewPathStart){
                    vm.onNewPathStart();
                  }else if(event is OnDraw){
                    vm.onDraw(event.position);
                  }else if(event is OnPathEnd){
                    vm.onPathEnd();
                  }else if(event is OnGetSize){
                    vm.onGetSize(event.size);
                  }
                }
            )
        ),
        SizedBox(height: 8),
        DrawMenu(
            paths: state.drawData?.contentData?.pathDataList ?? [],
            selectedColor: state.selectedColor,
            colors: Constants.allColors,
            selectedWeight: state.selectedWeight,
            weights: Constants.allWeight,
            onClick: (event) {
              if(event is OnClearCanvasClick){
                vm.onClearCanvasClick();
              }else if(event is InsertNote){
                vm.insertOrUpdate();
              }else if(event is InsertAndExport){
                vm.prepareExport();
              }
            },
            onSelectColor: (color){
              vm.onSelectColor(color);
            },
            onSelectWeight: (weight){
              vm.onSelectWeight(weight);
            }
        )
      ],
    );

    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(16),
            child: state.drawData?.noteTitle == null ? inputTitle : content,
          )
      ),
    );
  }

}