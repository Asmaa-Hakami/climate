// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../main.dart';
import 'nav_bar.dart';
import 'navdraw.dart';
import 'top_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class ClimateNotePaper extends StatelessWidget {
  const ClimateNotePaper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Column(
          children: [
            TopIconsGreen(context, 1),
            Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.1)),
                Text('المفكرة المناخية\n الورقية',
                textScaleFactor: 1.0,
                    style: TextStyle(
                        color: Color(0xFF4C7884),
                        fontSize: 35,
                        fontFamily: 'ArbFONTS'),
                    textAlign: TextAlign.center),
                Image.asset(
                  'assets/images/paper.png',
                  height: MediaQuery.of(context).size.height * 0.27,//203,
                  //width:229,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05,
                      bottom: MediaQuery.of(context).size.height * 0.04),
                  child: Text(
                    'للإطلاع على المفكرة المناخية الورقية ومشاركتها',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                        color: Color(0xFF5D5C5D),
                        fontSize: 15,
                        fontFamily: 'ArbFONTS'),
                  ),
                ),
                                GestureDetector(
                      onTap: _launchURL,
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/farm_rec.png',
                            width: MediaQuery.of(context).size.width * 0.55,
                            //fit: BoxFit.fill,
                          ),
                                Text('المفكرة المناخية الورقية',
                                    textScaleFactor: 1.0,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        height: 1,
                                        fontFamily: 'ArbFONTS')),

                        ],
                      ),
                    ),

                        GestureDetector(
                      onTap: () {
                        Share.share('https://drive.google.com/file/d/10Lls0jkYZ758um4BsPblUSxfQkSH_Suh/view?usp=sharing');
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: 
                        [
                           Image.asset(
                              'assets/images/farm_rec.png',
                              width: MediaQuery.of(context).size.width * 0.33, //145,//
                              height: MediaQuery.of(context).size.height * 0.055, //45,//
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
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  height: 1.5,
                                  fontFamily: 'ArbFONTS'),
                            ),
                          ),
                        ],
                      ),
                        ])
                    ),
                    
              ],
            ),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBarBottom(4),
      drawer: navigationDrawer(),
      // ],
      //),
    );
  }

      _launchURL() async {
  const url = 'https://drive.google.com/file/d/10Lls0jkYZ758um4BsPblUSxfQkSH_Suh/view?usp=sharing';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
  }

}
