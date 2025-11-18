import 'package:flutter/material.dart';
import 'package:wolvnote_flutter/domain/model/draw_data.dart';
import 'package:wolvnote_flutter/domain/model/path_data.dart';

class DrawState{
  final bool isLoading;
  final bool isSuccess;
  final bool isEdit;
  final Color selectedColor;
  final double selectedWeight;
  final PathData? currentPath;
  final DrawData? drawData;
  final String? error;

  DrawState({
    this.isLoading = false,
    this.isSuccess = false,
    this.isEdit = false,
    this.selectedColor = Colors.black,
    this.selectedWeight = 1.0,
    this.currentPath,
    this.drawData,
    this.error
  });

  DrawState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isEdit,
    Color? selectedColor,
    double? selectedWeight,
    PathData? currentPath,
    DrawData? drawData,
    String? error,
  }) {
    return DrawState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isEdit: isEdit ?? this.isEdit,
      selectedColor: selectedColor ?? this.selectedColor,
      selectedWeight: selectedWeight ?? this.selectedWeight,
      currentPath: currentPath ?? this.currentPath,
      drawData: drawData ?? this.drawData,
      error: error ?? this.error
    );
  }
}