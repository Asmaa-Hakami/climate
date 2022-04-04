
import 'package:climate_calendar_new/services/alarm_scheduler.dart';
import 'package:climate_calendar_new/stores/alarm_status/alarm_status.dart';
import 'package:climate_calendar_new/stores/observable_alarm/observable_alarm.dart';
import 'package:climate_calendar_new/ui/text_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:wakelock/wakelock.dart';

import '../../dates.dart';
import '../../main.dart';

class AlarmScreen extends StatelessWidget {
  final ObservableAlarm? alarm;

  const AlarmScreen({Key? key, required this.alarm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: []); // fullscreen
    final now = DateTime.now();
    final format = DateFormat('h:mm');

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.33,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8, //250,
                  child: TextScaleFactorClamper(
                            child:Text(
                    alarm!.name!,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    textScaleFactor: 1.0,
                    style: const TextStyle(color: Color(0xff506B75), fontSize: 30),
                  ),
                )),
                TextScaleFactorClamper(
                            child:Text(
                    AllDates.replaceEngNumber(format.format(now)), //format.format(now) //'${alarm!.hour}:${alarm!.minute}'
                    textScaleFactor: 1.0,
                    style: const TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color:
                            Color(0xff506B75)) //CustomColors.sdPrimaryColor),
                )),
              ],
            ),
          ),
        ),
        // SizedBox(
        //  height: 0,
        //),

        // GestureDetector(
        //  onTap: () async {
        //    await rescheduleAlarm(1);
        // },
        //child: text("Snooze", textColor: CustomColors.sdPrimaryColor),

        //Row(
        //crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.center,
        //children: snoozeTimes
        // .map((minutes) => RoundedButton(
        //     "+$minutes\m",
        //   fontSize: 24,
        //child:
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
        GestureDetector(
            onTap: () async {
              await rescheduleAlarm(10);
            },
            child: Stack(alignment: Alignment.center, children: [
              Image(
                image: const AssetImage('assets/images/snooze_box.png'),
                width: MediaQuery.of(context).size.width * 0.7,
                height: 65,
                fit: BoxFit.fill,
              ), //height: 50,
              const TextScaleFactorClamper(
                            child:Text(
                "غفوة",
                textScaleFactor: 1.0,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
            ])),

        GestureDetector(
          onTap: () async {
            await dismissCurrentAlarm();
          },
          child: Stack(alignment: Alignment.center, children: [
            Image(
              image: const AssetImage('assets/images/snooze_box.png'),
              width: MediaQuery.of(context).size.width * 0.7,
              height: 65,
              fit: BoxFit.fill,
            ), //
            const TextScaleFactorClamper(
                            child:Text("إيقاف",
                textAlign: TextAlign.center,
                textScaleFactor: 1.0,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22))),
          ]),
        ),
              ]),),
        Padding(
            padding: EdgeInsets.only(
                bottom: 20, top: MediaQuery.of(context).size.height * 0.15),
            child: Image.network('https://i.postimg.cc/wjFLGsqy/logo.png',
              height: MediaQuery.of(context).size.height * 0.08,
            )),
      ],
    );
  }

  Future<void> dismissCurrentAlarm() async {
    mediaHandler.stopMusic();
    Wakelock.disable();

    AlarmStatus().isAlarm = false;
    AlarmStatus().alarmId = -1;
    SystemNavigator.pop();
  }

  Future<void> rescheduleAlarm(int minutes) async {
    // Re-schedule alarm
    var checkedDay = DateTime.now();
    var targetDateTime =
        //DateTime(checkedDay.year, checkedDay.month,
        //  checkedDay.day, alarm!.hour!, alarm!.minute!);
        DateFormat('yyyyy.MM.dd h:mm a').parse(
            '${checkedDay.year}.${checkedDay.month}.${checkedDay.day} ${alarm!.hour!}:${alarm!.minute! + minutes} ${alarm!.period!.toString().toUpperCase()}');
    await AlarmScheduler()
        .newShot(targetDateTime, alarm!.id!); //.add(Duration(minutes: minutes))
    dismissCurrentAlarm();
    //mediaHandler.stopMusic();
    //Wakelock.disable();
    //SystemNavigator.pop();
    //AlarmStatus().isAlarm = false;
    //SystemNavigator.pop();
  }
}
