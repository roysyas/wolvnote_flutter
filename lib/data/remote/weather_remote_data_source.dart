import 'package:wolvnote_flutter/data/remote/model/temperature_response_model.dart';

abstract class WeatherRemoteDataSource {
  Future<TemperatureResponseModel> getWeather(
    double latitude,
    double longitude,
    String timezone,
  );
}
