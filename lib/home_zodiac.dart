import 'package:climate_calendar_new/main.dart';
import 'package:climate_calendar_new/ui/nav_bar.dart';
import 'package:flutter/material.dart';

import 'all_data.dart';
import 'data/zodiacs/zodiacs_data.dart';
import 'ui/navdraw.dart';
import 'ui/text_scale.dart';
import 'ui/top_icons.dart';
import 'ui/zodiac_info.dart';

class HomeZodiac extends StatefulWidget {
  const HomeZodiac({Key? key}) : super(key: key);
  @override
  _HomeZodiac createState() => _HomeZodiac();
}

class _HomeZodiac extends State<HomeZodiac> {
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
                image: AssetImage('assets/images/months_back.png'),
                fit: BoxFit.fill),
          ),
          child: Column(
            children: <Widget>[
              TopIconsWhite(context, 1),
              Row(
                  //padding: EdgeInsets.only(
                  //height: MediaQuery.of(context).size.height * 0.04,
                  //width: MediaQuery.of(context).size.width * 0.9,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Padding(padding: EdgeInsets.only(right: 15)),
                    const TextScaleFactorClamper(
                              child: Text('المواسم',
                        //textScaleFactor: 1.0,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            height: 1.3,
                            fontFamily: 'ArbFONTS'))),
                  ]),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.04),
                  itemCount: ZodiacsData.zodiacData.length,
                  itemBuilder: (BuildContext context, int index) {
                    String image;
                    String now = '';
                    if (AllData.nowZodiac[2].contains(index)) {
                      image = AllData.nowSeason[0] == 'الصيف'
                          ? 'assets/images/zodiac_summer.png'
                          : AllData.nowSeason[0] == 'الخريف'
                              ? 'assets/images/zodiac_automn.png'
                              : AllData.nowSeason[0] == 'الشتاء'
                                  ? 'assets/images/zodiac_winter.png'
                                  : 'assets/images/zodiac_spring.png';
                      now = 'الموسم الحالي';
                    } else {
                      image = 'assets/images/zodiac_white.png';
                    }
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ZodiacInfo(index)));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.14,
                        //width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(image), fit: BoxFit.fill),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                //padding: EdgeInsets.only( right: MediaQuery.of(context).size.width * 0.05),
                                width: MediaQuery.of(context).size.width * 0.22,
                                alignment: Alignment.center,
                            child:TextScaleFactorClamper(
                              child: Text(
                              '${AllData.getZWhen(index).split(' ')[0]}\n${AllData.getZWhen(index).split(' ')[1]} ${AllData.getZWhen(index).split(' ')[2]}',
                              //textScaleFactor: 1.0,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 13),
                              textAlign: TextAlign.center,
                            ))),
                            Container(
                              padding: EdgeInsets.only(right: 25),
                                width: MediaQuery.of(context).size.width * 0.53,
                                height: MediaQuery.of(context).size.height * 0.08, //8
                                alignment: Alignment.centerRight,
                                child: Column(
                                  children: [
                                    TextScaleFactorClamper(
                              child: Text(
                                      now,
                                      //textScaleFactor: 1.0,
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.white),
                                      textAlign: TextAlign.right,
                                    )),
                                    TextScaleFactorClamper(
                              child: Text(
                                        'موسم ${ZodiacsData.zodiacData[index][0]}',
                                        //textScaleFactor: 1.0,
                                        style: const TextStyle(
                                            color: Color(0xFF3A6978),
                                            fontSize: 17,
                                            height: 1.3),
                                        textAlign: TextAlign.right)),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.15,
                            )),
                            const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Color(0xff506B75),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBarBottom(2),
      drawer: const navigationDrawer(),
    );
  }
}
