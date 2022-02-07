import 'package:climate_calendar_new/ui/nav_bar.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'navdraw.dart';
import 'top_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class Weather extends StatelessWidget {
  const Weather({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/weather_back.png'),
              fit: BoxFit.fill,
            ),
          ),
            child: Column(
              children: [
                TopIconsWhite(context, 1),
                Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05)),
                                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.9,
                  
                  child: const Text('توقعات الطقس',
                  textScaleFactor: 1.0,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'ArbFONTS')),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.035)),
                                GestureDetector(
                      onTap: ()=>{_launchURL('https://ncm.gov.sa/ar/Pages/default.aspx')},
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/farm_rec.png',
                            width: MediaQuery.of(context).size.width * 0.8,
                            //fit: BoxFit.fill,
                          ),
                                Text('المركز الوطني للأرصاد',
                                    textScaleFactor: 1.0,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontFamily: 'ArbFONTS')),

                        ],
                      ),
                    ),
                                                    GestureDetector(
                      onTap: ()=>{_launchURL('https://www.windy.com/?24.657,46.718,5,i:pressure')},
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/farm_rec.png',
                            width: MediaQuery.of(context).size.width * 0.8,
                            //fit: BoxFit.fill,
                          ),
                                Text('Windy',
                                    textScaleFactor: 1.0,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontFamily: 'ArbFONTS')),

                        ],
                      ),
                    ),
                                GestureDetector(
                      onTap: ()=>{_launchURL('https://meteologix.com/sa/model-charts/euro')},
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/farm_rec.png',
                            width: MediaQuery.of(context).size.width * 0.8,
                            //fit: BoxFit.fill,
                          ),
                                Text('توقعات حالة الطقس Meteologix',
                                    textScaleFactor: 1.0,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontFamily: 'ArbFONTS')),

                        ],
                      ),
                    ),
                SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01),
                                GestureDetector(
                      onTap: ()=>{_launchURL('https://www.rainviewer.com/weather-radar-map-live.html')},
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/farm_rec.png',
                            width: MediaQuery.of(context).size.width * 0.8,
                            //fit: BoxFit.fill,
                          ),
                                Text('رادار الأمطار Rainviewer',
                                    textScaleFactor: 1.0,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontFamily: 'ArbFONTS')),

                        ],
                      ),
                    ),
              ],
            ),
        ),
      ),
      bottomNavigationBar: NavigationBarBottom(4),
      drawer: const navigationDrawer(),
    );
  }
        _launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
  }
}
