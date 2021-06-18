import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:last/model/location_model.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class MyMap extends StatefulWidget {
  const MyMap({Key? key}) : super(key: key);

  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  @override
  Widget build(BuildContext context) {
    var locationModel = Provider.of<LocationModel>(context);
    List<LatLng> latlng = [LatLng(1, 1), LatLng(10, 10), LatLng(10, 100)];
    List<Polyline> _polyline = [
      Polyline(polylineId: PolylineId("asd"), points: latlng)
    ];

    GoogleMapController _controller;
    void _onMapCreated(GoogleMapController _cntlr) {
      _controller = _cntlr;
      Location().onLocationChanged.listen((l) {
        //print("asd");
        //print(_polyline[0]);
        // latlng.add(LatLng(l.latitude as double, l.longitude as double));
        //print("\n\n\nas${latlng[-1].latitude.toString()}");
        //_polyline.pop();
        // _polyline[0] =
        //     (Polyline(polylineId: PolylineId("asd1"), points: latlng));
        //print(latlng[-1].latitude as int);
        _controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(l.latitude as double, l.longitude as double),
                zoom: 15),
          ),
        );
      });
    }

    return Scaffold(
      body: Center(
        child: GoogleMap(
          polylines: Set.from(_polyline),
          initialCameraPosition: CameraPosition(
              target: LatLng(locationModel.latitude, locationModel.longitude)),
          mapType: MapType.normal,
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
        ),
      ),
    );
  }
}
