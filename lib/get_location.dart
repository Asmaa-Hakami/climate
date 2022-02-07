import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart' as geocoder;
import 'package:weather/weather.dart';

final location = Location();
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

  LocationData locationData = await location.getLocation();
  add = await geocoder.Geocoder.local.findAddressesFromCoordinates(
    geocoder.Coordinates(locationData.latitude, locationData.longitude),
  );
  wf = WeatherFactory(key);
  w = await wf!.currentWeatherByLocation(
      locationData.latitude!, locationData.longitude!);
      
  return await location
      .getLocation(); //locationData; //await location.getLocation();
}

/*
  Future<geocoder.Address> getAddress() async {

    LocationData locationData = await location.getLocation();
    //address = await geocoder.Geocoder.local.findAddressesFromCoordinates(
    //  geocoder.Coordinates(locationData.latitude, locationData.longitude),
    //);
   // getLocationData().then((locationData) {
     // if (locationData != null) {
    address = geocoder.Geocoder.local.findAddressesFromCoordinates(
      geocoder.Coordinates(locationData.latitude, locationData.longitude),
    );
    //yourCityName =  address.first.locality.toString();

       // String key = 'b4e3c02f31a7333f0a11c81d0fba3af7';
   // WeatherFactory wf = WeatherFactory(key);

   //  Weather w = await  wf.currentWeatherByLocation(locationData.latitude!, locationData.longitude!);

      //celsius = w.temperature!.celsius!.toInt();

    return await address ; //+ ' ' + celsius.toString()
  }
  */
    
  