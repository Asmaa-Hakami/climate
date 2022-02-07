//import 'package:climate_calendar/zodiac_class.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:climate_calendar_new/data/seasons/seasons_data.dart';
//import 'package:climate_calendar_new/main.dart';
import 'package:climate_calendar_new/ui/nav_bar.dart';
import 'package:climate_calendar_new/ui/navdraw.dart';
import 'package:climate_calendar_new/ui/text_scale.dart';
import 'package:climate_calendar_new/ui/top_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

//import '../all_data.dart';
//import '../dates.dart';

// ignore: must_be_immutable
class SeasonInfo extends StatefulWidget {
  int index;
  String sName;
  int titleColor;
  SeasonInfo(this.index, this.sName, this.titleColor, {Key? key})
      : super(key: key);

  @override
  State<SeasonInfo> createState() => _SeasonInfo();
}

class _SeasonInfo extends State<SeasonInfo> {
  late String datatoprint = seasonsData[widget.index][7];
  late String sName = widget.sName; //= zodiacData[index][0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(seasonsData[widget.index][1][1]),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(children: [
            TopIconsGreen(context, 2),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextScaleFactorClamper(
                              child:Text(
                  'فصل $sName',
                  //textScaleFactor: 1.0,
                  style: TextStyle(
                      color: Color(widget.titleColor),
                      fontSize: 30,
                      height: 0.8,
                      fontFamily: 'ArbFONTS'),)
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 15, bottom: 10),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  GestureDetector(
                    onTap: () async{

                  final ByteData bytes = await rootBundle.load('assets/pdf_files/${widget.sName}.pdf');
                  
                  final temp = await getTemporaryDirectory();

                  final path = '${temp.path}/${widget.sName}.pdf';

                  File(path).writeAsBytesSync(bytes.buffer.asUint8List());

                  await Share.shareFiles([path], text: 'خصائص فصل ${widget.sName}');
                    },
                    child: Stack(alignment: Alignment.center, children: [
                      Image.asset(
                        'assets/images/sharing_box.png',
                        color: Color(seasonsData[widget.index][5][5]),
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
                                fontSize: 14.0,
                                color: Colors.white,
                                fontFamily: 'ArbFONTS'),
                          ),
                        ],
                      ),
                    ]),
                  ),
                ])),
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9, //padding: EdgeInsets.symmetric(horizontal: 15), //padding
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start, 
                    //mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                    TextScaleFactorClamper(
                              child:Text(
                    'الخصائص المناخية المحلية لفصل $sName (فصل $sName ${seasonsData[widget.index][2][0]} ${seasonsData[widget.index][2][1]})\n',
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
                    textAlign: TextAlign.justify,
                    //textScaleFactor: 1.0,
                    style: const TextStyle(
                      color: Color(0xFF3A6978),
                      locale: Locale('ar'),
                      fontSize: 13,
                      //height: 1.5,
                    )),
                  ),
                ])
                ),
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: NavigationBarBottom(4),
      drawer: const navigationDrawer(),
    );
  }
}
