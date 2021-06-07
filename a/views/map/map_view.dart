import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/service.dart';
//import './map.dart';

class MapView extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserLocation>(
      initialData: UserLocation(latitude: 2, longitude: 1),
      create: (context) => LocationService().locationStream,
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
            body: MyMap(),
          )),
    );
  }
}

class MyMap extends StatelessWidget {
  //const MyMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locationModel = Provider.of<UserLocation>(context);

    return Scaffold(
      body: Center(
        child: Text('${locationModel.latitude}'),
      ),
    );
    //Center(
    //   child: Text(
    //       'Location: Lat${userLocation?.latitude}, Long: ${userLocation?.longitude}'),
    // );
  }
}
