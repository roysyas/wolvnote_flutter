import 'package:flutter/material.dart';
import 'package:wolvnote_flutter/domain/model/checklist_item.dart';
import 'package:wolvnote_flutter/presentation/note/home/component/note_title_component.dart';

class CheckListComponent extends StatelessWidget {
  final List<CheckListItem> noteContent;
  final String noteTitle;

  const CheckListComponent({
    super.key,
    required this.noteContent,
    required this.noteTitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.secondary,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Column(
            children: List.generate(
              noteContent.length > 5 ? 5 : noteContent.length,
              (index) {
                final item = noteContent[index];
                return Row(
                  children: [
                    Checkbox(
                      value: item.checked,
                      onChanged: null,
                      activeColor: theme.colorScheme.primary,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      // <-- remove extra space
                      visualDensity:
                          VisualDensity.compact, // <-- make it tighter
                    ),
                    Text(
                      item.text ?? '',
                      style: TextStyle(color: theme.colorScheme.primary),
                    ),
                  ],
                );
              },
            ),
          ),
          if (noteContent.length > 5)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    '...',
                    style: TextStyle(color: theme.colorScheme.primary),
                  ),
                ),
              ],
            ),
          NoteTitleComponent(title: noteTitle),
        ],
      ),
    );
  }
}
