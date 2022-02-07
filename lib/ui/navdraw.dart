
import 'package:climate_calendar_new/qiblah/qibla.dart';
import 'package:climate_calendar_new/screens/main/main_screen.dart';
import 'package:climate_calendar_new/ui/weather.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_neumorphic/flutter_neumorphic.dart';


import '../about_app.dart';
import '../main.dart';
import 'about_idea.dart';
import 'calendar_hijri.dart';
import 'climate_calender.dart';
import 'climate_note_paper.dart';
import 'convert.dart';
import 'farm_calender.dart';
import 'prayer_times.dart';
import 'ramadan.dart';


// ignore: camel_case_types
class navigationDrawer extends StatelessWidget {
  const navigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    /*
    Container(
      height: MediaQuery.of(context).size.height * 0.9,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/list_back.png'),
                fit: BoxFit.fill //fitHeight,
                ),
          ),
          */
    
    SizedBox(
    width: MediaQuery.of(context).size.width * 0.67,
    child: ClipRRect(
  borderRadius: const BorderRadius.horizontal(left: Radius.circular(35.0),),
  
  child:Drawer(
      
      child: ListView(
        padding:
            const EdgeInsets.only(top: 15), //MediaQuery.of(context).h * 0.1
        children: <Widget>[

          createDrawerBodyItem(
            icon: const AssetImage('assets/icons/idea.png'),
            text: 'نبذة عن المفكرة',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutIdea()),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50, right: 30),
            child: Image(image: AssetImage('assets/icons/line.png')),
          ),

          createDrawerBodyItem(
            icon: const AssetImage('assets/icons/note.png'),
            text: 'المفكرة المناخية الورقية',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ClimateNotePaper()),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 50, right: 30),
            child: Image(image: AssetImage('assets/icons/line.png')),
          ),

          createDrawerBodyItem(
            icon: const AssetImage('assets/icons/climate.png'),
            text: 'التقويم المناخي',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ClimateCalendar()),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50, right: 30),
            child: Image(image: AssetImage('assets/icons/line.png')),
          ),
          //const Divider(),
          createDrawerBodyItem(
            icon: const AssetImage('assets/icons/farm.png'),
            text: 'التقويم الزراعي',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FarmCalender()),
            ),
          ),
                              const Padding(
            padding: EdgeInsets.only(left: 50, right: 30),
            child: Image(image: AssetImage('assets/icons/line.png')),
          ),
          createDrawerBodyItem(
            icon: const AssetImage('assets/icons/weather.png'),
            text: 'توقعات الطقس',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Weather()),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 50, right: 30),
            child: Image(image: AssetImage('assets/icons/line.png')),
          ),
          createDrawerBodyItem(
            icon: const AssetImage('assets/icons/calendar.png'),
            text: 'التقويم الهجري والميلادي',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CalendarHijri()),
            ),
          ),



          const Padding(
            padding: EdgeInsets.only(left: 50, right: 30),
            child: Image(image: AssetImage('assets/icons/line.png')),
          ),

          createDrawerBodyItem(
            icon: const AssetImage('assets/icons/convert.png'),
            text: 'تحويل التاريخ',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Convert()),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50, right: 30),
            child: Image(image: AssetImage('assets/icons/line.png')),
          ),

          createDrawerBodyItem(
            icon: const AssetImage('assets/icons/prayers.png'),
            text: 'مواقيت الأذان',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Prayers()),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50, right: 30),
            child: Image(image: AssetImage('assets/icons/line.png')),
          ),
          createDrawerBodyItem(
            icon: const AssetImage('assets/icons/qiblah_dir.png'),
            text: 'اتجاه القبلة',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Qiblah()),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50, right: 30),
            child: Image(image: AssetImage('assets/icons/line.png')),
          ),

          createDrawerBodyItem(
            icon: const AssetImage('assets/icons/alarm.png'),
            text: 'المنبه',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainScreen(alarms: list)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50, right: 30),
            child: Image(image: AssetImage('assets/icons/line.png')),
          ),

          createDrawerBodyItem(
            icon: const AssetImage('assets/icons/ramadan.png'),
            text: 'شهر رمضان فلكيًا',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Ramadan()),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50, right: 30),
            child: Image(image: AssetImage('assets/icons/line.png')),
          ),

          createDrawerBodyItem(
            icon: const AssetImage('assets/icons/about_green.png'),
            text: 'حول التطبيق',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutApp()),
            ),
          ),
        ],
      ),)
    ));
  }
}

Widget createDrawerBodyItem(
    {required AssetImage icon,
    required String text,
    required GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Image(
          image: icon,
          height: 20,
          width: 20,
          //color: const Color(0xff3A6978),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Text(text,
          textScaleFactor: 1.0,
              style: const TextStyle(
                  color: Color(0xFF3A6978),
                  fontSize: 15,
                  fontFamily: 'ArbFONTS')),
        ),
      ],
    ),
    trailing: const Icon(
      Icons.arrow_back_ios_new_rounded,
      color: Color(0xFF8B9EA7), // 8B9EA7  0xFF84A9AC
    ),
    onTap: onTap,
  );
}
