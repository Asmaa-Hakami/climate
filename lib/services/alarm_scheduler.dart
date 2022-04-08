import 'dart:async';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:bringtoforeground/bringtoforeground.dart';
import 'package:climate_calendar_new/stores/observable_alarm/observable_alarm.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';

import '../main.dart';
import 'file_proxy.dart';

class AlarmScheduler {
  clearAlarm(ObservableAlarm alarm) {
    print("clearAlarm: ${alarm.id}");
    for (var i = 0; i < 7; i++) {
      AndroidAlarmManager.cancel(alarm.id! * 7 + i);
    }
  }

  /*
    To wake up the device and run something on top of the lockscreen,
    this currently requires the hack from here to be implemented:
    https://github.com/flutter/flutter/issues/30555#issuecomment-501597824
  */
  Future<void> scheduleAlarm(ObservableAlarm alarm) async {
    final days = alarm.days;

    final scheduleId = alarm.id! * 7;
    bool repeatAlarm = false;
    for (var i = 0; i < days.length; i++) {
      await AndroidAlarmManager.cancel(scheduleId + i);
      if (alarm.active! && days[i]) {
        // Repeat alarm
        repeatAlarm = true;
        final targetDateTime =
            nextWeekday(i + 1, alarm.hour!, alarm.minute!, alarm.period!);
        await newShot(targetDateTime, scheduleId + i);
      } else if (alarm.active! && !repeatAlarm && i == days.length - 1) {
        // One time alarm
        var checkedDay = DateTime.now(); 
        var targetDateTime = 
            DateFormat('yyyyy.MM.dd h:mm a').parse(
                '${checkedDay.year}.${checkedDay.month}.${checkedDay.day} ${alarm.hour}:${alarm.minute} ${alarm.period.toString().toUpperCase()} }');
        if (targetDateTime.millisecondsSinceEpoch <
            checkedDay.millisecondsSinceEpoch) {
          targetDateTime = targetDateTime.add(const Duration(days: 1));
        } // Prepare for next day

        print("targetDateTime ${targetDateTime.toString()}");
        await newShot(targetDateTime, scheduleId + i);
      }
    }
  }

  DateTime nextWeekday(int weekday, alarmHour, alarmMinute, AlarmPriod) {
    var checkedDay = DateTime.now();

    if (checkedDay.weekday == weekday) {
      final todayAlarm = 
          DateFormat('yyyyy.MM.dd h:mm a').parse(
              '${checkedDay.year}.${checkedDay.month}.${checkedDay.day} $alarmHour:$alarmMinute ${AlarmPriod.toString().toUpperCase()}}');

      if (checkedDay.isBefore(todayAlarm)) {
        return todayAlarm;
      }
      return todayAlarm.add(const Duration(days: 7));
    }

    while (checkedDay.weekday != weekday) {
      checkedDay = checkedDay.add(const Duration(days: 1));
    }

    return DateFormat('yyyyy.MM.dd h:mm a').parse(
        '${checkedDay.year}.${checkedDay.month}.${checkedDay.day} $alarmHour:$alarmMinute ${AlarmPriod.toString().toUpperCase()}}');
  }

  static void callback(int id) async {
    final alarmId = callbackToAlarmId(id);

    createAlarmFlag(alarmId);
  }

  /// Because each alarm might need to be able to schedule up to 7 android alarms (for each weekday)
  /// a means is required to convert from the actual callback ID to the ID of the alarm saved
  /// in internal storage. To do so, we can assign a range of 7 per alarm and use ceil to get to
  /// get the alarm ID to access the list of songs that could be played
  static int callbackToAlarmId(int callbackId) {
    return (callbackId / 7).floor();
  }

  /// Creates a flag file that the main isolate can find on life cycle change
  /// For now just abusing the FileProxy class for testing
  static void createAlarmFlag(int id) async {
    print('Creating a new alarm flag for ID $id');
    final dir = await getApplicationDocumentsDirectory();
    print('After flag');
    JsonFileStorage.toFile(File(dir.path + "/$id.alarm")).writeList([]);

    final alarms = await JsonFileStorage().readList();
    var alarm = alarms.firstWhere((element) => element.id == id);

    if (alarm.active! && Platform.isAndroid) {
      restartApp();
      Timer(const Duration(seconds: 5), () {
        Bringtoforeground.bringAppToForeground();
      });
      return;
    }
    final hours = alarm.hour.toString().padLeft(2, '0');
    final minutes = alarm.minute.toString().padLeft(2, '0');
    final period = alarm.period.toString();

    await notifications.init(onSelectNotification: (String? payload) async {
      // if (payload == null || payload.trim().isEmpty) return null;
      print('notification payload $payload');
      throw Exception('New Notification');
      // return;
    });

    await notifications.getNotificationAppLaunchDetails().then((details) {
      notificationAppLaunchDetails = details;
    });

    notifications.show(
      id: id,
      icon: 'notification_logo',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      title: '$hours:$minutes $period',
      body: alarm.name,
      sound: const RawResourceAndroidNotificationSound(''),
      payload: id.toString(),
    );
  }

  Future<void> newShot(DateTime targetDateTime, int id) async {
    await AndroidAlarmManager.oneShotAt(targetDateTime, id, callback,
        alarmClock: true, rescheduleOnReboot: true);
  }
}
