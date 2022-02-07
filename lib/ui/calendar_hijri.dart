// ignore_for_file: prefer_const_constructors

import 'package:climate_calendar_new/ui/text_scale.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:hijri_picker/hijri_picker.dart';
import 'package:flutter/material.dart';

import '../dates.dart';
import '../main.dart';
import 'calendar.dart';

import 'nav_bar.dart';
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
    /*
     SfHijriDateRangePicker(
      //showTodayButton: true,
      //headerStyle: DateRangePickerViewHeaderStyle(TextStyle(color: Color(0xff4C7884)),),
      allowViewNavigation: true,
      todayHighlightColor: Color(0xff4C7884),//Color(0xff4C7884),
      selectionColor: Colors.white,
      selectionTextStyle: TextStyle(color: Color(0xff4C7884)),
      showNavigationArrow: true,
      //monthFormat: 'ar',
      view: HijriDatePickerView.month,
      monthViewSettings: HijriDatePickerMonthViewSettings(
        
        firstDayOfWeek: 6,
        //viewHeaderStyle:

    ),
    
    );
    */
    return Scaffold(
        body: SafeArea(
            top: false,
            bottom: false,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/ramadan.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
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
                            child: TextScaleFactorClamper(
                              child: Text(
                                AllDates.hday,
                                //textScaleFactor: 1.0,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    height: 1.3,
                                    fontFamily: 'ArbFONTS'),
                                //textAlign: TextAlign.right,
                              ),
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
                              //textScaleFactor: 1.0,
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
                              textScaleFactor: 1.0,
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
                          textScaleFactor: 1.0,
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
                            textScaleFactor: 1.0,
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
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Padding(padding: EdgeInsets.only(top: 20),
                            child: Text(
                              'هجري\n•',
                              textScaleFactor: 1.0,
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
                            onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Calendar(),
                          ),
                        );
                            },
                            child: Text(
                              'ميلادي',
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  color: Color(0xffAFAFAF),
                                  fontSize: 18,
                                  height: 1,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'ArbFONTS'),

                            )),
                        
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 40)),
                    SingleChildScrollView(
                        child: 
                        Stack(
                         alignment: Alignment.bottomCenter,
                         children:[
                          
                          Padding(padding: EdgeInsets.only(bottom: 10), //MediaQuery.of(context).textScaleFactor <= 1.3 ? 15: 
                        child:Image.asset('assets/images/cal_back.png', width: MediaQuery.of(context).size.width * 0.75, ),
                          ),
                        Container(
           //   decoration: BoxDecoration(
             //   image: DecorationImage(
              //    image: AssetImage('assets/images/cal_back.png'),
                  
                  //fit: BoxFit.fill,
                //),
              //),
                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                        child: _calendarCarousel,
                      ), 
                        ]),
                    ),
                  ]),
            )),
      bottomNavigationBar: NavigationBarBottom(4),
                  drawer: const navigationDrawer(),

            );
            
  }
}