import 'package:flutter/material.dart';
import 'package:wolvnote_flutter/domain/model/checklist_item.dart';

class CheckListItemView extends StatefulWidget {
  final CheckListItem checkListItem;
  final VoidCallback onChecked;
  final VoidCallback onRemove;

  const CheckListItemView({
    super.key,
    required this.checkListItem,
    required this.onChecked,
    required this.onRemove,
  });

  @override
  State<StatefulWidget> createState() {
    return _CheckListItemView();
  }


}

class _CheckListItemView extends State<CheckListItemView>{
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 6),
      child: Card(
        color: theme.colorScheme.secondary,
        elevation: 6,
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                activeColor: theme.colorScheme.primary,
                value: widget.checkListItem.checked ?? false,
                onChanged: (bool? value){
                  setState(() {
                    widget.onChecked();
                  });
                },
              ),
              Text(
                widget.checkListItem.text ?? "",
                style: TextStyle(color: theme.colorScheme.primary),
              ),
              Spacer(flex: 1),
              IconButton(
                onPressed: widget.onRemove,
                icon: Icon(Icons.close, color: theme.colorScheme.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
