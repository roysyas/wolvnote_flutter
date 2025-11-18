import 'package:dio/dio.dart';

class ApiClient{
  final Dio dio;

  ApiClient(): dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.open-meteo.com/v1/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10)
    )
  );
}