import 'package:wolvnote_flutter/domain/model/current_weather.dart';
import 'package:wolvnote_flutter/domain/model/get_weather.dart';
import 'package:wolvnote_flutter/domain/repository/weather_repository.dart';

class WeatherUseCase {
  final WeatherRepository repository;

  WeatherUseCase(this.repository);

  Future<CurrentWeather> call(
    double latitude,
    double longitude,
    String timezone,
  ) async {
    final data = await repository.getWeather(latitude, longitude, timezone);
    CurrentWeather currentWeather = CurrentWeather(
      temperature:
          "${data.current?.temperature_2m} ${data.current_units?.temperature_2m}",
      weather: WeatherCode().getWeather(data.current?.weather_code),
    );
    return currentWeather;
  }
}
