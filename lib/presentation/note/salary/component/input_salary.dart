import 'package:flutter/material.dart';
import 'package:wolvnote_flutter/common/digits_formatter.dart';

class InputSalary extends StatefulWidget{
  final ValueChanged<String> onClick;
  const InputSalary({super.key, required this.onClick});

  @override
  State<StatefulWidget> createState() => _InputSalaryState();
}

class _InputSalaryState extends State<InputSalary>{
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
        onChanged: (value){
          final formatted = DigitsFormatter.format(value);

          if (formatted != value) {
            controller.value = TextEditingValue(
              text: formatted,
              selection: TextSelection.collapsed(offset: formatted.length),
            );
          }
        },
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Input Salary',
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