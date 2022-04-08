import 'package:auto_route/auto_route.dart';
import 'package:climate_calendar_new/ui/text_scale.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:intl/intl.dart' show DateFormat;
import '../dates.dart';
import '../routes/ router.gr.dart';
import 'navdraw.dart';
import 'top_icons.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);
  @override
  _Calendar createState() => _Calendar();
}

class _Calendar extends State<Calendar> {
  final DateTime _currentDate = DateTime.now();
  var _targetDateTime = DateTime.now();
  String month = DateFormat('MM').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final _calendarCarousel = CalendarCarousel(
      showOnlyCurrentMonthDate: true,
      weekendTextStyle: const TextStyle(
          color: Color(0xff4C7884),
          fontFamily: 'ArbFONTS',
          fontSize:
              18 //MediaQuery.of(context).textScaleFactor > 1.2 ? 14 : 20,// * fontScale,
          ),
      headerMargin: const EdgeInsets.only(bottom: 25),
      thisMonthDayBorderColor: Colors.white,
      //weekDayMargin: const EdgeInsets.symmetric(horizontal: 10),
      customWeekDayBuilder: (weekday, weekdayName) => weekDayNames(weekday),
      firstDayOfWeek: 0,
      //markedDatesMap: _markedDateMap,
      height: 420.0,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: const NeverScrollableScrollPhysics(),

      headerText: AllDates.replaceToEngMonth(
              DateFormat('MMM').format(_targetDateTime)) +
          ' ' +
          _targetDateTime.year.toString(),

      headerTextStyle: const TextStyle(
          color: Color(0xff4C7884), fontSize: 20, fontFamily: 'ArbFONTS'),

      iconColor: Colors.black,
      todayTextStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'ArbFONTS',
        fontSize: 18,
        letterSpacing: -1,
      ),
      daysTextStyle: const TextStyle(
          color: Color(0xff4C7884),
          fontFamily: 'ArbFONTS',
          letterSpacing: -1,
          fontSize: 18),

      todayButtonColor: const Color(0xff4C7884),
      selectedDayTextStyle: const TextStyle(
        color: Colors.white,
      ),
      minSelectedDate: _currentDate.subtract(const Duration(days: 360)),
      maxSelectedDate: _currentDate.add(const Duration(days: 360)),

      onCalendarChanged: (DateTime date) {
        setState(() {
          _targetDateTime = date;
        });
      },
      //weekDayFormat: arShortWdNames< (1 2 3),('w','1','1')>,
    );
    return Scaffold(
      body: SafeArea(
          top: false,
          bottom: false,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:
                    NetworkImage('https://i.postimg.cc/qqdPg7tr/ramadan.png'),
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
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
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
                              child: Text(
                                  AllDates.hdate +
                                      ' ' +
                                      AllDates.hMonth +
                                      '، ' +
                                      AllDates.hYear,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: 'ArbFONTS'),
                                  textAlign: TextAlign.left),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              alignment: Alignment.centerRight,
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Padding(padding: EdgeInsets.only(right: 20)),
                      const Text(
                        'التقويم',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            height: 2,
                            fontFamily: 'ArbFONTS'),
                      ),
                      const Padding(
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
                          onPressed: () => context.pushRoute(
                                const CalendarHijri(),
                              ),
                          child: const Text(
                            'هجري',
                             
                            style: TextStyle(
                                color: Color(0xffAFAFAF),
                                fontSize: 18,
                                height: 1,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'ArbFONTS'),
                          )),
                      TextButton(
                        onPressed: () {},
                        child: const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              'ميلادي\n•',
                               
                              style: TextStyle(
                                  color: Color(0xff4C7884),
                                  fontSize: 18,
                                  height: 1,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'ArbFONTS'),
                              textAlign: TextAlign.center,
                            )),
                      ),
                    ],
                  ),
                  //const Padding(padding: EdgeInsets.only(bottom: 10)),
                  SingleChildScrollView(
                    child: Stack(alignment: Alignment.bottomCenter, children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 30),
                        child: Image.asset('assets/images/cal_back.png',
                            width: MediaQuery.of(context).size.width * 0.75),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40.0),
                        width: MediaQuery.of(context).size.width * 0.75,
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

  Widget weekDayNames(int weekday) {
    return SizedBox(
        child: Row(children: [
      if (weekday == 0)
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.1,
          child: const Text(
            'ح',
            style: TextStyle(fontSize: 16),
          ),
        ),
      if (weekday == 1)
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.1,
          child: const Text(
            'ن',
            style: TextStyle(fontSize: 16),
          ),
        ),
      if (weekday == 2)
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.1,
          child: const Text(
            'ث',
            style: TextStyle(fontSize: 16),
          ),
        ),
      if (weekday == 3)
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.1,
          child: const Text(
            'ر',
            style: TextStyle(fontSize: 16),
          ),
        ),
      if (weekday == 4)
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.1,
          child: const Text(
            'خ',
            style: TextStyle(fontSize: 16),
          ),
        ),
      if (weekday == 5)
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.1,
          child: const Text(
            'ج',
            style: TextStyle(fontSize: 16),
          ),
        ),
      if (weekday == 6)
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.1,
          child: const Text(
            'س',
            style: TextStyle(fontSize: 16),
          ),
        ),
    ]));
  }
}
