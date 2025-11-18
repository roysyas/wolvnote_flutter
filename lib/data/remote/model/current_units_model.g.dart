// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_units_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentUnitsModel _$CurrentUnitsModelFromJson(Map<String, dynamic> json) =>
    CurrentUnitsModel(
      interval: json['interval'] as String?,
      temperature_2m: json['temperature_2m'] as String?,
      time: json['time'] as String?,
      weather_code: json['weather_code'] as String?,
    );

Map<String, dynamic> _$CurrentUnitsModelToJson(CurrentUnitsModel instance) =>
    <String, dynamic>{
      'interval': instance.interval,
      'temperature_2m': instance.temperature_2m,
      'time': instance.time,
      'weather_code': instance.weather_code,
    };
