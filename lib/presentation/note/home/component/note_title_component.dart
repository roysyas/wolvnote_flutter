import 'package:flutter/material.dart';

class NoteTitleComponent extends StatelessWidget {
  final String title;

  const NoteTitleComponent({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.primary,
      width: double.infinity,
      padding: const EdgeInsets.all(6),
      child: Text(
        title,
        style: TextStyle(
          color: theme.colorScheme.secondary,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.end,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
