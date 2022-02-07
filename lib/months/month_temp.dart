// ignore_for_file: prefer_const_constructors

import 'package:climate_calendar_new/data/months/months_data.dart';
import 'package:climate_calendar_new/ui/nav_bar.dart';
import 'package:climate_calendar_new/ui/navdraw.dart';
import 'package:climate_calendar_new/ui/top_icons.dart';
import 'package:flutter/material.dart';

//import '../all_data.dart';
import '../main.dart';
import 'month_temp_map.dart';

// ignore: must_be_immutable
class MonthTemp extends StatefulWidget {
  String mname;
  int mnum;
  MonthTemp(this.mname, this.mnum, {Key? key}) : super(key: key);

  @override
  State<MonthTemp> createState() => _MonthTemp();
}

class _MonthTemp extends State<MonthTemp> {
  //bool pressed = true;
  String image = 'assets/images/month_temp.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SafeArea(
          top: false,
          bottom: false,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/temp_back.png'),
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
                    textScaleFactor: 1.0,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        height: 1.3,
                        fontFamily: 'ArbFONTS'),
                    textAlign: TextAlign.center),
                Padding(padding: EdgeInsets.only(top: 12)),

                Container(
                  //width: MediaQuery.of(context).size.width, //double.infinity,//
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      
                      //fit: BoxFit.fill,
                    ),
                  ),
                  //children: [
                    //Image.asset(image, width: MediaQuery.of(context).size.width * 2 , height:  MediaQuery.of(context).size.height * 0.07, fit: BoxFit.fill,),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            image = 'assets/images/month_temp.png';
                            //temperatures();
                          });
                        },
                                                child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          alignment: Alignment.center,
                        child: Text('درجات الحرارة',
                            textScaleFactor: 1.0,
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
                             Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Monthgraphs(widget.mname, widget.mnum),
                                ),
                              );
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          alignment: Alignment.center,
                          //padding: EdgeInsets.only(
                            //  right: MediaQuery.of(context).size.width * 0.2),
                          child: Text('الخريطة',
                              textScaleFactor: 1.0,
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
                child: temperatures()
                ),
              ]),
            ]),
          )),
      bottomNavigationBar: NavigationBarBottom(4),
      drawer: const navigationDrawer(),
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
                      //fit: BoxFit.fill,
                    ),
                  ),
                  /*
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.23,
                                //height: 100,
                                alignment: Alignment.center,
                              child: 
              Text(
                'المدينة',
                textScaleFactor: 1.0,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    height: 1,
                    fontFamily: 'ArbFONTS'),
                textAlign: TextAlign.center,
              )),
                                Padding(padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.08),
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.55,
                                //height: 100,
                                child: Row(
                                 // mainAxisAlignment: MainAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
              //Padding(
                //padding: EdgeInsets.only(
                  //  right: MediaQuery.of(context).size.width * 0.065),
                //child: 
                Text('متوسط درجة\n الحرارة الكبرى',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontFamily: 'ArbFONTS'),
                    textAlign: TextAlign.center),
                                Padding(padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.04)),

              Text('متوسط درجة\nالحرارة الصغرى',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'ArbFONTS'),
                  textAlign: TextAlign.center),
                                Padding(padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.04)),

              Text('متوسط هطول\nالأمطار (ملم)',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'ArbFONTS'),
                  textAlign: TextAlign.center)
                                  
            ],
          ),
                                            )),
            ]), 
            */
            ),

        SizedBox(
          width: MediaQuery.of(context).size.width * 0.87, //double.infinity,
          height: MediaQuery.of(context).size.height * 0.55,
          //child: Expanded(
          child: ListView.builder(
              itemCount: MonthsData.monthInfo[widget.mnum][3].length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 115,
                  //width: MediaQuery.of(context).size.width * 0.6,
                  //alignment: Alignment.centerRight,
                  child: Column(
                    children: [
                      Container(
                        height: 110,
                        width: MediaQuery.of(context).size.width * 0.87,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/icons/temperatures.png'),
                              fit: BoxFit.fill //fitHeight,
                              ),
                        ),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //Padding(
                              //padding: EdgeInsets.only(right: 0, left: 50),
                              //child: 
                              Container(
                                width: MediaQuery.of(context).size.width * 0.23,
                                alignment: Alignment.center,
                              child: Text(
                                MonthsData.monthInfo[widget.mnum][3][index][0],
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'ArbFONTS'),
                                textAlign: TextAlign.center,
                              )),
                           // ),
                            for (var i = 1;
                                i <
                                    MonthsData.monthInfo[widget.mnum][3][index]
                                        .length;
                                i++)
                                Padding(padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05),
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.15,
                                child: Text(
                                  MonthsData.monthInfo[widget.mnum][3][index]
                                      [i],
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      color: Color(0xff506B75),
                                      fontSize: 20,
                                      fontFamily: 'ArbFONTS'),
                                  textAlign: TextAlign.center,
                                ),)
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
        //  ),
      ],
    );
  }
}
