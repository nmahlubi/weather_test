// @dart=2.9
import 'package:flutter/material.dart';
import 'package:weather_test/ui/router.dart';

import 'locator.dart';

void main() {
  setupLocator();
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assessment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: 'LoadingView',
      onGenerateRoute: Routers.generateRoute,
    );
  }
}
