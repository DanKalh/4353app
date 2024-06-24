import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Text('Profile'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/event_mgmt');
              },
              child: Text('Manage Events'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/volunteer_history');
              },
              child: Text('Volunteer History'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/volunteer_matching');
              },
              child: Text('Volunteer Matching'),
            ),
          ],
        ),
      ),
    );
  }
}
