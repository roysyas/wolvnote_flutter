import 'package:flutter/material.dart';
import 'package:wolvnote_flutter/common/date_time_helper.dart';
import 'package:wolvnote_flutter/domain/model/checklist_item.dart';

class AddItemView extends StatefulWidget {
  final ValueChanged<CheckListItem> onClick;
  final VoidCallback onInsert;
  final List<CheckListItem> list;

  const AddItemView({
    super.key,
    required this.onClick,
    required this.onInsert,
    required this.list,
  });

  @override
  State<StatefulWidget> createState() {
    return _AddItemViewState();
  }
}

class _AddItemViewState extends State<AddItemView> {
  late TextEditingController controller;
  bool showIcon = false;
  bool checked = false;

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

    return Padding(
      padding: EdgeInsets.all(6),
      child: Card(
        elevation: 6,
        color: theme.colorScheme.secondary,
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                activeColor: theme.colorScheme.primary,
                value: checked,
                onChanged: (bool? value) {
                  setState(() {
                    checked = value!;
                  });
                },
              ),
              Expanded(
                flex: 1,
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: 'Input checklist',
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
                              final data = CheckListItem(
                                checked: checked,
                                text: controller.text,
                                id: DateTimeHelper.getId(),
                              );
                              widget.onClick(data);
                              checked = false;
                              controller.text = "";
                            },
                            icon: Icon(Icons.send),
                          )
                        : SizedBox.shrink(),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              widget.list.isNotEmpty
                  ? IconButton(
                      onPressed: widget.onInsert,
                      icon: Icon(
                        Icons.save,
                        color: theme.colorScheme.primary,
                        size: 48.0,
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
