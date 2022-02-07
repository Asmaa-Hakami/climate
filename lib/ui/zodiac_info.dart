//import 'package:climate_calendar/zodiac_class.dart';
//import 'dart:ffi';
import 'dart:io';
//import 'dart:typed_data';

import 'package:climate_calendar_new/data/zodiacs/zodiacs_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

//import '../all_data.dart';
//import '../dates.dart';
//import '../main.dart';
import 'nav_bar.dart';
import 'navdraw.dart';
import 'text_scale.dart';
import 'top_icons.dart';

//import 'package:image_gallery_saver/image_gallery_saver.dart';
//import 'package:permission_handler/permission_handler.dart';

import 'package:path_provider/path_provider.dart';

// ignore: must_be_immutable
class ZodiacInfo extends StatefulWidget {
  //String zname;
  //List zinfo;
  int index;
  ZodiacInfo(this.index, {Key? key}) : super(key: key);

  @override
  State<ZodiacInfo> createState() => _ZodiacInfoState();
}

class _ZodiacInfoState extends State<ZodiacInfo> {

  late String datatoprint =  ZodiacsData.zodiacData[widget.index][1];

  String zname = ''; //= zodiacData[index][0];

  @override
  Widget build(BuildContext context) {
    zname =  ZodiacsData.zodiacData[widget.index][0];
    return Scaffold(
        body: SafeArea(
          top: false,
          bottom: false,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ZodiacsData.zodiacData[widget.index][2]),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                //const Padding(padding: EdgeInsets.only(top: 20)),

                TopIconsWhite(context, 1),
                SizedBox(
                  //padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02, left: MediaQuery.of(context).size.width * 0.3),
                  height: MediaQuery.of(context).size.height * 0.09,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Padding(
                    padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.001),
                    child: TextScaleFactorClamper(
                              child:Text(
                      'موسم $zname',
                      //textScaleFactor: 1.0,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          height: 1.0,
                          fontFamily: 'ArbFONTS')),
                    ),
                  ),
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                    children: 
                    [
                                      Padding(
                      padding: EdgeInsets.only(left: 20, top: 7, bottom: 10),
             child: GestureDetector(
                      onTap: () async{
                                          final ByteData bytes = await rootBundle.load('assets/pdf_files/${ZodiacsData.zodiacData[widget.index][0]}.pdf');
                  
                  final temp = await getTemporaryDirectory();

                  final path = '${temp.path}/${ZodiacsData.zodiacData[widget.index][0]}.pdf';

                  File(path).writeAsBytesSync(bytes.buffer.asUint8List());

                  await Share.shareFiles([path], text: 'خصائص موسم ${ZodiacsData.zodiacData[widget.index][0]}');
                      },
                       child:Stack(
                         alignment: Alignment.center, children: [
                       Image.asset(
                        'assets/images/sharing_box.png',
                        color: Color( ZodiacsData.zodiacData[widget.index][3]),
                        width: MediaQuery.of(context).size.width * 0.24,
                        fit: BoxFit.fill,
                      ),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                      new Image(
                        image: AssetImage('assets/icons/sharing.png'),
                        height: 20,
                      ),
                      const Padding(padding: EdgeInsets.only(right: 5),
                      child: Text(
                        "مشاركة",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontFamily: 'ArbFONTS'),
                      )),
                       ],
                    ),
                                            ]))),
                  ]),
            Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                    child: TextScaleFactorClamper(
                              child:Text(
                      datatoprint,
                      //textScaleFactor: 1.0,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          color: Color(0xFF3A6978),
                          fontSize: 13,
                          height: 1.5,
                          fontFamily: 'ArbFONTS'),
                    )),
              )
            ))
              ],
            ),
          ),
        ),
      bottomNavigationBar: NavigationBarBottom(4),
        drawer: const navigationDrawer(),
    );
  }
}
