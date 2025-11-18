import 'package:flutter/material.dart';

class GreenLabel extends StatelessWidget {
  final String label;

  const GreenLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(8),
      color: theme.colorScheme.onSecondary,
      child: Text(
        label,
        style: TextStyle(
          color: theme.colorScheme.secondary,
        ),
      ),
    );
  }
}
