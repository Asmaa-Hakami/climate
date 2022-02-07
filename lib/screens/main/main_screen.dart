

// import 'package:clockee/views/alarm_page.dart';
//import 'package:clockee/screens/main/clock_screen.dart';
//import 'package:climate_calendar_new/constants/theme_data.dart';
//import 'package:climate_calendar_new/models/menu_info.dart';
import 'package:climate_calendar_new/screens/edit_alarm/edit_alarm.dart';
import 'package:climate_calendar_new/services/alarm_list_manager.dart';
import 'package:climate_calendar_new/services/alarm_scheduler.dart';
import 'package:climate_calendar_new/stores/alarm_list/alarm_list.dart';
import 'package:climate_calendar_new/stores/observable_alarm/observable_alarm.dart';
import 'package:climate_calendar_new/ui/nav_bar.dart';
import 'package:climate_calendar_new/ui/navdraw.dart';
import 'package:climate_calendar_new/ui/text_scale.dart';
import 'package:climate_calendar_new/ui/top_icons.dart';
import 'package:climate_calendar_new/widgets/alarm_item/alarm_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:mobx/mobx.dart';

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:provider/provider.dart';

//import '../../enums.dart';
import '../../main.dart';
import 'alarm_list_screen.dart';

// import '../main.dart';
//List<MenuInfo> menuItems = [
  //MenuInfo(MenuType.clock, title: 'Clock', icon: Icons.timelapse),
//  MenuInfo(MenuType.alarm, title: 'Alarm', icon: Icons.alarm),
//];

class MainScreen extends StatefulWidget {
  final AlarmList alarms;

  const MainScreen({Key? key, required this.alarms}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //@override
  /*
  void initState() {
    super.initState();
     _requestPermissions();
     _configureSelectNotificationSubject();
  }
*/

  @override
  Widget build(BuildContext context) {
    final alarms = widget.alarms;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []); // fullscreen
    final AlarmListManager _manager = AlarmListManager(alarms);
    return Scaffold(
      // backgroundColor: CustomColors.pageBackgroundColor,
      body: SafeArea(
        top: false,
        bottom: false,
      child: Container(
                              decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/alarm_back.png'),
              fit: BoxFit.fill,
            ),
          ),
      child: Column(
        children: <Widget>[
          TopIconsWhite(context, 1),
          Expanded(
            //child: Consumer<MenuInfo>(
              //child: AlarmListScreen(alarms: widget.alarms)
              //builder: (BuildContext context, MenuInfo value, Widget? child) {
                //builder: (BuildContext context, Widget? child) {
                /*
                if (value.menuType == MenuType.clock)
                  return ClockScreen();
                else 
                */
               // if (value.menuType == MenuType.alarm)
                  //return AlarmListScreen(alarms: widget.alarms);
                  /*
                else
                  return Container(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(text: 'New Page\n'),
                          TextSpan(
                            text: value.title,
                            style: TextStyle(fontSize: 48),
                          ),
                        ],
                      ),
                    ),
                  );
                  */
             // },
             
             child: Container(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 10), //top: 64
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          const TextScaleFactorClamper(
                              child:Text('المنبه',
          //textScaleFactor: 1.0,
          style: TextStyle(
                 fontFamily: 'ArbFONTS',
                fontSize: 30,
                color: Colors.white
          )),
          ),
          Padding(padding: EdgeInsets.only(top: 20),
          child: GestureDetector(
            onTap: (){
                      addAlarm(context, _manager);
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                      Image.asset('assets/icons/add_alarm.png', width: MediaQuery.of(context).size.width * 0.35,),
                      const Text('     منبه جديد', textScaleFactor: 1.0, style: TextStyle(color: Color(0xff506B75), fontSize: 17, height: 0.1),),

                    ],),
          ),
          )

            ],
          ),

           SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Observer(
                    builder: (context) => ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final alarm = alarms.alarms[index];

                        return Dismissible(
                          key: Key(alarm.id.toString()),
                          child: AlarmItem(alarm: alarm, manager: _manager, alarms: alarms,),
                          onDismissed: (_) {
                            AlarmScheduler().clearAlarm(alarm);
                            alarms.alarms.removeAt(index);
                          },
                        );
                      },
                      itemCount: alarms.alarms.length,
                      separatorBuilder: (context, index) => const Padding(padding: EdgeInsets.only(bottom: 20)) //const Divider(),
                      
                    ),
                  ),
                   
                ],
              ),
            ),
          ),
        ],
      ),
      
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

    void addAlarm(context, _manager) {
    TimeOfDay tod = TimeOfDay.fromDateTime(DateTime.now());
    final newAlarm = ObservableAlarm.dayList(
        widget.alarms.alarms.length,
        '',
        tod.hourOfPeriod,//tod.hour,
        tod.minute,

        tod.period.toString().substring(10, ),

        0.7,
        false,
        true,
        List.filled(7, false),
        ObservableList<String>.of([]), <String>[]);
    //widget.alarms.alarms.add(newAlarm);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditAlarm(
          alarm: newAlarm,
          manager: _manager,
          alarms: widget.alarms,
          title: 'إضافة المنبه',
        ),
      ),
    );
  }
}

/*
   void _requestPermissions() {
     flutterLocalNotificationsPlugin
         .resolvePlatformSpecificImplementation<
             IOSFlutterLocalNotificationsPlugin>()
         ?.requestPermissions(
           alert: true,
           badge: true,
           sound: true,
         );
     flutterLocalNotificationsPlugin
         .resolvePlatformSpecificImplementation<
             MacOSFlutterLocalNotificationsPlugin>()
         ?.requestPermissions(
           alert: true,
           badge: true,
           sound: true,
         );
   }

   void _configureSelectNotificationSubject() {
     selectNotificationSubject.stream.listen((String payload) async {
        await Navigator.pushNamed(context, '/secondPage');
       print("Notification payload: $payload");
     });
   }
   */




