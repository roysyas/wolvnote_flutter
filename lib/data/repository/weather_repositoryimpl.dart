import 'package:wolvnote_flutter/data/remote/model/temperature_response_model.dart';
import 'package:wolvnote_flutter/data/remote/weather_remote_data_source.dart';
import 'package:wolvnote_flutter/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository{
  final WeatherRemoteDataSource remoteDataSource;
  WeatherRepositoryImpl(this.remoteDataSource);

  @override
  Future<TemperatureResponseModel> getWeather(double latitude, double longitude, String timezone) async{
    return await remoteDataSource.getWeather(latitude, longitude, timezone);
  }
}