import 'package:flutter/material.dart';

import '../main.dart';
import 'nav_bar.dart';
import 'navdraw.dart';
import 'top_icons.dart';

class AboutIdea extends StatelessWidget {
  const AboutIdea({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    /*
    final textScale = MediaQuery.of(context).textScaleFactor;
      String about = """• تم العمل بالاعتماد على تقسيم الفصول والاشهر والمواسم
على المتوسطات لدرجات الحرارة والمتوسطات للأمطار
المسجلة خلال ٣٤ سنة ماضية والأجواء السائدة في تلك الفترة
• تم الابتعاد عن التقسيم (الفلكي– الطوالع) الدارج
• تم ربط المتوسطات المناخية بدخول الطوالع
لذلك سوف يجد المتلقي تغير في عدد طوالع الفصول المعروفة
كل فصل ٧ طوالع حيث تكون طوالع الصيف ١٠ طوالع
والخريف ٥ طوالع والشتاء ٨ طوالع والربيع ٥ طوالع
  """;
  */
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/about_idea.png'),
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
                //SizedBox()
                Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02)),
                Image.asset('assets/images/info_box.png',  height: MediaQuery.of(context).size.height * 0.65) //width: MediaQuery.of(context).size.width * 0.8,
                /*
                '
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05)),
                const Text(
                  'نبذه عن الفكرة',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      color: Color(0xFF3A6978),
                      fontWeight: FontWeight.bold,
                      
                      fontSize: 20,
                      fontFamily: 'ArbFONTS'),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.03, right: 15, left: 20),
                 child: Text(
                  about,                  
                  textAlign: TextAlign.right,
                  textScaleFactor: 1.0,
                  style: const TextStyle(
                    
                      color: Color(0xFF5D5C5D),
                      fontSize: 13.0 ,
                      fontFamily: 'ArbFONTS'),
                ), ),
                /*
                const Text(
                  '\u2022 تم الابتعاد عن التقسيم (الفلكي– الطوالع) الدارج',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Color(0xFF3A6978),
                      fontSize: 13,
                      fontFamily: 'ArbFONTS'),
                ),
                const Text(
                  '\u2022 تم ربط المتوسطات المناخية بدخول الطوالع\nلذلك سوف يجد المتلقي تغير في عدد طوالع الفصول المعروفة\nكل فصل ٧ طوالع حيث تكون طوالع الصيف ١٠ طوالع\nوالخريف ٥ طوالع والشتاء ٨ طوالع والربيع ٥ طوالع',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Color(0xFF3A6978),
                      fontSize: 13,
                      fontFamily: 'ArbFONTS'),
                ),
                */
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.08)),
                Image.asset(
                  'assets/images/logo.png',
                  height: 78,
                  width: 85,
                ),'
                */
              ],
            ),
          ),
          //  ],
          //),
        ),
      ),
      bottomNavigationBar: NavigationBarBottom(4),
      drawer: const navigationDrawer(),
    );
  }
}
