import 'package:climate_calendar_new/ui/top_icons.dart';
import 'package:flutter/material.dart';
import '../dates.dart';
import '../main.dart';
import 'nav_bar.dart';
import 'navdraw.dart';
import 'text_scale.dart';

class Ramadan extends StatefulWidget {
  //State<AboutApp>{//
  const Ramadan({Key? key}) : super(key: key);

  @override
  State<Ramadan> createState() => _RamadanState();
}

class _RamadanState extends State<Ramadan> {
  var myController = TextEditingController(text: '');
  late String alldate;
  late List<String> dateList = ['', ''];
  late List<String> ramadanDateList = ['', '', '', ''];
  late List<String> eidDateList = ['', '', '', ''];

  String ramadanDate = '';
  String eidDate = '';
  //String date = '';
  String eidSeason = '';
  String ramadanSeason = '';
  String year = '';

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
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TopIconsWhite(context, 1),
              //Column(
                //children: [
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
                  children:[
Padding(
padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05),
  child:                    const Text(
                      'شهر رمضان فلكيًا',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'ArbFONTS'),
                    ),
),
                  ]),
                  
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.06),
                    child: const TextScaleFactorClamper(
                              child:Text(
                      'قم بإدخال العام', //############################## change to variable year of this year to 1480.
                      //textScaleFactor: 1.0,
                      style: TextStyle(
                          color: Color(0xFF5D5C5D),
                          fontSize: 20,
                          fontFamily: 'ArbFONTS'),
                      textAlign: TextAlign.center,
                    )),
                  ),
                  const TextScaleFactorClamper(
                              child:Text('١٤٤٣-١٤٨٠',
                  //textScaleFactor: 1.0,
                      style: TextStyle(
                          color: Color(0xFF5D5C5D),
                          fontSize: 16,
                          fontFamily: 'ArbFONTS'),
                      textAlign: TextAlign.center)),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: Container(
                      
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.6,
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
                          controller: myController,
                        ),
                    )),
                    ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.03)),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (myController.text != '') {
                          if (int.parse(myController.text) >= 1443 &&
                              int.parse(myController.text) <= 1480) {
                            year = myController.text;
                            alldate = yearToDay[myController.text]!;
                            dateList = alldate.split('-');
                            //day = dateList[0];
                            ramadanDateList = dateList[0].split(' ');
                            eidDate = dateList[1];
                            ramadanDate = ramadanDateList[0] + ' ' + ramadanDateList[1] + ' ' + ramadanDateList[2];
                            ramadanSeason = ramadanDateList[3];

                            eidDateList = dateList[1].split(' ');
                            eidDate = eidDateList[0] + ' ' + eidDateList[1] + ' ' + eidDateList[2];
                            eidSeason = eidDateList[3];

                            //alldate
                            //myController.text = '';
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                titlePadding: const EdgeInsets.all(0),
                                title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                          icon: Image.asset(
                                            'assets/icons/close.png',
                                            height: 20,
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ),
                                      Image.asset(
                                            'assets/icons/error.png',
                                            //alignment: Alignment.topCenter,
                                            height: 70,
                                          ),
                                     // ),
                                       const Padding(
                                         padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),   
                                      child: Text(
                                        'قم بإدخال سنة من ١٤٤٣ - ١٤٨٠',
                                        textScaleFactor: 1.0,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xff4C7884)),
                                            textAlign: TextAlign.center,
                                      ),
                                       ),
                                      // ]),
                                      // ),
                                    ]),
                                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                              ),
                            );
                          }
                        } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                              titlePadding: const EdgeInsets.all(0),
                                title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                          icon: Image.asset(
                                            'assets/icons/close.png',
                                            height: 20,
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ),
                                      Image.asset(
                                            'assets/icons/error.png',
                                            //alignment: Alignment.topCenter,
                                            height: 70,
                                          ),
                                     // ),
                                       const Padding(
                                         padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),   
                                      child: Text(
                                        'قم بإدخال السنة',
                                        textScaleFactor: 1.0,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xff4C7884)),
                                            textAlign: TextAlign.center,
                                      ),
                                       ),
                                      // ]),
                                      // ),
                                    ]),
                                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                              ),
                            );
                        }
                      });
                      //FocusManager.instance.primaryFocus;
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children:[
                        Image.asset('assets/images/search.png', width: MediaQuery.of(context).size.width * 0.35),
                    const Text(
                      "ابحث",
                      textScaleFactor: 1.0,
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontFamily: 'ArbFONTS'),
                    ),
                      ])
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02)),
                                            Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextScaleFactorClamper(
                              child:Text('العام:  ',
                      //textScaleFactor: 1.0,
                          style: TextStyle(
                              color: Color(0xFF5D5C5D),
                              fontSize: 16,
                              height: 1.3))),
                      TextScaleFactorClamper(
                              child:Text(
                        year,
                        style: const TextStyle(height: 1, fontSize: 18, color: Color(0xFF506B75)),
                      )),
                    ],
                  ),

                  const TextScaleFactorClamper(
                              child:Text(
                    'دخول شهر رمضان',
                    //textScaleFactor: 1.0,
                    style: TextStyle(
                      color: Color(0xFF5D5C5D),
                      fontSize: 20,
                      //height: 1.5,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ArbFONTS',
                              )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextScaleFactorClamper(
                              child:Text('التاريخ:  \nالفصل:  ',
                      //textScaleFactor: 1.0,
                          style: TextStyle(
                              color: Color(0xFF5D5C5D),
                              fontSize: 16,
                              height: 1.3))),
                      TextScaleFactorClamper(
                              child:Text(
                        AllDates.replaceEngNumber(ramadanDate) + '\n ' + ramadanSeason,
                        style: const TextStyle(height: 1, fontSize: 18, color: Color(0xFF506B75)),
                      )),
                    ],
                  ),

                                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01)),
                  const TextScaleFactorClamper(
                              child:Text(
                    'دخول عيد الفطر',
                    //textScaleFactor: 1.0,
                    style: TextStyle(
                      color: Color(0xFF5D5C5D),
                      fontSize: 20,
                       height: 1.5,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ArbFONTS',
                              )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextScaleFactorClamper(
                              child:Text('التاريخ:  \nالفصل:  ',
                      //textScaleFactor: 1.0,
                          style: TextStyle(
                              color: Color(0xFF5D5C5D),
                              fontSize: 16,
                              height: 1.3))),
                      TextScaleFactorClamper(
                              child:Text(
                        AllDates.replaceEngNumber(eidDate) + '\n ' + eidSeason,
                        style: const TextStyle(height: 1, fontSize: 18, color: Color(0xFF506B75)),
                      )),
                    ],
                  ),
                ],
              ),
           // ],),
        ),
      ),
      bottomNavigationBar: NavigationBarBottom(4),
      drawer: const navigationDrawer(),
    );
  }

  late final yearToDay = {
    '1443': 'الأحد 3 أبريل الربيع-الثلاثاء 3 مايو الربيع',
    '1444': 'الخميس 23 مارس الربيع-السبت 22 ابريل الربيع',
    '1445': 'الاثنين 11 مارس الربيع-الأربعاء 10 ابريل الربيع',
    '1446': 'السبت 1 مارس الربيع-الاثنين 31 مارس الربيع',
    '1447': 'الأربعاء 18 فبراير الشتاء-الجمعة 20 مارس الربيع',
    '1448': 'الاثنين 8 فبراير الشتاء-الأربعاء 10 مارس الربيع',
    '1449': 'الجمعة 28 يناير الشتاء-الاحد 27 فبراير الشتاء',
    '1450': 'الثلاثاء 16 يناير الشتاء-الخميس 15 فبراير الشتاء',
    '1451': 'الاحد 6 يناير الشتاء-الثلاثاء 5 فبراير الشتاء',
    '1452': 'الخميس 26 ديسمبر الشتاء-السبت 25 يناير الشتاء',
    '1453': 'الاثنين 15 ديسمبر الشتاء-الأربعاء 14 يناير الشتاء',
    '1454': 'السبت 4 ديسمبر الشتاء-الاثنين 3 يناير الشتاء',
    '1455': 'الأربعاء 23 نوفمبر الشتاء-الجمعة 23 ديسمبر الشتاء',
    '1456': 'الاحد 12 نوفمبر الخريف-الثلاثاء 12 ديسمبر الشتاء',
    '1457': 'الجمعة 2 نوفمبر الخريف-الاحد 2 ديسمبر الشتاء',
    '1458': 'الثلاثاء 21 أكتوبر الخريف-الخميس 20 نوفمبر الخريف',
    '1459': 'الأحد 11 أكتوبر الخريف-الثلاثاء 10 نوفمبر الخريف',
    '1460': 'الخميس 30سبتمبر الخريف-السبت 30 أكتوبر الخريف',
    '1461': 'الاثنين 19 سبتمبر الخريف-الأربعاء 19 أكتوبر الخريف',
    '1462': 'السبت 8 سبتمبر الصيف-الاثنين 8 أكتوبر الخريف',
    '1463': 'الأربعاء 28 أغسطس الصيف-الجمعة 27 سبتمبر الخريف',
    '1464': 'الاحد 17 أغسطس الصيف-الثلاثاء 16 سبتمبر الصيف',
    '1465': 'الجمعة 7 أغسطس الصيف-الأحد 6 سبتمبر الصيف',
    '1466': 'الثلاثاء 26 يوليو الصيف-الخميس 25 أغسطس الصيف',
    '1467': 'الاحد 16 يوليو الصيف-الثلاثاء 15 أغسطس الصيف',
    '1468': 'الخميس 5 يوليو الصيف-السبت 4 أغسطس الصيف',
    '1469': 'الاثنين 24 يونيو الصيف-الأربعاء 24 يوليو الصيف',
    '1470': 'السبت 13 يونيو الصيف-الاثنين 13 يوليو الصيف',
    '1471': 'الأربعاء 2 يونيو الصيف-الجمعة 2 يوليو الصيف',
    '1472': 'الاحد 22 مايو الصيف-الثلاثاء 21 يونيو الصيف',
    '1473': 'الجمعة 12 مايو الصيف-الاحد 11 يونيو الصيف',
    '1474': 'الثلاثاء 30 أبريل الربيع-الخميس 30 مايو الصيف',
    '1475': 'السبت 19 أبريل الربيع-الاثنين 19 مايو الصيف',
    '1476': 'الخميس 9 أبريل الربيع-السبت 9مايو الربيع',
    '1477': 'الاثنين 29 مارس الربيع-الأربعاء 28 أبريل الربيع',
    '1478': 'السبت 18 مارس الربيع-الاثنين 17 ابريل الربيع',
    '1479': 'الأربعاء 7 مارس الربيع-الجمعة 6 أبريل الربيع',
    '1480': 'الاحد 24 فبراير الشتاء-الثلاثاء 26 مارس الربيع'
  };
}
