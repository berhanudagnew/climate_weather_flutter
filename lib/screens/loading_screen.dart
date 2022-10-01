import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:climate_weather_flutter/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void get_location() async {
    Location location = Location();
    await location.get_current_location();
    print(location.latitude);
    print(location.longtiude);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_location();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Get the current location
            get_location();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
