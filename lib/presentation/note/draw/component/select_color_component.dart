import 'package:flutter/material.dart';

class SelectColorComponent extends StatelessWidget{
  final Color selectedColor;
  final List<Color> colors;
  final ValueChanged<Color> onSelectColor;
  
  const SelectColorComponent({
    super.key,
    required this.selectedColor,
    required this.colors,
    required this.onSelectColor
});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: colors.map((color) {
        final isSelected = color == selectedColor;

        return GestureDetector(
          onTap: () => onSelectColor(color),
          child: AnimatedScale(
            scale: isSelected ? 1.2 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: Container(
              width: 36,
              height: 36,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Colors.transparent,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}