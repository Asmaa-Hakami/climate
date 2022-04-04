import 'package:location/location.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:geocoding/geocoding.dart' as geocoding;

import 'package:weather/weather.dart';

final location = Location();
// ignore: prefer_typing_uninitialized_variables
var add;

String key = 'b4e3c02f31a7333f0a11c81d0fba3af7';
WeatherFactory? wf;
Weather? w;

Future<LocationData?> getLocationData() async {
  var _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return null;
    }
  }

  var _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return null;
    }
  }

  if (add == null) {
    LocationData locationData = await location.getLocation();
    add = await geocoding.placemarkFromCoordinates(
        locationData.latitude!, locationData.longitude!,
        localeIdentifier: "en");

    wf = WeatherFactory(key);
    w = await wf!.currentWeatherByLocation(
        locationData.latitude!, locationData.longitude!);
  }

  return await location.getLocation();
}
