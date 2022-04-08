// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:climate_calendar_new/data/months/months_data.dart';
import 'package:climate_calendar_new/ui/navdraw.dart';
import 'package:climate_calendar_new/ui/text_scale.dart';
import 'package:climate_calendar_new/ui/top_icons.dart';
import 'package:flutter/material.dart';
import '../all_data.dart';
import '../dates.dart';
import '../routes/ router.gr.dart';

// ignore: must_be_immutable
class Month extends StatefulWidget {
  String mname;
  int mnum;
  Month(this.mname, @PathParam() this.mnum, {Key? key}) : super(key: key);
  @override
  _Month createState() => _Month();
}

class _Month extends State<Month> {
  late String mSeason =
      MonthsData().monthInfo[widget.mnum][1].runtimeType == String
          ? MonthsData().monthInfo[widget.mnum][1]
          : MonthsData().monthInfo[widget.mnum][1][0];
  late int indexLun = MonthsData().monthInfo[widget.mnum][1].length;
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
                    'https://i.postimg.cc/kgjRc3sW/month-back.png'),
                fit: BoxFit.fill //fitHeight,
                ),
          ),
          child: Column(
            children: <Widget>[
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
                            child: TextScaleFactorClamper(
                              child: Text(
                                AllDates.hday,
                                // 
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
              Padding(
                  padding: EdgeInsets.only(
                      right: 20,
                      top: MediaQuery.of(context).size.height * 0.06),
                  child: Row(
                    children: [
                      TextScaleFactorClamper(
                          child: Text('شهر ' + widget.mname,
                              // 
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: 'ArbFONTS'))),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.05,
                  top: MediaQuery.of(context).size.height * 0.005,
                  bottom: MediaQuery.of(context).size.height * 0.01,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/white_wait.png',
                      height: 20.0,
                      width: 20.0,
                      //fit: BoxFit.scaleDown,
                    ),
                    const Padding(padding: EdgeInsets.only(left: 7)),
                    TextScaleFactorClamper(
                        child: Text(
                      AllData.getMWhen(widget.mnum + 1),
                       
                      style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontFamily: 'ArbFONTS'),
                    )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: 25, top: MediaQuery.of(context).size.height * 0.005),
                // ignore: prefer_const_literals_to_create_immutables
                child: Row(children: [
                  const TextScaleFactorClamper(
                      child: Text(
                    'الفصل',
                    // 
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.white,
                        fontFamily: 'ArbFONTS'),
                  )),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: 20,
                    top: MediaQuery.of(context).size.height * 0.005,
                    bottom: MediaQuery.of(context).size.height * 0.15),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => pushSeason(mSeason),
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/season_box.png',
                              //width: MediaQuery.of(context).size.width * 0.4,
                              //fit: BoxFit.fill,
                            ),
                            TextScaleFactorClamper(
                                child: Text(mSeason,
                                    // 
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff3F6E7B),
                                        fontFamily: 'ArbFONTS'))),
                          ],
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 5)),
                      if (indexLun == 2)
                        GestureDetector(
                          onTap: () => pushSeason(
                              MonthsData().monthInfo[widget.mnum][1][1]),
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/season_box.png',
                                //  width: MediaQuery.of(context).size.width * 0.55,
                                //fit: BoxFit.fill,
                              ),
                              TextScaleFactorClamper(
                                  child: Text(
                                      MonthsData().monthInfo[widget.mnum][1][1],
                                      // 
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Color(0xff3F6E7B),
                                          fontFamily: 'ArbFONTS'))),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => context.router
                    .push(MonthChar(mname: widget.mname, mnum: widget.mnum)),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/month_char.png',
                      width: MediaQuery.of(context).size.width * 0.9,
                    ),
                    TextScaleFactorClamper(
                        child: Text(
                      'خصائص ${widget.mname} المناخية',
                      style: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          height: 1.0,
                          fontFamily: 'ArbFONTS'),
                    )),
                  ],
                ),
              ),
              GestureDetector(
                  onTap: () => context.router
                      .push(MonthTemp(mname: widget.mname, mnum: widget.mnum)),
                  child: Stack(alignment: Alignment.center, children: <Widget>[
                    Image.asset(
                      'assets/images/month_char.png',
                      width: MediaQuery.of(context).size.width * 0.9,
                    ),
                    const TextScaleFactorClamper(
                        child: Text(
                      'الخرائط والرسومات البيانية',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          height: 1.0,
                          fontFamily: 'ArbFONTS'),
                    )),
                  ])),
            ],
          ),
        ),
      ),
      drawer: const NavigationDrawer(),
    );
  }

  void pushSeason(mSeason) {
    {
      if (mSeason == 'الصيف') {
        context.router.push(Season(
            sNum: 0,
            sName: mSeason,
            left: AllData.getSWhen('الصيف', AllData.summerDate[0])));
      } else if (mSeason == 'الخريف') {
        context.router.push(Season(
            sNum: 1,
            sName: mSeason,
            left: AllData.getSWhen('الخريف', AllData.autumnDate[0])));
      } else if (mSeason == 'الشتاء') {
        context.router.push(Season(
          sNum: 2,
          sName: mSeason,
          left: AllData.getSWhen('الشتاء', AllData.winterDate[0]),
        ));
      } else {
        context.router.push(Season(
          sNum: 3,
          sName: mSeason,
          left: AllData.getSWhen('الربيع', AllData.springDate[0]),
        ));
      }
    }
  }
}
