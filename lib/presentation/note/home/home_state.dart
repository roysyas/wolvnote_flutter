import 'package:wolvnote_flutter/domain/model/current_weather.dart';
import 'package:wolvnote_flutter/domain/model/note_entity.dart';

class HomeState {
  final String? weatherError;
  final CurrentWeather? currentWeather;
  final bool isLoading;
  final String? error;
  final List<NoteEntity>? notes;
  final bool isToggle;

  const HomeState({
    this.weatherError,
    this.currentWeather,
    this.isLoading = true,
    this.error,
    this.notes,
    this.isToggle = false,
  });

  HomeState copyWith({
    String? weatherError,
    CurrentWeather? currentWeather,
    bool? isLoading,
    String? error,
    List<NoteEntity>? notes,
    bool? isEmpty,
    bool? isToggle,
  }) {
    return HomeState(
      weatherError: weatherError ?? this.weatherError,
      currentWeather: currentWeather ?? this.currentWeather,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      notes: notes ?? this.notes,
      isToggle: isToggle ?? this.isToggle,
    );
  }
}
