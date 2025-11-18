import 'package:flutter/material.dart';
import 'package:wolvnote_flutter/presentation/note/home/component/note_title_component.dart';

class NoteComponent extends StatelessWidget {
  final String noteContent;
  final String noteTitle;

  const NoteComponent({
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              textAlign: TextAlign.start,
              noteContent,
              style: TextStyle(color: theme.colorScheme.primary),
              maxLines: 8,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          NoteTitleComponent(title: noteTitle),
        ],
      ),
    );
  }
}
