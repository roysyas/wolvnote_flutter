import 'package:geolocator/geolocator.dart';
import 'package:wolvnote_flutter/domain/repository/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository{
  @override
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission locationPermission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      throw Exception('Location services are disabled.');
    }

    locationPermission = await Geolocator.checkPermission();
    if(locationPermission == LocationPermission.denied){
      locationPermission = await Geolocator.requestPermission();
      if(locationPermission == LocationPermission.denied){
        throw Exception('Location permissions are denied.');
      }
    }

    if(locationPermission == LocationPermission.deniedForever){
      throw Exception(
          'Location permissions are permanently denied, cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.best,
            distanceFilter: 0
        )
    );
  }

}