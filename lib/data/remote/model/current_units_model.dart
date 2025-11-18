import 'package:json_annotation/json_annotation.dart';
part 'current_units_model.g.dart';

@JsonSerializable()
class CurrentUnitsModel{
  final String? interval;
  final String? temperature_2m;
  final String? time;
  final String? weather_code;
  
  CurrentUnitsModel({
    this.interval,
    this.temperature_2m,
    this.time,
    this.weather_code
});

  factory CurrentUnitsModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentUnitsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentUnitsModelToJson(this);
}