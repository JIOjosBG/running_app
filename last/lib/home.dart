import 'package:flutter/material.dart';

import './card.dart';
//import './bottomBar.dart';
import './drawer.dart';
import 'views/map_view.dart';

class Home extends StatelessWidget {
  final String title;

  Home({this.title = 'title here'});
  final _activities = [
    {
      'title': 'first run',
      'creator': 'koala',
      'location': 'Sidney',
      'path': [
        [1, 1],
        [100, 100],
        [200, 0]
      ]
    },
    {
      'title': 'second run',
      'creator': 'koala',
      'location': 'Melbarn',
      'path': [
        [1, 1],
        [300, 100],
        [500, 0]
      ]
    },
  ];

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(title: Text(title.toString())),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: _activities.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return new MyCard(item: _activities[index]);
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MapView(), //Map()),
              ));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
