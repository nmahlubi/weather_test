//@dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_test/ui/views/loading.view.dart';
import 'package:weather_test/ui/views/weather.view2.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => WeatherView2());
      case 'LoadingView':
        return MaterialPageRoute(builder: (_) => LoadingView());
      // case 'weatherDetails':
      //   var weather = settings.arguments as Weather;

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No Route defines for ${settings.name}'),
                  ),
                ));
    }
  }
}
