
// import 'package:path/path.dart';

import 'package:climate_calendar_new/get_location.dart';
import 'package:climate_calendar_new/ui/zodiac_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  //NotificationService a singleton object
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  static int azanID = 50;
  static int dateID = 0;
  
  
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();


  Future<void> init() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
            macOS: null);

    tz.initializeTimeZones();

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

Future<void> _createNotificationChannel(String id, String name,
    String description) async {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  var androidNotificationChannel = AndroidNotificationChannel(
    id,
    name,
    description,
  );
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(androidNotificationChannel);
}

//late Future<void> azanChannel = _createNotificationChannel('0', 'Azan', 'with specefic sound');
//late Future<void> enteredChannel = _createNotificationChannel('1', 'Entered', 'just device sound');

static Future _datesNotificationDetails() async{
  return const NotificationDetails(
      android: AndroidNotificationDetails(
    'date channel id 0',
    'channel name', //'channel name',
    'channel description',
    playSound: true,
    priority: Priority.high,
    importance: Importance.max,
  ),
  iOS: IOSNotificationDetails(),
  );
}

static Future _notificationDetails() async{
  //var fileName = name;
  return const NotificationDetails(
      android: AndroidNotificationDetails(
    'azan channel id 0',
    'channel name', //'channel name0',
    'channel description',
    
     sound: RawResourceAndroidNotificationSound('azan'),
    playSound: true,
    priority: Priority.high,
    importance: Importance.max,
  ),
  iOS: IOSNotificationDetails(
    //sound: 
  ),
  );
}

  static Future<void> azanScheduleNotifications({
    //int? id,
    String? title,
    String? body,
    String? payload,
    required DateTime schedualedDate,
  }) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        azanID++,//id!,
        //azanID+2,
        title,
        body,
        tz.TZDateTime.from(
            schedualedDate, tz.local), //.add(const Duration(seconds: 5))
        //NotificationDetails(android: _androidNotificationDetails),
        await _notificationDetails(),//id == 0? await _azanNotificationDetails() : await _enteredNotificationDetails(),
        payload: payload,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  static Future<void> datesScheduleNotifications({
    //int? id,
    String? title,
    String? body,
    String? payload,
    required DateTime schedualedDate,
  }) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      dateID++,
        //dateID+2,
        title,
        body,
        tz.TZDateTime.from(
            schedualedDate, tz.local), 
        await _datesNotificationDetails(),
        payload: payload,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

}

Future selectNotification(String? payload) async {
  Future<Widget?> build(BuildContext context) async {
  return await Navigator.push(
    context, // BuidContext context
    MaterialPageRoute(builder: (context) => ZodiacInfo(int.parse(payload.toString()))),
  );
  }
}