// ignore_for_file: prefer_const_constructors

//import 'dart:io';
//import 'dart:typed_data';

import 'dart:io';
//import 'dart:typed_data';

import 'package:climate_calendar_new/data/months/months_data.dart';
import 'package:climate_calendar_new/ui/nav_bar.dart';
import 'package:climate_calendar_new/ui/navdraw.dart';
import 'package:climate_calendar_new/ui/text_scale.dart';
import 'package:climate_calendar_new/ui/top_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
//import '../main.dart';

// ignore: must_be_immutable
class MonthChar extends StatefulWidget {
  String mname;
  int mnum;
  MonthChar(this.mname, this.mnum, {Key? key}) : super(key: key);

  @override
  State<MonthChar> createState() => _MonthChar();
}

class _MonthChar extends State<MonthChar> {
  late String datatoprint = MonthsData.monthInfo[widget.mnum][0];

  late String mSeason = MonthsData.monthInfo[widget.mnum][1].length == 2
      ? 'فصل ' + MonthsData.monthInfo[widget.mnum][1][0] + '-فصل ' + MonthsData.monthInfo[widget.mnum][1][1]
      : 'فصل ' + MonthsData.monthInfo[widget.mnum][1][0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: false,
          bottom: false,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(MonthsData.monthInfo[widget.mnum][2][0]),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: <Widget>[
                TopIconsWhite(context, 2),
                Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Padding(padding: EdgeInsets.only(right: 15)),
                                                  TextScaleFactorClamper(
                              child:Text('شهر ' + widget.mname,
                          //textScaleFactor: 1.0,
                          style: TextStyle(
                              color: Color(MonthsData.monthInfo[widget.mnum][2][5]),//Colors.white,
                              fontSize: 25,
                              fontFamily: 'ArbFONTS'),
                          textAlign: TextAlign.center),)
                    ]),
                Padding(padding: EdgeInsets.only(top: 10)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 25, top: 20, bottom: 15),
                      child: GestureDetector(
                        onTap: () async {

                  final ByteData bytes = await rootBundle.load('assets/pdf_files/${widget.mname}.pdf');
                  
                  final temp = await getTemporaryDirectory();

                  final path = '${temp.path}/${widget.mname}.pdf';

                  File(path).writeAsBytesSync(bytes.buffer.asUint8List());

                  await Share.shareFiles([path], text: 'خصائص شهر ${widget.mname}');
                  
                        },
                        child: Stack(alignment: Alignment.center, children: [
                          Image.asset(
                            'assets/images/sharing_box.png',
                            color: Color(MonthsData.monthInfo[widget.mnum][2][4]),
                            width: MediaQuery.of(context).size.width * 0.24,
                            fit: BoxFit.fill,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              new Image(
                                image: AssetImage('assets/icons/sharing.png'),
                                height: 18,
                              ),
                              const Padding(padding: EdgeInsets.only(right: 5)),
                                const Text(
                                "مشاركة",
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontFamily: 'ArbFONTS'),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    )
                  ],
                ),
                Flexible(
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width *
                              0.9, //padding: EdgeInsets.symmetric(horizontal: 15), //padding
                          //height: MediaQuery.of(context).size.height * 1,
                          // child:                Zoom(
                          //  maxZoomWidth: MediaQuery.of(context).size.width * 3,
                          //  maxZoomHeight: MediaQuery.of(context).size.height * 3,
                          // initZoom: 0.0,
                          child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, 

                            children: [
                    TextScaleFactorClamper(
                              child:Text(
                    'خصائص شهر  ${widget.mname} ($mSeason)\n',
                    textAlign: TextAlign.right,
                    //textScaleFactor: 1.0,
                    style: const TextStyle(
                      color: Color(0xFF3A6978),
                      fontSize: 13,
                      fontWeight: FontWeight.bold
                      //height: 1.5,
                    )),
                  ),  
                          
                          TextScaleFactorClamper(
                              child:Text(
                            datatoprint,
                            //textScaleFactor: 1.0,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                color: Color(0xFF5D5C5D),
                                fontSize: 13,
                                fontFamily: 'ArbFONTS'),
                          )),
                          ],)
                        ))),
                //  ),
              ],
            ),
          )),
      bottomNavigationBar: NavigationBarBottom(4),
      drawer: navigationDrawer(),
    );
  }
}
