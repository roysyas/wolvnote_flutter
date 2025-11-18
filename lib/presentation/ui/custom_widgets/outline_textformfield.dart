import 'package:flutter/material.dart';

class OutlineTextFormField extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final TextEditingController controller;

  const OutlineTextFormField({
    super.key,
    required this.label,
    required this.controller,
    required this.keyboardType
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 1.0),
        ),
      ),
    );
  }
}
