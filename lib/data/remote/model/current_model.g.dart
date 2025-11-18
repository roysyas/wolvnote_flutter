// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentModel _$CurrentModelFromJson(Map<String, dynamic> json) => CurrentModel(
  interval: (json['interval'] as num?)?.toInt(),
  temperature_2m: (json['temperature_2m'] as num?)?.toDouble(),
  time: json['time'] as String?,
  weather_code: (json['weather_code'] as num?)?.toInt(),
);

Map<String, dynamic> _$CurrentModelToJson(CurrentModel instance) =>
    <String, dynamic>{
      'interval': instance.interval,
      'temperature_2m': instance.temperature_2m,
      'time': instance.time,
      'weather_code': instance.weather_code,
    };
