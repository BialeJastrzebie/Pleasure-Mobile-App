import 'package:flutter/material.dart';
import 'app/screens/home/home.dart';
import 'app/screens/map/map.dart';
import 'app/screens/schedule/schedule.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PLeasure',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: '/', // This is the route that the app opens first.
      routes: {
        '/': (context) => const HomePage(), // Home route
        '/map': (context) => const MapPage(), // Map route
        '/schedule': (context) => const SchedulePage(), // Schedule route
      },
    );
  }
}
