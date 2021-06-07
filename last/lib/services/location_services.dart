import 'dart:async';

import 'package:last/model/location_model.dart';
import 'package:location/location.dart';

class LocationService {
  Location location = Location();

  late LocationModel currentLocation;

  StreamController<LocationModel> locationController =
      StreamController<LocationModel>.broadcast();

  Stream<LocationModel> get getStreamData => locationController.stream;

  LocationService() {
    location.requestPermission().then((locationPermission) {
      if (locationPermission == PermissionStatus.granted) {
        location.onLocationChanged.listen((locationValue) {
          locationController.add(LocationModel(
              latitude: locationValue.latitude as double,
              longitude: locationValue.longitude as double));
        });
      }
    });
  }
}
