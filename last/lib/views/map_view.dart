import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/location_model.dart';
import '../services/location_services.dart';
import './mymap.dart';

class MapView extends StatelessWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<LocationModel>(
      create: (_) => LocationService().getStreamData,
      initialData: LocationModel(longitude: 0, latitude: 0),
      child: MyMap(),
    );
  }
}
