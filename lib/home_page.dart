import 'package:climate_calendar_new/seasons/season.dart';
import 'package:climate_calendar_new/ui/nav_bar.dart';
import 'package:climate_calendar_new/ui/top_icons.dart';
import 'package:flutter/material.dart';
//import 'package:location/location.dart';
import 'all_data.dart';
import 'all_notifications.dart';
import 'dates.dart';
import 'get_location.dart';
import 'months/month.dart';
import 'ui/navdraw.dart';
import 'ui/text_scale.dart';
import 'ui/zodiac_info.dart';

class HomePage extends StatefulWidget {
  //List nowStatus;
  const HomePage( {Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime mToday = DateTime.now();
  String? locationError;
  String temp = '';
  static String yourCityName = '';
  //final location = Location(); 

  //late List nowStatus = widget.nowStatus;
       late List nowStatus = AllData.getNowStatus(DateTime(
      mToday.year,
      mToday.month,
      mToday.day)); 
  //(DateFormat('MM-dd').format(now));//DateFormat('mm-dd').format(DateTime(mToday.month, mToday.day));
/*
  @override
  void initState() {
    print(' null null');
    getLocationData().then((locationData) {
                print(' null');

      if (!mounted) {
        return;
      }
      if (locationData != null) {
        setState(() {
          print('not null');
        yourCityName =  add.first.locality.toString();
        temp =  ' ْ' + (w!.temperature!.celsius!.toInt()).toString();

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
/*
  Future<void> data() async {
        //getLocationData().then((value) { yourCityName =  add.first.locality.toString();
        //temp =  ' ْ' + (w!.temperature!.celsius!.toInt()).toString();});


       LocationData? locationData = await getLocationData();  
       print('object');
        yourCityName =  add.first.locality.toString();
      temp =  ' ْ' + (w!.temperature!.celsius!.toInt()).toString();
      
  }
  */
  
  @override
  Widget build(BuildContext context) {

      //data();
            yourCityName =  add.first.locality.toString();
        temp =  ' ْ' + (w!.temperature!.celsius!.toInt()).toString();
    //getLocationData().then((value) { yourCityName =  add.first.locality.toString();
      //  temp =  ' ْ' + (w!.temperature!.celsius!.toInt()).toString();});


    AllNotifications.appNotifications();  

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: false,
        bottom: false,
        // child:             Flexible(
        //      child: SingleChildScrollView(
        //       scrollDirection: Axis.vertical,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/home_back.png'),
                fit: BoxFit.fill //fitHeight,
                ),
          ),
          // child:             Flexible(
          //      child: SingleChildScrollView(
          //       scrollDirection: Axis.vertical,
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TopIconsWhite(context, 1),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(padding: EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.5,
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
                          width: MediaQuery.of(context).size.width * 0.5,
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
                          width: MediaQuery.of(context).size.width * 0.5,
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
 //##################################/############المدينة######################/##################################
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      //alignment: Alignment.topLeft,
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                     TextScaleFactorClamper(
                              child: Text(
                      AllDates.replaceEngNumber(temp),
                      //textScaleFactor: 1.0,
                      style: const TextStyle(color: Colors.white, fontSize: 23),
                    )),
                    TextScaleFactorClamper(
                              child: Text(' $yourCityName',  //'المدينة المنورة',//
                              //textScaleFactor: 1.0,
                        style:  const TextStyle(
                            color: Colors.white, overflow: TextOverflow.ellipsis , fontSize: 15, height: 2.5)),
                    ),
                    ],)
                    ),

                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Season(
                                    nowStatus[0][2],
                                    nowStatus[0][0],
                                    'مضى ' +
                                        AllDates.replaceEngNumber(nowStatus[0][1]) +
                                        ' يوم')), //nowStatus[0][1]
                          );
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/home_season_rec.png',
                              width: MediaQuery.of(context).size.width * 0.9,
                              fit: BoxFit.fill,
                            ),
                            //  ),
                            Padding(
                              //width: MediaQuery.of(context).size.width * 0.1,
                              padding: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.04),
                              child: Column(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                                      TextScaleFactorClamper(
                              child:
                                  Text('فصل ${nowStatus[0][0]}',
                                      //textScaleFactor: 1.0,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          //height: 1.5,
                                          fontFamily: 'ArbFONTS'))),
                                                              TextScaleFactorClamper(
                              child: Text('مضى منه ' + AllDates.replaceEngNumber(nowStatus[0][1]) + ' يوم\n',
                                      //textScaleFactor: 1.0,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          //height: 1.5,
                                          fontFamily: 'ArbFONTS'))),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Month(AllDates.mMonth, AllDates.mnum - 1)),
                          );
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/images/home_month_rec.png',
                              width: MediaQuery.of(context).size.width * 0.9,
                              fit: BoxFit.fill,
                            ),
                            // ),
                            Padding(
                              //width: MediaQuery.of(context).size.width * 0.25,
                              //alignment: Alignment.center,
                              padding: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.04),
                              child: Column(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                                      TextScaleFactorClamper(
                              child:Text('شهر ${AllDates.mMonth}',
                                      //textScaleFactor: 1.0,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: 'ArbFONTS'))),
                                                      TextScaleFactorClamper(
                              child:Text(
                                      'مضى منه ' +
                                          AllDates.replaceEngNumber((mToday.day).toString()) +
                                          ' يوم\n',
                                      //textScaleFactor: 1.0,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontFamily: 'ArbFONTS'))),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                _buildPopupDialog(context,
                                    AllData.tawalea[nowStatus[2][2] - 1]),
                          );
                        },
                        child: Stack(alignment: Alignment.center, children: [
                          Image.asset(
                            'assets/images/home_talea_rec.png',
                            width: MediaQuery.of(context).size.width * 0.9,
                            fit: BoxFit.fill,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * 0.04),
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                                    TextScaleFactorClamper(
                              child:Text('طالع ${nowStatus[2][0]}',
                                    //textScaleFactor: 1.0,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'ArbFONTS'))),
                                TextScaleFactorClamper(
                              child:Text(
                                  'مضى منه ' + nowStatus[2][1] + ' يوم\n',
                                  //textScaleFactor: 1.0,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontFamily: 'ArbFONTS'),
                                )),
                              ],
                            ),
                          ),
                        ]),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.1),
                        child: Row(
                          children: const [
                            TextScaleFactorClamper(
                              child:Text(
                              'الموسم الحالي',
                              //textScaleFactor: 1.0,
                              style: TextStyle(
                                  color: Color(0xFF4F707E),
                                  fontSize: 15,
                                  fontFamily: 'ArbFONTS'),
                            ))
                          ],
                        ),
                      ),

                      if (nowStatus[1][0].length == 1) // &&  nowStatus[1][0][0] != nowStatus[1][0][1]
                        _zodiac(
                          0,
                          Image.asset(
                            'assets/images/one_season.png',
                            width: MediaQuery.of(context).size.width * 0.9,
                            fit: BoxFit.fill,
                          ),
                        ),
                      if (nowStatus[1][0].length == 2)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //Padding(padding: EdgeInsets.only( right: MediaQuery.of(context).size.width * 0.1,)),
                            _zodiac(
                              0,
                              Image.asset(
                                'assets/images/two_season.png',
                                width:
                                    MediaQuery.of(context).size.width * 0.415,
                                // height:  MediaQuery.of(context).size.height * 0.1,
                                //fit: BoxFit.fill,
                              ),
                            ),
                            _zodiac(
                              1,
                              Image.asset(
                                'assets/images/two_season.png',
                                width:
                                    MediaQuery.of(context).size.width * 0.415,
                                // height:  MediaQuery.of(context).size.height * 0.1,
                                //fit: BoxFit.fitHeight,
                              ),
                            )
                          ],
                        ),
                      if (nowStatus[1][0].length > 2)
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //const Padding(
                                //  padding: EdgeInsets.only(right: 10)),
                                _zodiac(
                                  0,
                                  Image.asset(
                                    'assets/images/three_season.png',
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    // height:  MediaQuery.of(context).size.height * 0.12,

                                    //fit: BoxFit.fitHeight,
                                  ),
                                ),
                                _zodiac(
                                  1,
                                  Image.asset(
                                    'assets/images/three_season.png',
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                  ),
                                ),
                                _zodiac(
                                  2,
                                  Image.asset(
                                    'assets/images/three_season.png',
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    //  height:  MediaQuery.of(context).size.height * 0.12,
                                    //  fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ],
                            ),
                            if (nowStatus[1][0].length == 4)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Padding(
                                      padding: EdgeInsets.only(right: 20)),
                                  _zodiac(
                                    3,
                                    Image.asset(
                                      'assets/images/three_season.png',
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      //   height:  MediaQuery.of(context).size.height * 0.12,
                                      //fit: BoxFit.fitHeight,
                                    ),
                                  )
                                ],
                              ),
                          ])
                    ])
              ]),
        ),
      ),
      bottomNavigationBar: NavigationBarBottom(0),
      drawer: const navigationDrawer(),
    );
  }

  Widget _zodiac(int index, Image image) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ZodiacInfo(nowStatus[1][2][index])),
        );
      },
      child: Stack(alignment: Alignment.center, children: [
        image,
        Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
                                        TextScaleFactorClamper(
                              child:Text(
              nowStatus[1][0][index],
              //textScaleFactor: 1.0,
              style: const TextStyle(
                  color: Color(0xFFFEFEFE),
                  fontFamily: 'ArbFONTS',
                  fontSize: 17),
            )),
                                        TextScaleFactorClamper(
                              child:Text('مضى منه ' + nowStatus[1][1][index] + ' يوم',
                //textScaleFactor: 1.0,
                style: const TextStyle(
                    fontSize: 10, color: Colors.white, fontFamily: 'ArbFONTS'))),
          ],
        ),
      ]),
    );
  }

  Widget _buildPopupDialog(BuildContext context, List tawalea) {
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
                Navigator.of(context).pop();
              },
            ),
          ),
          Center(
              child: Column(
            children: [
              TextScaleFactorClamper(
                              child:Text(
                tawalea[0],
                //textScaleFactor: 1.0,
                style: const TextStyle(
                    fontSize: 18.0,
                    color: Color(0xff506B75),
                    fontWeight: FontWeight.bold,
                    height: 0.8,
                    fontFamily: 'ArbFONTS'),
              )),
              const SizedBox(
                height: 17,
                width: 200,
                child: Image(image: AssetImage('assets/icons/line.png')),
              ),
            ],
          )),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextScaleFactorClamper(
                              child:Text(
                  ' ${tawalea[1]} ',
                //textScaleFactor: 1.0,
                style: const TextStyle(
                    fontSize: 20.0,
                    height: 1.0,
                    color: Color(0xff506B75),
                    fontFamily: 'ArbFONTS'),
              )),
              Container(
                width: 90,
                alignment: Alignment.centerRight,
                child: const TextScaleFactorClamper(
                              child:Text(
                ":وقت الدخول",
                //textScaleFactor: 1.0,
                style: TextStyle(
                    fontSize: 15.0,
                    height: 1.0,
                    color: Color(0xff506B75),
                    fontFamily: 'ArbFONTS'),
              )),),

            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01, bottom: 20, left: 10), //right: tawalea[0].length.toDouble() + 22
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                TextScaleFactorClamper(
                              child:Text(
                  ' ${tawalea[2]}',
                  //textScaleFactor: 1.0,
                  style: const TextStyle(
                      fontSize: 20.0,
                      height: 2,
                      color: Color(0xff506B75),
                      fontFamily: 'ArbFONTS'),
                )),
                              Container(
                width: 90,
                alignment: Alignment.centerRight,
                                child: const TextScaleFactorClamper(
                              child:Text(
                  ":عدد الأيام",
                  //textScaleFactor: 1.0,
                  style: TextStyle(
                      fontSize: 15.0,
                      height: 2,
                      color: Color(0xff506B75),
                      fontFamily: 'ArbFONTS'),
                              )),)
              ],
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    );
  }
}
