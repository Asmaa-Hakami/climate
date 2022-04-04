import 'package:flutter/material.dart';

import '../nav_bar.dart';
import 'navdraw.dart';
import 'top_icons.dart';

class AboutIdea extends StatelessWidget {
  const AboutIdea({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://i.postimg.cc/KYzBSvj9/about-idea.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //const Padding(padding: EdgeInsets.only(top: 20)),
                TopIconsWhite(context, 1),
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01)),
                const Text(
                  'المفكرة المناخية',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      
                      fontFamily: 'ArbFONTS'),
                ),
                const Text(
                  'للمملكة العربية السعودية',
                  textScaleFactor: 1.0,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      height: 1.3,
                      fontFamily: 'ArbFONTS'),
                ),
                Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02)),
                Image.network('https://i.postimg.cc/hvFddLrw/info-box.png',  height: MediaQuery.of(context).size.height * 0.65) 
              ],
            ),
          ),
        ),
      ),
              drawer: const NavigationDrawer(),
    );
  }
}
