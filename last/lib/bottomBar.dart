import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(15.0),
            child: Icon(Icons.home),
          ),
          Container(
            padding: const EdgeInsets.all(15.0),
            child: Icon(Icons.account_circle),
          ),
          Container(
            padding: const EdgeInsets.all(15.0),
            child: Icon(Icons.message),
          ),
          Container(
            padding: const EdgeInsets.all(15.0),
            child: Icon(Icons.access_alarm),
          )
        ],
      ),
    );
  }
}
