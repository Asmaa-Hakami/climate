import 'package:auto_route/auto_route.dart';
import 'package:climate_calendar_new/ui/navdraw.dart';
import 'package:climate_calendar_new/ui/text_scale.dart';
import 'package:climate_calendar_new/ui/top_icons.dart';
import 'package:flutter/material.dart';

import '../all_data.dart';
import '../dates.dart';
import '../routes/ router.gr.dart';

class Months extends StatefulWidget {
  const Months({Key? key}) : super(key: key);
  @override
  _Months createState() => _Months();
}

class _Months extends State<Months> {
  final List months = [
    "يناير",
    "فبراير",
    "مارس",
    "أبريل",
    "مايو",
    "يونيو",
    "يوليو",
    "أغسطس",
    "سبتمبر",
    "أكتوبر",
    "نوفمبر",
    "ديسمبر"
  ];
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
                        child: Text('شهور السنة',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                height: 1.3,
                                fontFamily: 'ArbFONTS'))),
                  ]),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03),
                  itemCount: months.length,
                  itemBuilder: (BuildContext context, int index) {
                    String image;
                    String now = '';
                    if (index + 1 == AllDates.mnum) {
                      image = AllData.nowSeason[0] == 'الصيف'
                          ? 'assets/images/month_summer.png'
                          : AllData.nowSeason[0] == 'الخريف'
                              ? 'assets/images/month_autumn.png'
                              : AllData.nowSeason[0] == 'الشتاء'
                                  ? 'assets/images/month_winter.png'
                                  : 'assets/images/month_spring.png';

                      now = AllDates.mDate + ' ' + AllDates.mMonth + '    ';
                    } else {
                      image = 'assets/images/white_month.png';
                      now = AllData.getMWhen(index + 1) + '    ';
                    }
                    return Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Container(
                          width: MediaQuery.of(context).size.height * 1,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(image),
                            ),
                          ),
                          // ignore: prefer_const_constructors
                          child: ListTile(
                            trailing: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                    child: TextScaleFactorClamper(
                                        child: Text(
                                      now,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff566F79)),
                                    )),
                                  )
                                ],
                              ),
                            ),
                            title: Row(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(right: 40),
                                    child: TextScaleFactorClamper(
                                      child: Text(months[index],
                                          style: const TextStyle(
                                              fontFamily: 'ArbFONTS',
                                              color: Color(0xff506B75),
                                              fontSize: 20),
                                          textAlign: TextAlign.right),
                                    )),
                              ],
                            ),
                            onTap: () => context.router
                                .push(Month(mnum: index, mname: months[index])),
                          ),
                        ));
                  },
                ),
                //],
              ),
            ],
          ),
        ),
      ),
      drawer: const NavigationDrawer(),
    );
  }
}
