import 'package:flutter/material.dart';

class FloatingItemButton extends StatelessWidget {
  final VoidCallback onClick;
  final String label;
  final IconData iconData;

  const FloatingItemButton({
    super.key,
    required this.onClick,
    required this.label,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onClick,
      child: Card(
        semanticContainer: false,
        elevation: 6,
        color: theme.colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: BorderSide(color: theme.colorScheme.primary, width: 1),
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(label),
              SizedBox(width: 8,),
              Icon(iconData, color: theme.colorScheme.primary),
            ],
          ),
        ),
      ),
    );
  }
}
