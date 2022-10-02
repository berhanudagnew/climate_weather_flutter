import 'package:climate_weather_flutter/services/networking.dart';
import 'package:climate_weather_flutter/constant.dart' as api;
import 'package:climate_weather_flutter/services/location.dart';

class WeatherModel {
  Future<dynamic> get_city_weather(String city_name) async {
    var url =
        '${api.openweather_url}?q=$city_name&appid=${api.weather_api}&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weather_data = await networkHelper.get_data();
    return weather_data;
  }

  Future<dynamic> get_location_weather() async {
    Location location = Location();
    await location.get_current_location();

    String my_url =
        '${api.openweather_url}?lat=${location.latitude}&lon=${location.longtiude}&appid=${api.weather_api}&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: my_url);

    var weather_data = await networkHelper.get_data();

    return weather_data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
