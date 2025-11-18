import 'package:flutter/material.dart';
import 'package:wolvnote_flutter/domain/model/path_data.dart';
import 'package:wolvnote_flutter/presentation/note/draw/component/draw_event.dart';
import 'package:wolvnote_flutter/presentation/note/draw/component/select_color_component.dart';
import 'package:wolvnote_flutter/presentation/note/draw/component/select_weight_component.dart';

class DrawMenu extends StatelessWidget {
  final List<PathData> paths; // or your PathData
  final Color selectedColor;
  final List<Color> colors;
  final double selectedWeight;
  final List<double> weights;
  final Function(DrawEvent) onClick;
  final ValueChanged<Color> onSelectColor;
  final ValueChanged<double> onSelectWeight;

  const DrawMenu({
    super.key,
    required this.paths,
    required this.selectedColor,
    required this.colors,
    required this.selectedWeight,
    required this.weights,
    required this.onClick,
    required this.onSelectColor,
    required this.onSelectWeight,
  });

  @override
  Widget build(BuildContext context) {
    final clear = "Clear";
    final saveExport = "Save & Export";

    return Card(
      elevation: 6,
      color: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // weight selector
            SelectWeightComponent(
              selectedWeight: selectedWeight,
              weights: weights,
              onSelectWeight: onSelectWeight,
            ),

            const SizedBox(height: 8),

            // color selector
            SelectColorComponent(
              selectedColor: selectedColor,
              colors: colors,
              onSelectColor: onSelectColor,
            ),

            const SizedBox(height: 6),

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Clear button
                TextButton.icon(
                  onPressed: () => onClick(const OnClearCanvasClick()),
                  icon: Icon(Icons.cleaning_services), // CleanIcon()
                  label: Text(clear),
                ),

                const Spacer(),

                // Animated visibility
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: paths.isNotEmpty
                      ? Row(
                    key: const ValueKey("visible"),
                    children: [
                      // Save button
                      IconButton(
                        padding: const EdgeInsets.only(bottom: 6),
                        onPressed: () => onClick(const InsertNote()),
                        icon: Icon(
                          Icons.save, // SaveIcon()
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),

                      // Save & Export button
                      TextButton.icon(
                        onPressed: () =>
                            onClick(const InsertAndExport()),
                        icon: Icon(
                          Icons.photo_library, // GalleryIcon()
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        label: Text(
                          saveExport,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  )
                      : const SizedBox.shrink(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  
}
