import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wolvnote_flutter/common/constants.dart';
import 'package:wolvnote_flutter/domain/model/note_entity.dart';
import 'package:wolvnote_flutter/domain/model/pass_data.dart';
import 'package:wolvnote_flutter/presentation/note/home/component/checklist_component.dart';
import 'package:wolvnote_flutter/presentation/note/home/component/draw_component.dart';
import 'package:wolvnote_flutter/presentation/note/home/component/note_component.dart';
import 'package:wolvnote_flutter/presentation/ui/custom_widgets/custom_dialog.dart';

class NoteList extends StatelessWidget {
  final List<NoteEntity>? notes;
  final ValueChanged<int> onDelete;
  final ValueChanged<PassData> onOpen;
  final bool isLoading;
  final Function(String?) parseContentData;

  const NoteList({
    super.key,
    required this.notes,
    required this.onDelete,
    required this.onOpen,
    required this.isLoading,
    required this.parseContentData
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: MasonryGridView.count(
          itemCount: notes?.length,
          crossAxisCount: 2,
          itemBuilder: (context, index) {
            final note = notes?[index];
            return switch (note?.noteCategory) {
              Constants.CATEGORY_NOTE => InkWell(
                onTap: () {
                  if (note?.noteId != null) {
                    final passData = PassData(
                      note!.noteId!,
                      Constants.CATEGORY_NOTE,
                    );
                    onOpen(passData);
                  }
                },
                onLongPress: () {
                  if (note?.noteId != null) {
                    showDialog(
                      context: context,
                      builder: (_) => CustomDialog(
                        message: 'Delete this note?',
                        icon: Icons.delete,
                        onDismiss: () {
                          Navigator.pop(context);
                        },
                        onConfirm: () {
                          Navigator.pop(context);
                          onDelete(note!.noteId!);
                        },
                      ),
                    );
                  }
                },
                child: NoteComponent(
                  noteContent: note?.noteContent ?? "",
                  noteTitle: note?.noteTitle ?? "",
                ),
              ),
              Constants.CATEGORY_CHECKLIST => InkWell(
                onTap: () {
                  if (note?.noteId != null) {
                    final passData = PassData(
                      note!.noteId!,
                      Constants.CATEGORY_CHECKLIST,
                    );
                    onOpen(passData);
                  }
                },
                onLongPress: () {
                  if (note?.noteId != null) {
                    showDialog(
                      context: context,
                      builder: (_) => CustomDialog(
                        message: 'Delete this note?',
                        icon: Icons.delete,
                        onDismiss: () {
                          Navigator.pop(context);
                        },
                        onConfirm: () {
                          Navigator.pop(context);
                          onDelete(note!.noteId!);
                        },
                      ),
                    );
                  }
                },
                child: CheckListComponent(
                  noteContent: parseContentData(note?.noteContent),
                  noteTitle: note?.noteTitle ?? '',
                ),
              ),
              Constants.CATEGORY_DRAW => InkWell(
                onTap: () {
                  if (note?.noteId != null) {
                    final passData = PassData(
                      note!.noteId!,
                      Constants.CATEGORY_DRAW,
                    );
                    onOpen(passData);
                  }
                },
                onLongPress: () {
                  if (note?.noteId != null) {
                    showDialog(
                      context: context,
                      builder: (_) => CustomDialog(
                        message: 'Delete this note?',
                        icon: Icons.delete,
                        onDismiss: () {
                          Navigator.pop(context);
                        },
                        onConfirm: () {
                          Navigator.pop(context);
                          onDelete(note!.noteId!);
                        },
                      ),
                    );
                  }
                },
                child: DrawComponent(
                  noteTitle: note?.noteTitle ?? '',
                  noteContent: note?.noteContent ?? '',
                ),
              ),
              Constants.CATEGORY_SALARY => InkWell(
                onTap: () {
                  if (note?.noteId != null) {
                    final passData = PassData(
                      note!.noteId!,
                      Constants.CATEGORY_SALARY,
                    );
                    onOpen(passData);
                  }
                },
                onLongPress: () {
                  if (note?.noteId != null) {
                    showDialog(
                      context: context,
                      builder: (_) => CustomDialog(
                        message: 'Delete this note?',
                        icon: Icons.delete,
                        onDismiss: () {
                          Navigator.pop(context);
                        },
                        onConfirm: () {
                          Navigator.pop(context);
                          onDelete(note!.noteId!);
                        },
                      ),
                    );
                  }
                },
                child: NoteComponent(
                  noteContent: note?.noteContent ?? "",
                  noteTitle: note?.noteTitle ?? "",
                ),
              ),
              _ => const SizedBox.shrink(),
            };
          },
        ),
      ),
    );

    Widget loading = Expanded(
      child: Center(child: CircularProgressIndicator()),
    );

    Widget empty = Expanded(child: Center(child: Text('empty notes')));

    if (isLoading) {
      return loading;
    } else {
      if (notes != null && notes!.isNotEmpty) {
        return content;
      } else {
        return empty;
      }
    }
  }
}
