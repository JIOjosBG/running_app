import 'package:flutter/material.dart';

import './drawer.dart';

class Profile extends StatelessWidget {
  final user;
  final String title;
  Profile({required this.user, this.title = 'title here'});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(title.toString()),
      ),
      body: Container(
        child: Column(
          children: [
            Text(user['name'].toString()),
          ],
        ),
      ),
    );
  }
}
