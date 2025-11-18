import 'package:geolocator/geolocator.dart';
import 'package:wolvnote_flutter/domain/repository/location_repository.dart';

class LocationUseCase{
  final LocationRepository repository;
  LocationUseCase(this.repository);

  Future<Position> call(){
    return repository.determinePosition();
  }
}