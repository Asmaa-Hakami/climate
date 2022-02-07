import 'package:climate_calendar_new/ui/top_icons.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import '../dates.dart';
import '../main.dart';
import 'nav_bar.dart';
import 'navdraw.dart';
import 'text_scale.dart';

class Convert extends StatefulWidget {
  const Convert({Key? key}) : super(key: key);

  @override
  State<Convert> createState() => _ConvertState();
}

class _ConvertState extends State<Convert> {
  var dayController = TextEditingController();
  var monthController = TextEditingController();
  var yearController = TextEditingController();
  var gDate = HijriCalendar();
  var hDate = HijriCalendar();
  late DateTime toGdate = DateTime.now();
  late String newDay = '';
  late String newMonth = '';
  late String newYear = '';
  String originDate = '';
  String newDate = '';
  bool flagHijri = true;
  late String dayOfWeek = '';
  //String firstType = 'هجري';
  //String secondType = 'ميلادي';
  //late String temp;
  String image = 'assets/images/from_hijri.png';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/ramadan.png'),
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
                            Padding(
                  padding: EdgeInsets.only(
                      right: 20,
                      top: MediaQuery.of(context).size.height * 0.0),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const TextScaleFactorClamper(
                              child:Text('تحويل التاريخ',
                          //textScaleFactor: 1.0,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontFamily: 'ArbFONTS'))),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.07)),
                                    Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.fill,
                    ),
                  ),
                 child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                 GestureDetector(
                        onTap: () {
                          setState(() {
                            image = 'assets/images/from_hijri.png';
                          flagHijri = true;
                          dayOfWeek = '';
                          originDate = '';
                          newDate = '';
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.33,
                          height: MediaQuery.of(context).size.height * 0.06,
                          alignment: Alignment.center,
                          //padding: EdgeInsets.only(
                            //  right: MediaQuery.of(context).size.width * 0.2),
                          child:
                    const Text(
                      'هجري إلى ميلادي',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                          color: Color(0xff506B75),
                          fontSize: 15,
                          fontFamily: 'ArbFONTS'),
                    ),
                        )),

                        GestureDetector(
                        onTap: () {
                          setState(() {
                            image = 'assets/images/to_hijri.png';

                          flagHijri = false;
                          dayOfWeek = '';
                          originDate = '';
                          newDate = '';
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.33,
                          height: MediaQuery.of(context).size.height * 0.06,
                          alignment: Alignment.center,
                          //padding: EdgeInsets.only(
                            //  right: MediaQuery.of(context).size.width * 0.2),
                          child:
                    const Text(
                      'ميلادي إلى هجري',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                          color: Color(0xff506B75),
                          fontSize: 15,
                          fontFamily: 'ArbFONTS'),
                    )
                        )),
                  ],
              ),
                                    ),
                                    Padding(padding: EdgeInsets.only(top: 15)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    alignment: Alignment.center,
                  
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const TextScaleFactorClamper(
                              child:Text(
                        'اليـوم',
                       // textScaleFactor: 1.0,
                        style: TextStyle(
                            color: Color(0xff5D5C5D),
                            fontSize: 16,
                            height: 1.5,
                            fontFamily: 'ArbFONTS'),
                      )),
                      const TextScaleFactorClamper(
                              child:Text(
                        'الشهر',
                        //textScaleFactor: 1.0,
                        style: TextStyle(
                            color: Color(0xff5D5C5D),
                            fontSize: 16,
                            height: 2,
                            fontFamily: 'ArbFONTS'),
                      )),
                      const TextScaleFactorClamper(
                              child:Text(
                        'السنة',
                        //textScaleFactor: 1.0,
                        style: TextStyle(
                            color: Color(0xff5D5C5D),
                            fontSize: 16,
                            height: 1.5,
                            fontFamily: 'ArbFONTS'),
                      )),
                    ],
                  )),
                                    Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                                            Container(
                      
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.25,
                                decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/input_text_box.png'),
                fit: BoxFit.fill //fitHeight,
                ),
          ),
                        child: TextScaleFactorClamper(
                              child:TextFormField(
                          showCursor: true,
                          cursorColor: const Color(0xFF5D5C5D),
                          autocorrect: true,
                          autofocus: false,
                          decoration: const InputDecoration(
                            border: InputBorder.none),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          controller: dayController,
                        ),
                      )),
                      
                                            Container(
                      
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.25,
                                decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/input_text_box.png'),
                fit: BoxFit.fill //fitHeight,
                ),
          ),
                            child: TextScaleFactorClamper(
                              child:TextFormField(
                              showCursor: true,
                              cursorColor: const Color(0xff5D5C5D),
                              autocorrect: true,
                              autofocus: false,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: monthController,
                            )),
                      ),
                                            Container(
                      
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.25,
                                decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/input_text_box.png'),
                fit: BoxFit.fill //fitHeight,
                ),
          ),
                            child: TextScaleFactorClamper(
                              child:TextFormField(
                              showCursor: true,
                              cursorColor: const Color(0xff5D5C5D),
                              autocorrect: true,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: yearController,
                            )),
                          ),
                    ],
                                    )),
                ],
              ),

              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02)),
              // ignore: deprecated_member_use
              GestureDetector(
                onTap: () {
                  if (dayController.text != '' &&
                    monthController.text != '' &&
                   yearController.text != '') {
                  setState(() {
                    if (flagHijri == true) {
                      //
                      var _check_date = HijriCalendar();
                      _check_date.hYear = int.parse(yearController.text);
                      _check_date.hMonth = int.parse(monthController.text);
                      _check_date.hDay = int.parse(dayController.text);



                      try {
                        if (_check_date.isValid() &&
                            int.parse(yearController.text) < 1500 &&
                            int.parse(yearController.text) > 1356) //
                        {


                          toGdate = gDate.hijriToGregorian(
                              int.parse(yearController.text),
                              int.parse(monthController.text),
                              int.parse(dayController.text));

                          newDay = toGdate.day.toString();
                          newMonth = toGdate.month.toString();
                          newYear = toGdate.year.toString();

                                                  hDate = HijriCalendar.fromDate(DateTime(
                            int.parse(newYear.toString()),
                            int.parse(newMonth.toString()),
                            int.parse(newDay.toString())));

                    dayOfWeek = AllDates.replaceEngDay(hDate.dayWeName);


                          originDate = dayController.text +
                              '/' +
                              monthController.text +
                              '/' +
                              yearController.text;
                          newDate = newDay + '/' + newMonth + '/' + newYear;
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  _errorDialog('قم بإدخال تاريخ صحيح'));
                        }
                      } catch (e) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => _errorDialog('قم بإدخال تاريخ يح'));
                      }
                    } else {
                      try
                      {
                      if (isValidDate(
                              yearController.text.toString() + ' ' +
                              monthController.text.toString() + ' ' +
                              dayController.text.toString())) //
                      {
                        hDate = HijriCalendar.fromDate(DateTime(
                            int.parse(yearController.text),
                            int.parse(monthController.text),
                            int.parse(dayController.text)));
                    dayOfWeek = AllDates.replaceEngDay(hDate.dayWeName);

                        newDay = hDate.hDay.toString();
                        newMonth = hDate.hMonth.toString();
                        newYear = hDate.hYear.toString();
                        originDate = dayController.text +
                            '/' +
                            monthController.text +
                            '/' +
                            yearController.text;
                        newDate = newDay + '/' + newMonth + '/' + newYear;
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => _errorDialog('قم بإدخال تاريخ صحيح'));
                      }
                      }catch(e){
                                                showDialog(
                            context: context,
                            builder: (BuildContext context) => _errorDialog('قم بإدخال تاريخ صحيح'));
                      }
                    }

                    dayController.text = '';
                    monthController.text = '';
                    yearController.text = '';
                    
                  });
                   }else{
                                             showDialog(
                            context: context,
                            builder: (BuildContext context) => _errorDialog('قم بإدخال التاريخ'));
                   }
                  FocusManager.instance.primaryFocus?.unfocus();
                  // } //else {}
                  //convertResult(
                  //  day: 'newDay', month: 'newMonth', year: 'newYear');
                },
                                    child: Stack(
                      alignment: Alignment.center,
                      children:[
                        Image.asset('assets/images/convert_buttun.png', width: MediaQuery.of(context).size.width * 0.45),
                    const TextScaleFactorClamper(
                              child:Text(
                      "تحويل",
                      textScaleFactor: 1.0,
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          height: 1,
                          fontFamily: 'ArbFONTS'),
                    )),
                      ])
                  ),
              
            Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.3),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const TextScaleFactorClamper(
                              child: Text(
                      'اليوم: ',
                      //textScaleFactor: 1.0,
                      style: TextStyle(
                          color: Color(0xff5D5C5D),
                          height: 1.2,
                          fontSize: 16,
                          fontFamily: 'ArbFONTS'),
                    )),
                     TextScaleFactorClamper(
                              child:Text(
                      dayOfWeek,//hDate.dayWeName.toString(),
                      //textScaleFactor: 1.0,
                      style: const TextStyle(
                          color: Color(0xff4C7884),
                          height: 1.2,
                          fontSize: 20,
                          fontFamily: 'ArbFONTS'),
                     )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.3,
                    //top: MediaQuery.of(context).size.height * 0.0
                    ),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const TextScaleFactorClamper(
                              child:Text(
                      'هجري: ',
                      //textScaleFactor: 1.0,
                      style: TextStyle(
                          color: Color(0xff5D5C5D),
                          fontSize: 16,
                          height: 1.3,
                          fontFamily: 'ArbFONTS'),
                    )),
                    TextScaleFactorClamper(
                              child:Text(
                      flagHijri? originDate : newDate,
                      //textScaleFactor: 1.0,
                      style: const TextStyle(
                          color: Color(0xff4C7884),
                          height: 1.3,
                          fontSize: 20,
                          fontFamily: 'ArbFONTS'),
                    )),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.3),
                child: Row(
                  children: [
                    const TextScaleFactorClamper(
                              child:Text(
                      'ميلادي: ',
                      //textScaleFactor: 1.0,
                      style: TextStyle(
                          color: Color(0xff5D5C5D),
                          fontSize: 16,
                          height: 1.3,
                          fontFamily: 'ArbFONTS'),
                    )),
                    TextScaleFactorClamper(
                              child:Text(
                      flagHijri? newDate : originDate,
                      //textScaleFactor: 1.0,
                      style: const TextStyle(
                          color: Color(0xff4C7884),
                          fontSize: 20,
                          height: 1.3,
                          fontFamily: 'ArbFONTS'),
                    )),
                  ],
                ),
              ),

              //   convertResult(
              //  day: 'newDay', month: 'newMonth', year: 'newYear'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBarBottom(4),
      drawer: const navigationDrawer(),
    );
  }

  Widget _errorDialog(String error) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(0),
      title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Image.asset(
                  'assets/icons/close.png',
                  height: 20,
                ),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  //Navigator.pop(context);
                  //Navigator.of(context).pop();
                },
              ),
            ),
            Image.asset(
              'assets/icons/error.png',
              //alignment: Alignment.topCenter,
              height: 70,
            ),
            // ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Text(
                error,
                textScaleFactor: 1.0,
                style: const TextStyle(fontSize: 18, color: Color(0xff4C7884)),
                textAlign: TextAlign.center,
              ),
            ),
            // ]),
            // ),
          ]),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    );
  }

  Widget convertResult(
      {required String day, required String month, required String year}) {
    originDate = dayController.text +
        '/' +
        monthController.text +
        '/' +
        yearController.text;
    newDate = day + '/' + month + '/' + year;
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.3),
          child: Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                'هجري: ',
                textScaleFactor: 1.0,
                style: TextStyle(
                    color: Color(0xff5D5C5D),
                    fontSize: 16,
                    fontFamily: 'ArbFONTS'),
              ),
              Text(
                originDate,
                textScaleFactor: 1.0,
                style: const TextStyle(
                    color: Color(0xff4C7884),
                    fontSize: 20,
                    fontFamily: 'ArbFONTS'),
              ),
            ],
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.3),
          child: Row(
            children: [
              const Text(
                'ميلادي: ',
                textScaleFactor: 1.0,
                style: TextStyle(
                    color: Color(0xff5D5C5D),
                    fontSize: 16,
                    fontFamily: 'ArbFONTS'),
              ),
              Text(
                newDate,
                textScaleFactor: 1.0,
                style: const TextStyle(
                    color: Color(0xff4C7884),
                    fontSize: 20,
                    fontFamily: 'ArbFONTS'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  bool isValidDate(String input) {
    try {
     // final date = DateTime.parse(input);
     // final originalFormatString = toOriginalFormatString(date);
     // return input == originalFormatString;
      List date = input.split(' ');
      if( int.parse(date[1]) <= 12  && int.parse(date[2]) <= 31){ //date[0] > 1937 && date[0] < 2077 &&
      return true;
      }
     }catch (e) {
      return false;
    }
    return false;
  }

/*
  String toOriginalFormatString(DateTime dateTime) {
    final y = dateTime.year.toString().padLeft(4, '0');
    final m = dateTime.month.toString().padLeft(2, '0');
    final d = dateTime.day.toString().padLeft(2, '0');
    return "$y$m$d";
  }
  */
  
}
