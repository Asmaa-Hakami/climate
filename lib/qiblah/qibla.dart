// ignore_for_file: prefer_const_constructors

// ignore: avoid_web_libraries_in_flutter

// ignore: import_of_legacy_library_into_null_safe
import 'package:adhan/adhan.dart';
import 'package:climate_calendar_new/ui/nav_bar.dart';
import 'package:climate_calendar_new/ui/navdraw.dart';
import 'package:climate_calendar_new/ui/text_scale.dart';
import 'package:climate_calendar_new/ui/top_icons.dart';

import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:location/location.dart';

import '../get_location.dart';
import '../main.dart';
import 'loading_indicator.dart';
import 'qiblah_compass.dart';

class Qiblah extends StatefulWidget {
 const Qiblah({Key? key}) : super(key: key);
@override
 _Qiblah createState() => _Qiblah();
}
class _Qiblah extends State<Qiblah>{//
  //const Qiblah({Key? key}) : super(key: key);
  //final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

      late Position position;
       late double pLat;
   late double pLong;
   late Coordinates userCoordinates;
  // ignore: prefer_typing_uninitialized_variables
  late final qibla;


  String yourCityName = add.first.locality.toString();
  //var address;
  final location = Location(); 
  String? locationError;

/*
  @override
  void initState() {
    getLocationData().then((locationData) {
      if (!mounted) {
        return;
      }
      if (locationData != null) {
        setState(() {
          yourCityName =  add.first.locality.toString();
        });
      } else {
        setState(() {
          locationError = "Couldn't Get Your Location!";
        });
      }
    });
    super.initState();
  }
  */
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: SafeArea(
            top: false,
            bottom: false,

            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/qibla_back.png'),
                  fit: BoxFit.fill,
                ),
              ),
            
                   child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [ 
                    TopIconsWhite(context, 1),
                    //Container(
                      //height: MediaQuery.of(context).size.height * 0.37,
                      //alignment: Alignment.center,
                      //padding: EdgeInsets.only(right: 15),
                      //child:
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.17,
                      ),
                      Text('اتجاه القبلة',textScaleFactor: 1.0, style: TextStyle(fontSize: 30, color: Colors.white),),

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
                              child:Text(
                        yourCityName, // ' $yourCityName',
                        //textScaleFactor: 1.0,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            height: 2,
                            fontFamily: 'ArbFONTS'),
                      )),
                    ],
                  ),
                ),
                    //),

/*
       MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff0c7b93),
        primaryColorLight: Color(0xff00a8cc),
        primaryColorDark: Color(0xff27496d),
        accentColor: Color(0xffecce6d),
      ),
      darkTheme: ThemeData.dark().copyWith(accentColor: Color(0xffecce6d)),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: 
        */
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
            //else {// (snapshot.data!) {
              //return QiblahCompass();
            //}// else {
              //return QiblahMaps();
            //}
          },
        ),
       /*   FutureBuilder(
          future: _deviceSupport,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              );

            if (snapshot.hasError)
              return Center(
                child: Text('Error: ${snapshot.error.toString()}'),
              );
            if (snapshot.hasData)
              return QiblaCompass();
            else
              return Container(
                child: Text('Error'),
              );
          },
        ),
        */
              ],
            ),
        
         )),
      bottomNavigationBar: NavigationBarBottom(4),
      drawer: const navigationDrawer(),    );
  }
}
