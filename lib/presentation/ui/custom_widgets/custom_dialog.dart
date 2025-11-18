import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget{
  final String message;
  final IconData icon;
  final VoidCallback onDismiss;
  final VoidCallback onConfirm;

  const CustomDialog({
    super.key,
    required this.message,
    required this.icon,
    required this.onDismiss,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(24),
      child: Card(
        elevation: 6,
        color: Theme.of(context).colorScheme.secondary,
        shadowColor: Colors.black54,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 48,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 16),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: onDismiss,
                    child: const Text("Dismiss"),
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: onConfirm,
                    child: const Text("Confirm"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}