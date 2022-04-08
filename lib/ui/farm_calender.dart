// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../nav_bar.dart';
import 'navdraw.dart';
import 'top_icons.dart';

class FarmCalender extends StatelessWidget {
  const FarmCalender({Key? key}) : super(key: key);

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
                Text('التقويم الزراعي',
                 
                    style: TextStyle(
                        color: Color(0xFF4C7884),
                        fontSize: 35,
                        fontFamily: 'ArbFONTS'),
                    textAlign: TextAlign.center),
                    Padding(padding: EdgeInsets.only(top: 10)),
                Image.network('https://i.postimg.cc/02sS5CrK/farm.png',//'assets/images/farm.png',
                  height: MediaQuery.of(context).size.height * 0.28,//230,
                  //width: 203,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05,
                      bottom: MediaQuery.of(context).size.height * 0.04),
                  child: Text(
                    'للإطلاع على التقويم الزراعي ومشاركته',
                     
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
                                Text('التقويم الزراعي',
                                     
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
                        Share.share('https://drive.google.com/file/d/15UHlCAzoQRVKHUkSO8PnnA2j2FSfrWel/view');
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
              drawer: NavigationDrawer(),
      // ],
      //),
    );
  }

        _launchURL() async {
  const url = 'https://drive.google.com/file/d/15UHlCAzoQRVKHUkSO8PnnA2j2FSfrWel/view';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
  }

}
