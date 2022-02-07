import 'package:climate_calendar_new/ui/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'main.dart';
import 'ui/navdraw.dart';
import 'ui/top_icons.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Column(
          children: [
            TopIconsGreen(context, 1),
            Center(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: MediaQuery.of(context).size.height * 0.15//118,
                    //width: 129,
                  ),
                  const Text(
                    '١.٠.٠',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                        color: Color(0xFF506B75),
                        fontSize: 30,
                        fontFamily: 'ArbFONTS'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.03),
                    child: const Text(
                      'فكرة التطبيق',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                          color: Color(0xFF506B75),
                          fontSize: 20,
                          fontFamily: 'ArbFONTS'),
                    ),
                  ),
                  const Text(
                    'طارق بن محمد أبانمي',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                        color: Color(0xFF506B75),
                        fontSize: 30,
                        fontFamily: 'ArbFONTS'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.03),
                    child: const Text(
                      'قيم التطبيق',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                          color: Color(0xFF506B75),
                          fontSize: 20,
                          fontFamily: 'ArbFONTS',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Text(
                    'إذا كان لديك أي اقتراحات \nنسعد جداً بتواصلك معنا',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                        color: Color(0xFF506B75),
                        fontSize: 20,
                        fontFamily: 'ArbFONTS'),
                  ),
                  const Text(
                    'Tareqabanmi@gmail.com',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                        color: Color(0xFF506B75),
                        fontSize: 20,
                        fontFamily: 'ArbFONTS'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.03,
                        bottom: MediaQuery.of(context).size.height * 0.015),
                    child:
// ignore: deprecated_member_use
                        GestureDetector(
                      onTap: () {
                        Share.share('https://drive.google.com/file/d/1UaZs9z2RrtE181s2F48Ik-a-xFQ7dCqs/view?usp=sharing');
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: 
                        [
                           Image.asset(
                              'assets/images/sharing_box.png',
                              width: MediaQuery.of(context).size.width * 0.33, //145,//
                              height: MediaQuery.of(context).size.height * 0.06, //45,//
                              fit: BoxFit.fill,
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset(
                            'assets/icons/sharing.png',
                            height: 20.0,
                            width: 20.0,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              "مشاركة",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontFamily: 'ArbFONTS'),
                            ),
                          ),
                        ],
                      ),
                        ])
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.23,
                        vertical: MediaQuery.of(context).size.height * 0.01),
                    child: const Image(image: AssetImage('assets/icons/line.png')),
                  ),
                  const Text(
                    'تصميم\n شذى الشيخي   Shatha.alsheikhii@gmail.com\n',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                        color: Color(0xFF506B75),
                        fontSize: 10,
                        height: 1.2,
                        fontFamily: 'ArbFONTS'),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    'برمجة\n أسماء حكمي   asmaa.a.hakami@gmail.com',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                        color: Color(0xFF506B75),
                        fontSize: 10,
                        height: 1.2,
                        fontFamily: 'ArbFONTS'),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBarBottom(4),
      drawer: const navigationDrawer(),
    );
  }
}
