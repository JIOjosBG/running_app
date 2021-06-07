import 'package:flutter/material.dart';
import 'package:last/model/location_model.dart';
import 'package:provider/provider.dart';

class MyMap extends StatelessWidget {
  const MyMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locationModel = Provider.of<LocationModel>(context);

    return Scaffold(
      body: Center(
        child: Text("${locationModel.latitude},${locationModel.longitude}"),
      ),
    );
  }
}
