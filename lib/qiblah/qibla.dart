// ignore_for_file: prefer_const_constructors

// ignore: avoid_web_libraries_in_flutter

// ignore: import_of_legacy_library_into_null_safe
import 'package:adhan/adhan.dart';
import 'package:climate_calendar_new/ui/navdraw.dart';
import 'package:climate_calendar_new/ui/text_scale.dart';
import 'package:climate_calendar_new/ui/top_icons.dart';

import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:location/location.dart';

import '../get_location.dart';
import 'loading_indicator.dart';
import 'qiblah_compass.dart';

class Qiblah extends StatefulWidget {
  const Qiblah({Key? key}) : super(key: key);
  @override
  _Qiblah createState() => _Qiblah();
}

class _Qiblah extends State<Qiblah> {
  //

  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  late Position position;
  late double pLat;
  late double pLong;
  late Coordinates userCoordinates;
  // ignore: prefer_typing_uninitialized_variables
  late final qibla;

  String yourCityName = '';
  final location = Location();
  String? locationError;

  @override
  Widget build(BuildContext context) {
    if (add != null) {
      yourCityName = add.first.locality.toString();
    }
    return Scaffold(
      body: SafeArea(
          top: false,
          bottom: false,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://i.postimg.cc/3NCPGHpv/qibla-back.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TopIconsWhite(context, 1),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.17,
                ),
                Text(
                  'اتجاه القبلة',
                   
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 25),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 13, left: 5),
                        child: Image.asset(
                          'assets/icons/location.png',
                          height: 20,
                        ),
                      ),
                      TextScaleFactorClamper(
                          child: Text(
                        yourCityName,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            height: 2,
                            fontFamily: 'ArbFONTS'),
                      )),
                    ],
                  ),
                ),
                FutureBuilder(
                  future: _deviceSupport,
                  builder: (_, AsyncSnapshot<bool?> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return LoadingIndicator();
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: ${snapshot.error.toString()}"),
                      );
                    }
                    return QiblahCompass();
                  },
                ),
              ],
            ),
          )),
      drawer: const NavigationDrawer(),
    );
  }
}
