
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../routes/ router.gr.dart';
//import 'package:flutter_neumorphic/flutter_neumorphic.dart';




class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.67,
        child: ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(35.0),
            ),
            child: Drawer(
              child: ListView(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05), //
                children: <Widget>[
                  createDrawerBodyItem(
                      icon: const AssetImage('assets/icons/idea.png'),
                      text: 'نبذة عن المفكرة',
                      onTap: () => openRoute(const AboutIdea())),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, right: 30),
                    child: Image(image: AssetImage('assets/icons/line.png')),
                  ),
                  createDrawerBodyItem(
                      icon: const AssetImage('assets/icons/note.png'),
                      text: 'المفكرة المناخية الورقية',
                      onTap: () => openRoute(const ClimateNotePaper())),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, right: 30),
                    child: Image(image: AssetImage('assets/icons/line.png')),
                  ),
                  createDrawerBodyItem(
                      icon: const AssetImage('assets/icons/climate.png'),
                      text: 'التقويم المناخي',
                      onTap: () => openRoute(const ClimateCalendar())),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, right: 30),
                    child: Image(image: AssetImage('assets/icons/line.png')),
                  ),
                  createDrawerBodyItem(
                      icon: const AssetImage('assets/icons/farm.png'),
                      text: 'التقويم الزراعي',
                      onTap: () => openRoute(const FarmCalender())),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, right: 30),
                    child: Image(image: AssetImage('assets/icons/line.png')),
                  ),
                  createDrawerBodyItem(
                      icon: const AssetImage('assets/icons/weather.png'),
                      text: 'توقعات الطقس',
                      onTap: () => openRoute(const Weather())),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, right: 30),
                    child: Image(image: AssetImage('assets/icons/line.png')),
                  ),
                  createDrawerBodyItem(
                      icon: const AssetImage('assets/icons/calendar.png'),
                      text: 'التقويم الهجري والميلادي',
                      onTap: () => openRoute(const CalendarHijri())),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, right: 30),
                    child: Image(image: AssetImage('assets/icons/line.png')),
                  ),
                  createDrawerBodyItem(
                      icon: const AssetImage('assets/icons/convert.png'),
                      text: 'تحويل التاريخ',
                      onTap: () => openRoute(const Convert())),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, right: 30),
                    child: Image(image: AssetImage('assets/icons/line.png')),
                  ),
                  createDrawerBodyItem(
                      icon: const AssetImage('assets/icons/prayers.png'),
                      text: 'مواقيت الأذان',
                      onTap: () => openRoute(const Prayers())),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, right: 30),
                    child: Image(image: AssetImage('assets/icons/line.png')),
                  ),
                  createDrawerBodyItem(
                      icon: const AssetImage('assets/icons/qiblah_dir.png'),
                      text: 'اتجاه القبلة',
                      onTap: () => openRoute(const Qiblah())),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, right: 30),
                    child: Image(image: AssetImage('assets/icons/line.png')),
                  ),

                  createDrawerBodyItem(
                    icon: const AssetImage('assets/icons/alarm.png'),
                    text: 'المنبه',
                    onTap: () => openRoute(MainScreen(alarms: list)),
                    ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, right: 30),
                    child: Image(image: AssetImage('assets/icons/line.png')),
                  ),

                  createDrawerBodyItem(
                      icon: const AssetImage('assets/icons/ramadan.png'),
                      text: 'شهر رمضان فلكيًا',
                      onTap: () => openRoute(const Ramadan())),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, right: 30),
                    child: Image(image: AssetImage('assets/icons/line.png')),
                  ),
                  createDrawerBodyItem(
                      icon: const AssetImage('assets/icons/about_green.png'),
                      text: 'حول التطبيق',
                      onTap: () => openRoute(const AboutApp())),
                ],
              ),
            )));
  }

  void openRoute<T>(PageRouteInfo<T> route) {
    if (Scaffold.of(context).isDrawerOpen) {
      Scaffold.of(context).openEndDrawer();
    }
    if (context.router.canPopSelfOrChildren) {
      context.replaceRoute(route);
    } else {
      context.pushRoute(route);
    }
  }
}

Widget createDrawerBodyItem(
    {required AssetImage icon,
    required String text,
    required GestureTapCallback onTap}) {
  return ListTile(
    leading: Image(
      image: icon,
      height: 20,
      width: 20,
    ),
    minLeadingWidth: 20,
    title: Text(text,
        textScaleFactor: 1.0,
        style: const TextStyle(
            color: Color(0xFF3A6978), fontSize: 15, fontFamily: 'ArbFONTS')),
    trailing: const Icon(
      Icons.arrow_back_ios_new_rounded,
      color: Color(0xFF8B9EA7),
    ),
    onTap: onTap,
  );
}
