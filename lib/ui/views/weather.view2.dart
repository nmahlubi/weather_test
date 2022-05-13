import 'dart:convert';


import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:http/http.dart' as http;

import '../shared/app.colors.dart';
import '../shared/ui.helpers.dart';

class WeatherView2 extends StatefulWidget {
  const WeatherView2({Key? key}) : super(key: key);

  @override
  _WeatherView2State createState() => _WeatherView2State();
}

class _WeatherView2State extends State<WeatherView2> {
  @override
  var temp;
  var description;
  var currently;
  var humidity;
  var windSpeed;

  String apis = "https://api.openweathermap.org/data/2.5/weather?q=Johannesburg&units=imperial&appid=0cebbf25b4c56494893333e85f2f9f39";

  Future getWeather() async {
    final response = await http.get(
        Uri.parse(apis), headers: {"Accept": "application/json"});
    var results = jsonDecode(response.body);
    setState(() {
      this.temp = results['main']['temp'];
      this.description = results['weather'][0]['description'];
      this.currently = results['weather'][0]['main'];
      this.humidity = results['main']['humidity'];
      this.windSpeed = results['wind']['speed'];
    });
  }

  @override
  void initState() {
    super.initState();
    this.getWeather();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        UIHelper.verticalSpaceSmall(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery
                .of(context)
                .size
                .height / 2,
            width: MediaQuery
                .of(context)
                .size
                .width,
            color: primaryLightColor,
            child:  FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 3,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  color: primaryLightColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text('Weather in Johannesburg',
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        temp != null ? temp.toString() + "\u00B0" : "loading",
                        style: TextStyle(
                          color: white,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          currently != null ? currently.toString() : "loading",
                          style: TextStyle(
                            color: white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              back: Container(
                child: Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: ListView(
                        children:  [
                          UIHelper.verticalSpaceSmall(),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Center(
                              child: Text('Weather Details',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          UIHelper.verticalSpaceSmall(),
                          ListTile(
                            leading: FaIcon(FontAwesomeIcons.thermometerHalf, color: primaryColor,),
                            title: Text("Temperature"),
                            trailing: Text(temp != null ? temp.toString() + "\u00B0" : "loading"),
                          ),
                          ListTile(
                            leading: FaIcon(FontAwesomeIcons.cloud, color: primaryColor,),
                            title: Text("Weather"),
                            trailing: Text(description != null ? description.toString() : "loading"),
                          ),
                          ListTile(
                            leading: FaIcon(FontAwesomeIcons.sun, color: primaryColor,),
                            title: Text("Humidity"),
                            trailing: Text(humidity != null ? humidity.toString() : "loading"),
                          ),
                          ListTile(
                            leading: FaIcon(FontAwesomeIcons.wind, color: primaryColor,),
                            title: Text("Wind Speed"),
                            trailing: Text(windSpeed != null ? windSpeed.toString() : "loading"),
                          )
                        ],
                      ),
                    )),
              ),
            ),),
        ),
      ],),
    );
  }
}