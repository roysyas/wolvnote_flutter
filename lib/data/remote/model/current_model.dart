import 'package:json_annotation/json_annotation.dart';
part 'current_model.g.dart';

@JsonSerializable()
class CurrentModel{
  final int? interval;
  final double? temperature_2m;
  final String? time;
  final int? weather_code;

  CurrentModel({
    this.interval,
    this.temperature_2m,
    this.time,
    this.weather_code
});

  factory CurrentModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentModelToJson(this);
}