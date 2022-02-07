import 'package:climate_calendar_new/stores/alarm_list/alarm_list.dart';
import 'package:flutter/material.dart';

import 'alarm_polling_worker.dart';
import 'file_proxy.dart';


class LifeCycleListener extends WidgetsBindingObserver {
  final AlarmList alarms;

  LifeCycleListener(this.alarms);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
        saveAlarms();
        break;
      case AppLifecycleState.resumed:
        createAlarmPollingIsolate();
        break;
      default:
        print("Updated lifecycle state: $state");
    }
  }

  void saveAlarms() {
    //alarms.alarms.forEach((alarm) => alarm.updateMusicPaths());
    JsonFileStorage().writeList(alarms.alarms);
  }

  void createAlarmPollingIsolate() {
    print('Creating a new worker to check for alarm files!');
    AlarmPollingWorker().createPollingWorker();
  }
}
