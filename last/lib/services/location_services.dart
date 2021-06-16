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
        print("has permission");
        location.requestService().then((locationServiceEnabled) {
          if (locationServiceEnabled == true) {
            location.onLocationChanged.listen((locationValue) {
              //print("updating");
              locationController.add(LocationModel(
                  latitude: locationValue.latitude as double,
                  longitude: locationValue.longitude as double));
            });
          } else {
            print("service not enabled!!!");
          }
        });
      }
    });
  }
}
