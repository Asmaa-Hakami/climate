
import 'package:climate_calendar_new/home_page.dart';
import 'package:climate_calendar_new/main.dart';
import 'package:climate_calendar_new/seasons/season.dart';
import 'package:climate_calendar_new/ui/nav_bar.dart';
import 'package:climate_calendar_new/ui/navdraw.dart';
import 'package:climate_calendar_new/ui/text_scale.dart';
import 'package:climate_calendar_new/ui/top_icons.dart';
import 'package:flutter/material.dart';

import '../all_data.dart';

class Seasons extends StatefulWidget {
  const Seasons({Key? key}) : super(key: key);
  @override
  _Seasons createState() => _Seasons();
}

class _Seasons extends State<Seasons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/months_back.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: <Widget>[
              TopIconsWhite(context, 1),
              Row(
                  //height: MediaQuery.of(context).size.height * 0.03,
                  //width: MediaQuery.of(context).size.width * 0.9,

                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Padding(padding: EdgeInsets.only(right: 15)),
                 const TextScaleFactorClamper(
                              child: Text('الفصول',
                //textScaleFactor: 1.0,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        height: 1.3,
                        fontFamily: 'ArbFONTS'))),
                  ]),
              Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05)),
                  createSeasonBody(
                    icon: const AssetImage('assets/icons/summer.png'),
                    text: 'الصيف',
                    text2: AllData.getSWhen('الصيف', AllData.summerDate[0]),
                    num: 0,
                  ),
                    /*
                    titleColor: 0xffAF7E27,//0xff466977,
                    subColor: 0xffC9912E,//0xff3A6978
                    durationColor: 0xffC9912E,
                    zodiacTextColor: 0xffAA7516,
                    zodiacDataColor: 0xffB27201,
                    darkBottonColor: 0xffD3A34F,
                    lightBottonColor: 0xffE8C98C
*/
                  
                  Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04)),
                  createSeasonBody(
                    icon: const AssetImage('assets/icons/autumn.png'),
                    text: 'الخريف',
                    text2: AllData.getSWhen('الخريف', AllData.autumnDate[0]),
                    num: 1,
                  ),
                    /*
                    titleColor: 0xffBB6B45,//0xffBB6B45,
                    subColor: 0xffBD7148,//0xffBD7148,
                    durationColor: 0xffA35530,
                    zodiacTextColor: 0xff964E2C,
                    zodiacDataColor: 0xff984D29,
                    darkBottonColor: 0xffBB6B45,
                    lightBottonColor: 0xffE2B07B
                    */
                  
                  Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04)),
                  createSeasonBody(
                    icon: const AssetImage('assets/icons/winter.png'),
                    text: 'الشتاء',
                    text2:  AllData.getSWhen('الشتاء', AllData.winterDate[0]),
                    num: 2,
                  ),
                    /*
                    titleColor: 0xff257179, //0xff3C7078,
                    subColor: 0xff257179,//0xff3C7078,
                    durationColor: 0xff459EA7,
                    zodiacTextColor: 0xff257179,
                    zodiacDataColor: 0xff9257179,
                    darkBottonColor: 0xff65A8AF,
                    lightBottonColor: 0xffABC7C9
                    */
                  
                  Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04)),
                  createSeasonBody(
                    icon: const AssetImage('assets/icons/spring.png'),
                    text: 'الربيع',
                    text2:  AllData.getSWhen('الربيع', AllData.springDate[0]),
                    num: 3,
                  ),
                    /*
                    titleColor: 0xff4E5A33,//0xff4E5A33,
                    subColor: 0xff6C7D47,//0xff3A6978,
                    durationColor: 0xff6C7D47,
                    zodiacTextColor: 0xff4E5A33,
                    zodiacDataColor: 0xff4E5A33,
                    darkBottonColor: 0xff6C7D47,
                    lightBottonColor: 0xffB6CF94
                    */


                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBarBottom(1),
      drawer: const navigationDrawer(),
    );
  }

  Widget createSeasonBody(
      {required AssetImage icon,
      required String text,
      required String text2,
      required int num,}) {
        String image;
        int textColorTitle = 0xff1F4050;//0xFF1F4050;
        int textColorSubTitle = 0xff5F7881;//0xFF84A9AC;
        int iconColor = 0xff5F7881; //0xff84A9AC; 
        int arrawColor = 0xFF1F4050;
    if (text != AllData.nowSeason[0]){
      image = 'assets/images/season_w_rec.png';

    }else{
      image =  AllData.nowSeason[0] == 'الخريف'? 'assets/images/autumn_rec.png' : AllData.nowSeason[0] == 'الشتاء'? 'assets/images/winter_rec.png' : AllData.nowSeason[0] == 'الربيع'? 'assets/images/spring_rec.png' : 'assets/images/summer_rec.png';
      textColorTitle = Colors.white.value;
      textColorSubTitle = 0xFF1F4050;
      iconColor = Colors.white.value;
      arrawColor = Colors.white.value;
    }
    return GestureDetector(
      child: Container( 
        height: MediaQuery.of(context).size.height * 0.12,
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
          image: DecorationImage (image: AssetImage(image),
          fit: BoxFit.fill),),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05)),
          Image(
            image: icon,
            height:  MediaQuery.of(context).size.height * 0.08,
            width:  MediaQuery.of(context).size.width * 0.1,
            color: Color(iconColor),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.095, //8
            child: Column(children: [
              TextScaleFactorClamper(
                              child:Text(text,
              //textScaleFactor: 1.0,
                style: TextStyle(
                    color: Color(textColorTitle),
                    fontSize: 22,
                    fontFamily: 'ArbFONTS'),
                    textAlign: TextAlign.right,)),

              TextScaleFactorClamper(
                              child:Text(text2,
              //textScaleFactor: 1.0,
                    style: TextStyle(
                    color: Color(textColorSubTitle),
                    fontSize: 12,
                    height: 1.3,
                    fontFamily: 'ArbFONTS'),
                    textAlign: TextAlign.left,
              ))

            ],)
            
          ),
              Padding(padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.3,)),
               Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Color(arrawColor),
              ),
        ],
      ),
      
      ),
      onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Season(num, text, text2))),
    );
    }
  
}
