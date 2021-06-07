import 'dart:async';

import 'package:location/location.dart';

class UserLocation {
  final double latitude;
  final double longitude;

  UserLocation({required this.latitude, required this.longitude});
}

class LocationService {
  late UserLocation _currentLocation;
  var location = Location();
  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation = UserLocation(
        latitude: userLocation.latitude as double,
        longitude: userLocation.longitude as double,
      );
    } on Exception catch (e) {
      print('Could not get location: ${e.toString()}');
    }
    return _currentLocation;
  }

  StreamController<UserLocation> _locationController =
      StreamController<UserLocation>();

  Stream<UserLocation> get locationStream => _locationController.stream;

  LocationService() {
    // Request permission to use location
    location.requestPermission().then((granted) {
      if (granted == true) {
        // If granted listen to the onLocationChanged stream and emit over our controller
        location.onLocationChanged.listen((locationData) {
          print("asdasdasdasdasdads $locationData");
          if (locationData != null) {
            _locationController.add(UserLocation(
              latitude: locationData.latitude as double,
              longitude: locationData.longitude as double,
            ));
          }
        });
      }
    });
  }
}
