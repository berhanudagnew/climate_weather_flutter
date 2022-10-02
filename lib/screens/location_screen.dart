import 'package:flutter/material.dart';
import 'package:climate_weather_flutter/utilities/constants.dart';
import 'package:climate_weather_flutter/services/weather.dart';
import 'package:climate_weather_flutter/screens/city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.location_weather});

  final location_weather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temprature = 0;
  int condition = 0;
  String? city_name;
  String icon_data = '';
  String sugustion = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    update_UI(widget.location_weather);
  }

  void update_UI(dynamic weather_data) {
    setState(() {
      if (weather_data == null) {
        temprature = 0;
        icon_data = 'Error';
        sugustion = 'Unable to get weather data';
        city_name = '';
        return;
      }
      condition = weather_data['weather'][0]['id'];
      double temp = weather_data['main']['temp'];
      temprature = temp.toInt();
      city_name = weather_data['name'];

      icon_data = weather.getWeatherIcon(condition);
      sugustion = weather.getMessage(temprature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weather_data = await weather.get_location_weather();
                      update_UI(weather_data);
                    },
                    child: Icon(
                      Icons.near_me,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typed_name = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CityScreen()),
                      );
                      if (typed_name != null) {
                        var weather_data =
                            await weather.get_city_weather(typed_name);
                        update_UI(weather_data);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temprature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$icon_data',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$sugustion in $city_name',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
