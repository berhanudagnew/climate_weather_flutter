import 'dart:math';

import 'package:climate_weather_flutter/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:climate_weather_flutter/services/weather.dart';
import 'package:climate_weather_flutter/screens/loading_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void get_location_data() async {
    var weather_data = await WeatherModel().get_location_weather();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(
          location_weather: weather_data,
        );
      }),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_location_data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(color: Colors.white, size: 100.0),
      ),
    );
  }
}
