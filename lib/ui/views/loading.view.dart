import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_test/ui/views/weather.view2.dart';

import '../shared/app.colors.dart';





class LoadingView extends StatefulWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  _LoadingViewState createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 5),
          () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WeatherView2()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body:  Center(
        child: SpinKitRipple(
          color: primaryColor,
          size: 100.0,
        ),
      ),
    );
  }
}
