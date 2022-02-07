import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:climate_calendar_new/all_notifications.dart';
import 'package:climate_calendar_new/get_location.dart';
//import 'package:climate_calendar_new/dates.dart';
//import 'package:climate_calendar_new/home_page.dart';
import 'package:climate_calendar_new/palette.dart';
import 'package:climate_calendar_new/screens/alarm_screen/alarm_screen.dart';
import 'package:climate_calendar_new/services/alarm_polling_worker.dart';
import 'package:climate_calendar_new/services/file_proxy.dart';
import 'package:climate_calendar_new/services/life_cycle_listener.dart';
import 'package:climate_calendar_new/services/media_handler.dart';
import 'package:climate_calendar_new/stores/alarm_list/alarm_list.dart';
import 'package:climate_calendar_new/stores/alarm_status/alarm_status.dart';
import 'package:climate_calendar_new/stores/observable_alarm/observable_alarm.dart';
import 'package:climate_calendar_new/ui/splash.dart';
//import 'package:climate_calendar_new/ui/text_scale.dart';
import 'package:climate_calendar_new/utils/schedule_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
//import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:location/location.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wakelock/wakelock.dart';

//import 'package:intl/intl.dart';

//import 'all_data.dart';
//import 'constants/theme_data.dart';
import 'notification_service.dart';

AlarmList list = AlarmList();
MediaHandler mediaHandler = MediaHandler();
var playingSoundPath = ValueNotifier<String>("");
NotificationAppLaunchDetails? notificationAppLaunchDetails;
ScheduleNotifications notifications = ScheduleNotifications(
    'clockee_notification',
    'Clockee Alarm Notication',
    'Alerts on scheduled alarm events',
    appIcon: 'notification_logo');
    
  
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final alarms = await JsonFileStorage().readList();
  list.setAlarms(alarms);
  list.alarms.forEach((alarm) {
    alarm.loadTracks();
  });
  WidgetsBinding.instance!.addObserver(LifeCycleListener(list));

  await AndroidAlarmManager.initialize();

  LocationData? locationData = await getLocationData();  


  await NotificationService().init(); // <----
  runApp(const MyApp());

  AlarmPollingWorker().createPollingWorker();

  final externalPath = await getExternalStorageDirectory();
  //print(externalPath!.path);
  if (!externalPath!.existsSync()) externalPath.create(recursive: true);
}

void restartApp() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
   const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  static DateTime mToday = DateTime.now(); //DateTime(2021, 7, 2); //
  //  static late List nowStatus = AllData.getNowStatus(DateTime(
  //    mToday.year,
   //   mToday.month,
   //   mToday.day)); 
      
  @override
  Widget build(BuildContext context) {

  //AllNotifications.appNotifications();  
        //return NeumorphicApp(
          
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'Clockee',
      //themeMode: ThemeMode.light,
      //theme: NeumorphicThemeData(
       //   defaultTextColor: Color(0xFF303E57),
       //   accentColor: Color(0xFF7B79FC),
       //   variantColor: CustomColors.sdAppBackgroundColor,
        //  baseColor: CustomColors.sdAppBackgroundColor, // Color(0xFFF8F9FC),
        //  depth: 8,
        //  intensity: 0.5,
        //  lightSource: LightSource.topLeft),
      home: Observer(builder: (context) {
        AlarmStatus status = AlarmStatus();
        //print('status.isAlarm ${status.isAlarm}');
        //print('list.alarms.length ${list.alarms.length}');
        if (status.isAlarm) {
          final id = status.alarmId;
          final alarm = list.alarms.firstWhere((alarm) => alarm.id == id,
              orElse: () => ObservableAlarm());

          mediaHandler.playMusic(alarm);
          Wakelock.enable();

          return Material(
              child: AlarmScreen(alarm: alarm)); //NeumorphicBackground(child: AlarmScreen(alarm: alarm)));
        }
       // return Material(child: HomePage());
        //final double subFontScale = MediaQuery.of(context).textScaleFactor.clamp(0.7, 0.7);
        //final double capFontScale = MediaQuery.of(context).textScaleFactor.clamp(0.7, 0.7);
        //final bodyFontScale = MediaQuery.of(context).copyWith(textScaleFactor: 1.0);//MediaQuery.of(context).textScaleFactor.clamp(0.7, 1.1);
    //final mediaQueryData = MediaQuery.of(context);
    //final num constrainedTextScaleFactor = mediaQueryData.textScaleFactor.clamp(1.0, 1.0);

   return MaterialApp(   
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate, // Here !
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', ''),
      ],
      locale: const Locale('ar', 'SA'),

      
      theme: ThemeData(
        primarySwatch: Palette.kToDark,//Colors.blueGrey,//Color(0xff4C7884),

        fontFamily: 'ArbFONTS',
        textTheme:(
              TextTheme(
             subtitle1:
                TextStyle(color: Color(0xff4C7884), fontSize: MediaQuery.of(context).textScaleFactor > 1.2 ? 14 :  20), //* (constrainedTextScaleFactor as double) //MediaQuery.of(context).textScaleFactor == 1 ? 14 : 
            caption:
                TextStyle(color: Color(0xff4C7884), fontSize: MediaQuery.of(context).textScaleFactor > 1.2 ? 12 : 16), // this for title of day color
            bodyText2:
                TextStyle(color:Color(0xff4C7884), fontSize: MediaQuery.of(context).textScaleFactor > 1.2 ? 14 : 20 ),
            
                 // this is for dates color
          )//.apply(fontSizeFactor:  bodyFontScale,) //fontSizeFactor: bodyFontScale ) //fontSizeDelta:  bodyFontScale,
        ),
      
      ),
      
      home: const SplashPage(), //HomePage(nowStatus),//SplashPage(),

    );
        
      }),
    );

    
  
  }
  
}
