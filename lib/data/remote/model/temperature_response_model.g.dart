// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemperatureResponseModel _$TemperatureResponseModelFromJson(
  Map<String, dynamic> json,
) => TemperatureResponseModel(
  current: json['current'] == null
      ? null
      : CurrentModel.fromJson(json['current'] as Map<String, dynamic>),
  current_units: json['current_units'] == null
      ? null
      : CurrentUnitsModel.fromJson(
          json['current_units'] as Map<String, dynamic>,
        ),
  elevation: (json['elevation'] as num?)?.toDouble(),
  generationtime_ms: (json['generationtime_ms'] as num?)?.toDouble(),
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  timezone: json['timezone'] as String?,
  timezone_abbreviation: json['timezone_abbreviation'] as String?,
  utc_offset_seconds: (json['utc_offset_seconds'] as num?)?.toInt(),
);

Map<String, dynamic> _$TemperatureResponseModelToJson(
  TemperatureResponseModel instance,
) => <String, dynamic>{
  'current': instance.current,
  'current_units': instance.current_units,
  'elevation': instance.elevation,
  'generationtime_ms': instance.generationtime_ms,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'timezone': instance.timezone,
  'timezone_abbreviation': instance.timezone_abbreviation,
  'utc_offset_seconds': instance.utc_offset_seconds,
};
