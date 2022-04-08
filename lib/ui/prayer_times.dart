// ignore: import_of_legacy_library_into_null_safe
import 'dart:async';

// ignore: import_of_legacy_library_into_null_safe
import 'package:adhan/adhan.dart';
import 'package:climate_calendar_new/dates.dart';
import 'package:climate_calendar_new/ui/text_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';

import '../get_location.dart';
import 'navdraw.dart';
import 'top_icons.dart';
import 'package:intl/intl.dart';

class Prayers extends ConsumerStatefulWidget {
  const Prayers({Key? key}) : super(key: key);

  @override
  ConsumerState<Prayers> createState() => _PrayerTimesState();
}

class _PrayerTimesState extends ConsumerState<Prayers> {
  String? locationError;
  PrayerTimes? prayerTimes;
  Prayer? next;
  DateTime? nextPrayerTime;
  final date = DateTime.now();
  String yourCityName = '';

  late String textAdzanRemaining = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      prayerTimes = PrayerTimes(
          Coordinates(ref.read(locationProvider).locationData.latitude,
              ref.read(locationProvider).locationData.longitude),
          DateComponents.from(DateTime.now()),
          CalculationMethod.umm_al_qura.getParameters());
      if (prayerTimes!.nextPrayer() == Prayer.none) {
        prayerTimes = PrayerTimes(
            Coordinates(ref.read(locationProvider).locationData.latitude,
                ref.read(locationProvider).locationData.longitude),
            DateComponents.from(DateTime.now().add(const Duration(days: 1))),
            CalculationMethod.umm_al_qura.getParameters());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://i.postimg.cc/Bvj9VkWr/prayer-times.png'), //'assets/images/prayer_times.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              TopIconsGreen(context, 1),
              Column(children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: const TextScaleFactorClamper(
                      child: Text('مواقيت الأذان',
                          //
                          style: TextStyle(
                              color: Color(0xff3D5B67),
                              fontSize: 27,
                              fontFamily: 'ArbFONTS')),
                    )),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.23,
                      right: 25),
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
                        yourCityName, // ' $yourCityName',
                        //
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            height: 2,
                            fontFamily: 'ArbFONTS'),
                      )),
                    ],
                  ),
                ),
                //   ],
                // ),
              ]),

              //FutureBuilder(
              Builder(
                // future: initState(),
                //builder: (context, snapshot) { //BuildContext
                builder: (BuildContext context) {
                  if (prayerTimes != null) {
                    next = prayerTimes!.nextPrayer();
                    if (next != null) {
                      nextPrayerTime = prayerTimes!.timeForPrayer(next!);
                    }

                    Timer(const Duration(seconds: 1), () {
                      var curTime = DateTime.now();
                      var secondDiff = curTime.difference(nextPrayerTime!);
                      String strsecondDiff = AllDates.replaceEngNumber(
                          secondDiff.toString().substring(1, 8));

                      setState(() {
                        textAdzanRemaining =
                            strsecondDiff; //: $strminuteDiff : $strHourDiff
                      });
                    });
                    var timeTo =
                        next == Prayer.sunrise ? 'متبقي على' : 'متبقي على أذان';
/*
                    NotificationService.twoScheduleNotifications(
                      //title: formattedPrayerName(next!).toString(),
                      body: formattedPrayerName(next!).toString(),
                      id: 0,
                      payload: '0',

                      schedualedDate: DateFormat('yyyyy-MM-dd h:mm')
                          .parse('$nextPrayerTime'), //'2022-01-07 01:48'
                    );*/
                    return Column(
                      children: [
                        //Padding(
                        //padding: EdgeInsets.only(
                        //  left: MediaQuery.of(context).size.width * 0.5,
                        //top: 10),
                        //child:
                        Row(
                          children: [
                            const Padding(padding: EdgeInsets.only(right: 25)),
                            TextScaleFactorClamper(
                                child: Text(
                              "$timeTo ${formattedPrayerName(next!).toString()} ",
                              //
                              style: const TextStyle(
                                  color: Color(0xFFD4E0E2),
                                  fontSize: 15,
                                  height: 1.5,
                                  fontFamily: 'ArbFONTS'),
                            )),
                            TextScaleFactorClamper(
                                child: Text(
                              textAdzanRemaining,
                              //
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  height: 1.5,
                                  fontFamily: 'ArbFONTS'),
                            )),
                          ],
                        ),

                        Row(
                          children: [
                            const Padding(padding: EdgeInsets.only(right: 25)),
                            TextScaleFactorClamper(
                                child: Text(
                              formattedPrayerName(next!).toString(),
                              //
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  height: 1.3,
                                  fontFamily: 'ArbFONTS'),
                            )),
                            TextScaleFactorClamper(
                                child: Text(
                              prayerTime(DateFormat.jm().format(
                                  nextPrayerTime!)), // AllDates.replaceEngNumber(nextPrayerTime.toString().substring(nextPrayerTime.toString().length - 12 ,nextPrayerTime.toString().length - 7)) + ' ' + char(),
                              //
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  height: 1.5,
                                  fontFamily: 'ArbFONTS'),
                            )),
                          ],
                        ),

                        const Padding(
                          padding: EdgeInsets.all(4.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //const Padding(padding: EdgeInsets.all(10)),
                            createPrayerBodyItem(
                                text: 'الفجر ',
                                text2: prayerTime(
                                    DateFormat.jm().format(prayerTimes!.fajr))),
                            createPrayerBodyItem(
                                text: 'الشروق ',
                                text2: prayerTime(DateFormat.jm()
                                    .format(prayerTimes!.sunrise))),
                            createPrayerBodyItem(
                                text: 'الظهر ',
                                text2: prayerTime(DateFormat.jm()
                                    .format(prayerTimes!.dhuhr))),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(top: 5)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            createPrayerBodyItem(
                                text: 'العصر ',
                                text2: prayerTime(
                                    DateFormat.jm().format(prayerTimes!.asr))),
                            createPrayerBodyItem(
                                text: 'المغرب ',
                                text2: prayerTime(DateFormat.jm()
                                    .format(prayerTimes!.maghrib))),
                            createPrayerBodyItem(
                                text: 'العشاء ',
                                text2: prayerTime(
                                    DateFormat.jm().format(prayerTimes!.isha))),
                          ],
                        ),
                      ],
                    );
                  }
                  if (locationError != null) {
                    return Text(locationError!);
                  }
                  return const Text('Waiting for Your Location...');
                },
              )
            ],
          ),
        ),
      ),
      drawer: const NavigationDrawer(),
    );
  }

  Widget createPrayerBodyItem({
    required String text,
    required String text2,
  }) {
    String image;
    int titleColor;
    int subColor;
    if (text == formattedPrayerName(next!)) {
      image = 'assets/images/white_prayer.png';
      titleColor = 0xff3D5B67;
      subColor = 0xff566F79;
    } else {
      image = 'assets/images/gray_prayer.png';
      titleColor = 0xff4C646C;
      subColor = 0xff7A8B8E;
    }
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.31,
        height: MediaQuery.of(context).size.height * 0.175,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.bottomRight,
              height: MediaQuery.of(context).size.height * 0.11,
              width: MediaQuery.of(context).size.width * 0.22,
              child: TextScaleFactorClamper(
                  child: Text(text,
                      //
                      style: TextStyle(
                          color: Color(titleColor), //0xFF4C646C
                          fontSize: 17,
                          fontFamily: 'ArbFONTS'))),
            ),
            Container(
              alignment: Alignment.bottomRight,
              width: MediaQuery.of(context).size.width * 0.22,
              child: TextScaleFactorClamper(
                  child: Text(text2,
                      //
                      style: TextStyle(
                          color: Color(subColor), //0xFF7A8B8E
                          fontSize: 17,
                          fontFamily: 'ArbFONTS'))),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }

  String formattedPrayerName(Prayer prayer) {
    switch (prayer) {
      case Prayer.fajr:
        return "الفجر ";
      case Prayer.sunrise:
        return "الشروق ";
      case Prayer.dhuhr:
        return "الظهر ";
      case Prayer.asr:
        return "العصر ";
      case Prayer.maghrib:
        return "المغرب ";
      case Prayer.isha:
        return "العشاء ";
      case Prayer.none:
        return "not prayer";
    }
  }

  String prayerTime(String time) {
    late List<String> timeList = time.split(' ');
    String timeNum = AllDates.replaceEngNumber(timeList[0]);
    String timeChar = timeList[1] == 'AM' ? 'ص' : 'م';
    return timeNum + ' ' + timeChar;
  }

  String char() {
    if (next == Prayer.fajr || next == Prayer.sunrise) {
      return 'ص';
    } else {
      return 'م';
    }
  }
}
