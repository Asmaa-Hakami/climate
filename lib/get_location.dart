import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

import 'package:weather/weather.dart';

final locationProvider = ChangeNotifierProvider((ref) => LocationProvider());

class LocationProvider with ChangeNotifier {
  final _key = 'b4e3c02f31a7333f0a11c81d0fba3af7';
  WeatherFactory? _weatherFactory;
  Weather? _weather;
  String? _cityName;
  String? _temperature;
  late Position _locationData;

  Weather? get weather => _weather;
  String? get cityName => _cityName;
  String? get temperature => _temperature;
  Position get locationData => _locationData;
  Future<void> initLocationData() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    _locationData = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);

    final addresses = await geocoding.placemarkFromCoordinates(
        _locationData.latitude, _locationData.longitude,
        localeIdentifier: "en");
    _weatherFactory = WeatherFactory(_key);
    _cityName = addresses.first.locality;
    _weather = await _weatherFactory!.currentWeatherByLocation(
        _locationData.latitude, _locationData.longitude);
    _temperature = _weather?.temperature?.celsius?.toInt().toString();

    notifyListeners();
  }
}
