import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth_service.dart';
import 'pages/home.dart';
import 'pages/login.dart';
import 'pages/profile.dart';
import 'pages/event_mgmt.dart';
import 'pages/volunteer_matching.dart';
import 'pages/volunteer_history.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Volunteer Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => AuthService().handleAuth(),
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/profile': (context) => ProfilePage(),
        '/event_management': (context) => EventMgmtPage(),
        '/volunteer_matching': (context) => VolunteerMatchingPage(),
        '/volunteer_history': (context) => VolunteerHistoryPage(),
      },
    );
  }
}
