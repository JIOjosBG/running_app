import 'package:flutter/material.dart';

class DetailActivity extends StatelessWidget {
  final activity;
  final String title;

  DetailActivity({required this.activity, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: BottomBar(),
      appBar: AppBar(
        title: Text(title.toString()),
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              color: Colors.blue.shade100,
              height: 100,
            ),
            Text(activity['title'].toString()),
            Text(activity['creator'].toString()),
          ],
        ),
      ),
    );
  }
}
