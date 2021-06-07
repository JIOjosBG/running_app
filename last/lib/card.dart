import 'package:flutter/material.dart';

import './detail.dart';

class MyCard extends StatelessWidget {
  final Map item;

  MyCard({required this.item});

  @override
  Widget build(BuildContext context) {
    // return Container(
    // );
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailActivity(
                      activity: item,
                      title: 'detail',
                    )),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Container(
            //   color: Colors.blue.shade300,
            //   height: 10,
            // ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    item['title'].toString(),
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text('by ' + item['creator']),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ActivityDetail {}
