// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:climate_calendar_new/data/months/months_data.dart';
import 'package:climate_calendar_new/ui/navdraw.dart';
import 'package:climate_calendar_new/ui/top_icons.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../routes/ router.gr.dart';

// ignore: must_be_immutable
class Monthgraphs extends StatefulWidget {
  String mname;
  int mnum;
  Monthgraphs(this.mname, this.mnum, {Key? key}) : super(key: key);

  @override
  State<Monthgraphs> createState() => _Monthgraphs();
}

class _Monthgraphs extends State<Monthgraphs> {
  bool pressed = true;
  String image = 'assets/images/month_graph.png';

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
                  width: MediaQuery.of(context).size.width, //double.infinity,//
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(image),
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              image = 'assets/images/month_temp.png';

                              context.router.push(MonthTemp(
                                mname: widget.mname,
                                mnum: widget.mnum,
                              ));
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
                                    fontFamily: 'ArbFONTS'),
                                textAlign: TextAlign.center),
                          )),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            image = 'assets/images/month_graph.png';
                          });
                          //() => map();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          alignment: Alignment.center,
                          //padding: EdgeInsets.only(
                          //  right: MediaQuery.of(context).size.width * 0.2),
                          child: Text('الخريطة',
                               
                              style: TextStyle(
                                  color: Color(0xff506B75),
                                  fontSize: 16,
                                  height: 1,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'ArbFONTS'),
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.03)),
                map()
              ]),
            ]),
          )),
      drawer: const NavigationDrawer(),
    );
  }

  Widget map() {
    return Column(children: [
      SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.8,
          child: ListView(scrollDirection: Axis.vertical, children: [
            GestureDetector(
                onTap: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => _buildPopupDialog(
                          context,
                          'متوسط درجة الحرارة الكبرى',
                          MonthsData().monthInfo[widget.mnum][2][1]),
                    ),
                child: Image(
                  image:
                      NetworkImage(MonthsData().monthInfo[widget.mnum][2][1]),
                  width: MediaQuery.of(context).size.width * 0.75,
                )),
            GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(
                    context,
                    'متوسط درجة الحرارة الصغرى',
                    MonthsData().monthInfo[widget.mnum][2][2]),
              ),
              child: Image(
                image: NetworkImage(MonthsData().monthInfo[widget.mnum][2][2]),
                width: MediaQuery.of(context).size.width * 0.75,
              ),
            ),
            GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(
                    context,
                    'متوسط هطول الأمطار (ملم)',
                    MonthsData().monthInfo[widget.mnum][2][3]),
              ),
              child: Image(
                image: NetworkImage(MonthsData().monthInfo[widget.mnum][2][3]),
                width: MediaQuery.of(context).size.width * 0.75,
              ),
            ),
          ]))
      //)
    ]);
  }

  Widget _buildPopupDialog(BuildContext context, String title, String image) {
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
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.network(image),
          GestureDetector(
            onTap: () async {
              final urlImage = image;
              final utl = Uri.parse(urlImage);
              final response = await http.get(utl);
              final bytes = response.bodyBytes;

              final temp = await getTemporaryDirectory();
              final path = '${temp.path}/$title.jpg';
              File(path).writeAsBytesSync(bytes);
              await Share.shareFiles([path]);
            },
            child: Stack(alignment: Alignment.center, children: [
              Image.asset(
                'assets/images/sharing_box.png',
                color: Color(0xff506B75),
                width: MediaQuery.of(context).size.width * 0.24,
                fit: BoxFit.fill,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "مشاركة",
                     
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                        fontFamily: 'ArbFONTS'),
                  ),
                  const Padding(padding: EdgeInsets.only(right: 5)),
                  // ignore: unnecessary_new
                  new Image(
                    image: AssetImage('assets/icons/sharing.png'),
                    height: 18,
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    );
  }
}
