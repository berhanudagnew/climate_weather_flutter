import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longtiude;
  Future<void> get_current_location() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longtiude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
