import 'package:clima/Screens/locationscreen.dart';
import 'package:clima/Services/networking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/Services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const appid = '38167d4dc27b0b2d852fdbc046da4fd2';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;
  @override
  void getlocationData() async {
    Location newlocation = Location();
    await newlocation.getCurrentLocation();

    latitude = newlocation.latitude;
    longitude = newlocation.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        stringurl:
            'https://api.openweathermap.org/data/2.5/weather?lat=&latitude&lon=&longitude&appid=&appid');
    var weatherdata = networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
  }

  getData() async {
    {}
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
