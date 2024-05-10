import 'package:flutter/material.dart';
import 'app/screens/home/home_page.dart';
import 'app/screens/map/map_page.dart';
import 'app/screens/schedule/schedule_page.dart';
import 'app/shared/themes/theme.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp,DeviceOrientation.portraitDown])
      .then((_) => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PLeasure',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: backgroundColor,
          elevation: 5.0,
        ),
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
