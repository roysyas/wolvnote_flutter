import 'package:flutter/material.dart';

class InputTitle extends StatefulWidget {
  final ValueChanged<String> onClick;

  const InputTitle({super.key, required this.onClick});

  @override
  State<StatefulWidget> createState() {
    return _InputTitleState();
  }
}

class _InputTitleState extends State<InputTitle> {
  late TextEditingController controller;
  bool showIcon = false;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      setState(() {
        showIcon = controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 6,
      color: theme.colorScheme.onPrimary,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Input Title',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: theme.colorScheme.primary,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: theme.colorScheme.primary,
              width: 1.0,
            ),
          ),
          suffixIcon: showIcon
              ? IconButton(
                  onPressed: () {
                    widget.onClick(controller.text);
                  },
                  icon: Icon(Icons.send),
                )
              : SizedBox.shrink(),
        ),
      ),
    );
  }
}
