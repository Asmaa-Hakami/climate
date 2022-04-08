// ignore_for_file: prefer_const_constructors

import 'package:auto_route/auto_route.dart';
import 'package:climate_calendar_new/ui/text_scale.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:hijri_picker/hijri_picker.dart';
import 'package:flutter/material.dart';
import '../dates.dart';

import '../routes/ router.gr.dart';
import 'navdraw.dart';
import 'top_icons.dart';


class CalendarHijri extends StatefulWidget {
  const CalendarHijri({Key? key}) : super(key: key);
  @override
  _CalendarHijri createState() => _CalendarHijri();
}

class _CalendarHijri extends State<CalendarHijri> {
  HijriCalendar selectedDate = HijriCalendar.now();
  @override
  void initState() {
    HijriCalendar.setLocal('ar');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _calendarCarousel = HijriMonthPicker(
                lastDate: HijriCalendar()
                  ..hYear = 1445
                  ..hMonth = 9
                  ..hDay = 25,
                firstDate: HijriCalendar()
                  ..hYear = 1438
                  ..hMonth = 12
                  ..hDay = 25,
                onChanged: (HijriCalendar value) {
                  setState(() {
                    //selectedDate = selectedDate;
                  });
                },
                
                selectedDate: HijriCalendar.now(),
                
              );
    return Scaffold(
        body: SafeArea(
            top: false,
            bottom: false,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://i.postimg.cc/qqdPg7tr/ramadan.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                  children: [
                    TopIconsWhite(context, 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(padding: EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            alignment: Alignment.centerRight,
                            child: Text(
                                AllDates.hday,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    height: 1.3,
                                    fontFamily: 'ArbFONTS'),
                            )),
                        Container(
                          alignment: Alignment.centerRight,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: TextScaleFactorClamper(
                              child: Text(
                              AllDates.hdate +
                                  ' ' +
                                  AllDates.hMonth +
                                  '، ' +
                                  AllDates.hYear,
                              // 
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'ArbFONTS'),
                              textAlign: TextAlign.left),
                        )),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          alignment: Alignment.centerRight,
                          child: TextScaleFactorClamper(
                              child: Text(
                              AllDates.mDate +
                                  ' ' +
                                  AllDates.mMonth +
                                  '، ' +
                                  AllDates.mYear,
                               
                              style: const TextStyle(
                                  color: Colors.white,
                                  height: 1.5,
                                  fontSize: 15,
                                  fontFamily: 'ArbFONTS')),
                        )),
                      ],
                    ),
                    ),
                ],
              ),
                                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                    const Padding(padding: EdgeInsets.only(right: 20)),
                        Text(
                          'التقويم',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              height: 2,
                              fontFamily: 'ArbFONTS'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 12),
                          child: Text(
                            ' هجري-ميلادي',
                            style: TextStyle(
                                color: Color(0xFFD4E0E2),
                                fontSize: 20,
                                height: 2,
                                fontFamily: 'ArbFONTS'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Padding(padding: EdgeInsets.only(top: 20),
                            child: Text(
                              'هجري\n•',
                              style: TextStyle(
                                  color: Color(0xff3D5B67),
                                  fontSize: 18,
                                  height: 1,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'ArbFONTS'),
                                  textAlign: TextAlign.center,
                            )),
                        ),
                        TextButton(
                            onPressed: () =>  context.pushRoute(Calendar()),
                            child: Text(
                              'ميلادي',
                              style: TextStyle(
                                  color: Color(0xffAFAFAF),
                                  fontSize: 18,
                                  height: 1,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'ArbFONTS'),

                            )),
                        
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    SingleChildScrollView(
                        child: 
                        Stack(
                         alignment: Alignment.bottomCenter,
                         children:[
                          Padding(padding: EdgeInsets.only(bottom: 30), 
                        child:Image.asset('assets/images/cal_back.png', width: MediaQuery.of(context).size.width * 0.75, ),
                          ),
                        Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                      height: 350,
                        child: _calendarCarousel,
                      ), 
                        ]),
                    ),
                  ]),
            )),
                  drawer: const NavigationDrawer(),

            );
            
  }
}