import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:climate_calendar_new/palette.dart';
import 'package:climate_calendar_new/screens/alarm_screen/alarm_screen.dart';
import 'package:climate_calendar_new/services/alarm_polling_worker.dart';
import 'package:climate_calendar_new/services/file_proxy.dart';
import 'package:climate_calendar_new/services/life_cycle_listener.dart';
import 'package:climate_calendar_new/services/media_handler.dart';
import 'package:climate_calendar_new/stores/alarm_list/alarm_list.dart';
import 'package:climate_calendar_new/stores/alarm_status/alarm_status.dart';
import 'package:climate_calendar_new/stores/observable_alarm/observable_alarm.dart';
import 'package:climate_calendar_new/utils/schedule_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wakelock/wakelock.dart';
import 'notification_service.dart';
import 'routes/ router.gr.dart';

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
  for (var alarm in list.alarms) {
    alarm.loadTracks();
  }
  WidgetsBinding.instance!.addObserver(LifeCycleListener(list));

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
    final externalPath = await getExternalStorageDirectory();
    print("This is external path" + externalPath!.path);

    if (!externalPath.existsSync()) externalPath.create(recursive: true);
    AlarmPollingWorker().createPollingWorker();
  }

  await NotificationService().init(); // <----
  //NotificationService().requestIOSPermissions; //

  runApp(MyApp());
}

void restartApp() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Observer(builder: (context) {
        AlarmStatus status = AlarmStatus();
        if (status.isAlarm) {
          final id = status.alarmId;
          final alarm = list.alarms.firstWhere((alarm) => alarm.id == id,
              orElse: () => ObservableAlarm());

          mediaHandler.playMusic(alarm);
          Wakelock.enable();

          return Material(child: AlarmScreen(alarm: alarm));
        }

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ar', ''),
          ],
          locale: const Locale('ar', 'SA'),
          builder: (context, navigator) {
            final scale =
                MediaQuery.of(context).textScaleFactor.clamp(0.8, 1.2);
            return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
                child: Theme(
                  data: ThemeData(
                    primarySwatch: Palette.kToDark,
                    fontFamily: 'ArbFONTS',
                    textTheme: (const TextTheme(
                      subtitle1: TextStyle(
                        color: Color(0xff4C7884),
                        fontSize: 20,
                      ),
                      caption: TextStyle(
                          color: Color(0xff4C7884),
                          fontSize: 16), // this for title of day color
                      bodyText2:
                          TextStyle(color: Color(0xff4C7884), fontSize: 18),
                    )),
                  ),
                  child: navigator!,
                ));
          },
        );
      }),
    );
  }
}
