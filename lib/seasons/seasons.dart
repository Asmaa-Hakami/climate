import 'package:auto_route/auto_route.dart';
import 'package:climate_calendar_new/ui/navdraw.dart';
import 'package:climate_calendar_new/ui/text_scale.dart';
import 'package:climate_calendar_new/ui/top_icons.dart';
import 'package:flutter/material.dart';

import '../all_data.dart';
import '../routes/ router.gr.dart';

class Seasons extends StatefulWidget {
  const Seasons({Key? key}) : super(key: key);
  @override
  _Seasons createState() => _Seasons();
}

class _Seasons extends State<Seasons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image:
                  NetworkImage('https://i.postimg.cc/LswqctrX/months-back.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: <Widget>[
              TopIconsWhite(context, 1),
              Row(

                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Padding(padding: EdgeInsets.only(right: 15)),
                    const TextScaleFactorClamper(
                        child: Text('الفصول',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                height: 1.3,
                                fontFamily: 'ArbFONTS'))),
                  ]),
              Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05)),
                  createSeasonBody(
                    icon: const AssetImage('assets/icons/summer.png'),
                    text: 'الصيف',
                    text2: AllData.getSWhen('الصيف', AllData.summerDate[0]),
                    num: 0,
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.04)),
                  createSeasonBody(
                    icon: const AssetImage('assets/icons/autumn.png'),
                    text: 'الخريف',
                    text2: AllData.getSWhen('الخريف', AllData.autumnDate[0]),
                    num: 1,
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.04)),
                  createSeasonBody(
                    icon: const AssetImage('assets/icons/winter.png'),
                    text: 'الشتاء',
                    text2: AllData.getSWhen('الشتاء', AllData.winterDate[0]),
                    num: 2,
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.04)),
                  createSeasonBody(
                    icon: const AssetImage('assets/icons/spring.png'),
                    text: 'الربيع',
                    text2: AllData.getSWhen('الربيع', AllData.springDate[0]),
                    num: 3,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: const NavigationDrawer(),
    );
  }

  Widget createSeasonBody({
    required AssetImage icon,
    required String text,
    required String text2,
    required int num,
  }) {
    String image;
    int textColorTitle = 0xff1F4050; //0xFF1F4050;
    int textColorSubTitle = 0xff5F7881; //0xFF84A9AC;
    int iconColor = 0xff5F7881; //0xff84A9AC;
    int arrawColor = 0xFF1F4050;
    if (text != AllData.nowSeason[0]) {
      image = 'assets/images/season_w_rec.png';
    } else {
      image = AllData.nowSeason[0] == 'الخريف'
          ? 'assets/images/autumn_rec.png'
          : AllData.nowSeason[0] == 'الشتاء'
              ? 'assets/images/winter_rec.png'
              : AllData.nowSeason[0] == 'الربيع'
                  ? 'assets/images/spring_rec.png'
                  : 'assets/images/summer_rec.png';
      textColorTitle = Colors.white.value;
      textColorSubTitle = 0xFF1F4050;
      iconColor = Colors.white.value;
      arrawColor = Colors.white.value;
    }
    return GestureDetector(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.12,
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05)),
            Image(
              image: icon,
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.1,
              color: Color(iconColor),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.095, //8
                child: Column(
                  children: [
                    TextScaleFactorClamper(
                        child: Text(
                      text,
                      style: TextStyle(
                          color: Color(textColorTitle),
                          fontSize: 22,
                          fontFamily: 'ArbFONTS'),
                      textAlign: TextAlign.right,
                    )),
                    TextScaleFactorClamper(
                        child: Text(
                      text2,
                      style: TextStyle(
                          color: Color(textColorSubTitle),
                          fontSize: 12,
                          height: 1.3,
                          fontFamily: 'ArbFONTS'),
                      textAlign: TextAlign.left,
                    ))
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.3,
            )),
            Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(arrawColor),
            ),
          ],
        ),
      ),
      onTap: () =>
          context.router.push(Season(left: text2, sName: text, sNum: num)),
    );
  }
}
