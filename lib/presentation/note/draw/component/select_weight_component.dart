import 'package:flutter/material.dart';
import 'package:wolvnote_flutter/common/line_painter.dart';

class SelectWeightComponent extends StatelessWidget{
  final double selectedWeight;
  final List<double> weights;
  final ValueChanged<double> onSelectWeight;

  const SelectWeightComponent({
    super.key,
    required this.selectedWeight,
    required this.weights,
    required this.onSelectWeight,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: weights.map((weight) {
        final isSelected = weight == selectedWeight;

        return GestureDetector(
          onTap: () => onSelectWeight(weight),
          child: Container(
            width: 36,
            height: 36,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.transparent,
              ),
            ),
            child: CustomPaint(
              painter: LinePainter(
                strokeWidth: weight,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
  
}