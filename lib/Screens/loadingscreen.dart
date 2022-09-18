import 'package:clima/Screens/locationscreen.dart';
import 'package:clima/Services/weather.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void getlocationData() async {
    var weatherdata = await WeatherModel().getWeatherData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherdata);
    }));
  }

  @override
  void initState() {
    super.initState();
    getlocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SpinKitDoubleBounce(
      color: Colors.white,
      size: 100.0,
    )));
  }
}
