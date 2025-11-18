import 'package:json_annotation/json_annotation.dart';
import 'package:wolvnote_flutter/data/remote/model/current_model.dart';
import 'package:wolvnote_flutter/data/remote/model/current_units_model.dart';
part 'temperature_response_model.g.dart';

@JsonSerializable()
class TemperatureResponseModel{
  final CurrentModel? current;
  final CurrentUnitsModel? current_units;
  final double? elevation;
  final double? generationtime_ms;
  final double? latitude;
  final double? longitude;
  final String? timezone;
  final String? timezone_abbreviation;
  final int? utc_offset_seconds;

  TemperatureResponseModel({
    this.current,
    this.current_units,
    this.elevation,
    this.generationtime_ms,
    this.latitude,
    this.longitude,
    this.timezone,
    this.timezone_abbreviation,
    this.utc_offset_seconds
});

  factory TemperatureResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TemperatureResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TemperatureResponseModelToJson(this);
}
