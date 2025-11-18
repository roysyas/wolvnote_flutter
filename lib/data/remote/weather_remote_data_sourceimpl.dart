import 'package:wolvnote_flutter/data/remote/api_client.dart';
import 'package:wolvnote_flutter/data/remote/model/temperature_response_model.dart';
import 'package:wolvnote_flutter/data/remote/weather_remote_data_source.dart';

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final ApiClient client;

  WeatherRemoteDataSourceImpl(this.client);

  @override
  Future<TemperatureResponseModel> getWeather(
    double latitude,
    double longitude,
    String timezone,
  ) async {
    final response = await client.dio.get(
      'forecast',
      queryParameters: {
        'latitude': latitude,
        'longitude': longitude,
        'timezone': timezone,
        'current': "temperature_2m,weather_code",
      },
    );

    return TemperatureResponseModel.fromJson(response.data);
  }
}
