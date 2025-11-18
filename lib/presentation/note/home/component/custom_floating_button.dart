import 'package:flutter/material.dart';
import 'package:wolvnote_flutter/common/constants.dart';
import 'package:wolvnote_flutter/presentation/note/home/component/floating_item_button.dart';

class CustomFloatingButton extends StatelessWidget {
  final bool isToggle;
  final ValueChanged<int> onClick;
  final VoidCallback onToggle;

  const CustomFloatingButton({
    super.key,
    required this.isToggle,
    required this.onClick,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget floatingButton = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox.shrink(),
        FloatingActionButton(
          onPressed: onToggle,
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
          child: isToggle ?Icon(Icons.close) :Icon(Icons.add),
        ),
      ],
    );

    Widget expandedFloatingButton = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingItemButton(
          onClick: (){
            onClick(Constants.CATEGORY_NOTE);
          },
          label: 'Create notes',
          iconData: Icons.note,
        ),
        FloatingItemButton(
          onClick: (){
            onClick(Constants.CATEGORY_CHECKLIST);
          },
          label: 'Create checklist',
          iconData: Icons.checklist,
        ),
        FloatingItemButton(
          onClick: (){
            onClick(Constants.CATEGORY_SALARY);
          },
          label: 'Create salary',
          iconData: Icons.attach_money,
        ),
        FloatingItemButton(
          onClick: (){
            onClick(Constants.CATEGORY_DRAW);
          },
          label: 'Create draw',
          iconData: Icons.draw,
        ),
        floatingButton,
      ],
    );

    return isToggle ? expandedFloatingButton : floatingButton;
  }
}
