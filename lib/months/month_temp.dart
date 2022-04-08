// ignore_for_file: prefer_const_constructors

import 'package:auto_route/auto_route.dart';
import 'package:climate_calendar_new/data/months/months_data.dart';
import 'package:climate_calendar_new/ui/navdraw.dart';
import 'package:climate_calendar_new/ui/top_icons.dart';
import 'package:flutter/material.dart';
import '../routes/ router.gr.dart';

// ignore: must_be_immutable
class MonthTemp extends StatefulWidget {
  String mname;
  int mnum;
  MonthTemp(this.mname, this.mnum, {Key? key}) : super(key: key);

  @override
  State<MonthTemp> createState() => _MonthTemp();
}

class _MonthTemp extends State<MonthTemp> {
  String image = 'assets/images/month_temp.png';

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
                    NetworkImage('https://i.postimg.cc/Dz9DYzPG/temp-back.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(children: [
              TopIconsWhite(context, 2),
              Column(children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01)),
                Text(widget.mname,
                     
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        height: 1.3,
                        fontFamily: 'ArbFONTS'),
                    textAlign: TextAlign.center),
                Padding(padding: EdgeInsets.only(top: 12)),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              image = 'assets/images/month_temp.png';
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            alignment: Alignment.center,
                            child: Text('درجات الحرارة',
                                 
                                style: TextStyle(
                                    color: Color(0xff506B75),
                                    fontSize: 16,
                                    height: 1,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'ArbFONTS'),
                                textAlign: TextAlign.center),
                          )),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            image = 'assets/images/month_graph.png';
                            context.router.push(
                              Monthgraphs(
                                mname: widget.mname,
                                mnum: widget.mnum,
                              ),
                            );
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          alignment: Alignment.center,
                          child: Text('الخريطة',
                               
                              style: TextStyle(
                                  color: Color(0xff506B75),
                                  fontSize: 16,
                                  height: 1,
                                  fontFamily: 'ArbFONTS'),
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.03),
                    child: temperatures()),
              ]),
            ]),
          )),
      drawer: const NavigationDrawer(),
    );
  }

  Widget temperatures() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.075,
          width: MediaQuery.of(context).size.width * 0.88,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/table_title.png'),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.87,
          height: MediaQuery.of(context).size.height * 0.55,
          child: ListView.builder(
              itemCount: MonthsData().monthInfo[widget.mnum][3].length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 115,
                  child: Column(
                    children: [
                      Container(
                        height: 110,
                        width: MediaQuery.of(context).size.width * 0.87,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icons/temperatures.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width * 0.23,
                                alignment: Alignment.center,
                                child: Text(
                                  MonthsData().monthInfo[widget.mnum][3][index]
                                      [0],
                                   
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'ArbFONTS'),
                                  textAlign: TextAlign.center,
                                )),
                            for (var i = 1;
                                i <
                                    MonthsData()
                                        .monthInfo[widget.mnum][3][index]
                                        .length;
                                i++)
                              Padding(
                                  padding: EdgeInsets.only(
                                      right: MediaQuery.of(context).size.width *
                                          0.05),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    child: Text(
                                      MonthsData().monthInfo[widget.mnum][3]
                                          [index][i],
                                       
                                      style: TextStyle(
                                          color: Color(0xff506B75),
                                          fontSize: 20,
                                          fontFamily: 'ArbFONTS'),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
