import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wolvnote_flutter/domain/model/checklist_item.dart';
import 'package:wolvnote_flutter/presentation/note/home/home_state.dart';
import '../../../di/providers.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class HomeViewModel extends Notifier<HomeState>{
  @override
  HomeState build() => const HomeState();

  void setToggle(bool isToggle){
    state = state.copyWith(isToggle: isToggle);
  }

  List<CheckListItem> parseContentData(String? jsonStr) {
    if (jsonStr == null || jsonStr.isEmpty) {
      return [];
    }

    try {
      final decoded = jsonDecode(jsonStr);

      if (decoded is List) {
        return decoded
            .map((e) => CheckListItem.fromJson(e as Map<String, dynamic>))
            .toList();
      }

      // If the JSON is not a list
      return [];
    } catch (_) {
      // If JSON parsing fails
      return [];
    }
  }

  Future<void> determineWeather() async{
    state = state.copyWith(weatherError: null);
    try{
      final get = ref.read(locationUseCaseProvider);
      final data = await get();
      await getWeather(data.latitude, data.longitude);
    }catch(e){
      state = state.copyWith(weatherError: e.toString());
    }
  }

  Future<void> getWeather(double latitude, double longitude) async{
    state = state.copyWith(weatherError: null);
    tz.initializeTimeZones();
    final timezone = tz.local.name;

    try{
      final get = ref.read(weatherUseCaseProvider);
      final data = await get(latitude,longitude,timezone);
      state = state.copyWith(currentWeather: data);
    }catch(e){
      state = state.copyWith(weatherError: e.toString());
    }
  }

  Future<void> getNotes() async{
    state = state.copyWith(isLoading: true, error: null);
    try{
      final get = ref.read(getNotesUseCaseProvider);
      final notes = await get();
      state = state.copyWith(isLoading: false, notes: notes);
    }catch(e){
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> deleteNote(int id) async{
    state = state.copyWith(isLoading: true,error: null);
    try{
      final delete = ref.read(deleteNoteUseCaseProvider);
      await delete(id);
      state = state.copyWith(isLoading: false);
      await getNotes();
    }catch(e){
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}