// ignore_for_file: unnecessary_this

import 'package:auto_route/auto_route.dart';
import 'package:climate_calendar_new/services/alarm_list_manager.dart';
import 'package:climate_calendar_new/services/alarm_scheduler.dart';
import 'package:climate_calendar_new/stores/alarm_list/alarm_list.dart';
import 'package:climate_calendar_new/stores/observable_alarm/observable_alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../dates.dart';
import '../../routes/ router.gr.dart';

class AlarmItem extends StatelessWidget {
  final ObservableAlarm alarm;
  final AlarmListManager? manager;
  final AlarmList alarms;

  const AlarmItem(
      {Key? key, required this.alarm, this.manager, required this.alarms})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushRoute(EditAlarm(
              alarm: alarm,
              manager: manager,
              alarms: alarms,
              title: 'تحرير المنبه',
            ),
        );
        AlarmScheduler().clearAlarm(alarm);
        alarms.alarms.remove(alarm);
      },
      child: Observer(
        builder: (context) => Container(
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/alarm_item_box.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '   ${AllDates.replaceEngNumber(alarm.hour.toString().padLeft(2, '0'))}:${AllDates.replaceEngNumber(alarm.minute.toString().padLeft(2, '0'))} ${alarm.period == 'am' ? 'ص' : 'م'}', //${alarm.period == 'am'? 'ص' : 'م'}
                        textScaleFactor: 1.0,
                        style: const TextStyle(
                            fontSize: 30, color: Color(0xff506B75)),
                      ),
                      Row(
                        children: <Widget>[
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              '   ${alarm.name!}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Color(0xff88A1AA),
                                  fontSize: 17,
                                  height: 1.2),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: GestureDetector(
                        onTap: () {
                          context.pushRoute(EditAlarm(
                                alarm: this.alarm,
                                manager: this.manager,
                                alarms: this.alarms,
                                title: 'تحرير المنبه',
                              ),
                          );
                          AlarmScheduler().clearAlarm(alarm);
                          alarms.alarms.remove(alarm);
                        }, //=> editAlarm(context, manager),
                        child: Stack(alignment: Alignment.center, children: [
                          Image.asset('assets/images/alarm_edit.png',
                              width: MediaQuery.of(context).size.width * 0.27),
                          const Text(
                            "تحرير",
                            textScaleFactor: 1.0,
                            style: TextStyle(
                                fontSize: 17.0,
                                height: 1,
                                color: Color(0xffFAFAFA),
                                fontFamily: 'ArbFONTS'),
                          ),
                        ])),
                  ),
                  GestureDetector(
                      onTap: () {
                        AlarmScheduler().clearAlarm(alarm);
                        alarms.alarms.remove(alarm);
                      },
                      child: Stack(alignment: Alignment.center, children: [
                        Image.asset(
                          'assets/images/alarm_edit.png',
                          width: MediaQuery.of(context).size.width * 0.27,
                          color: const Color(0xffD66E3E),
                        ),
                        const Text(
                          "حذف",
                          textScaleFactor: 1.0,
                          style: TextStyle(
                              fontSize: 17.0,
                              height: 1,
                              color: Color(0xffFAFAFA),
                              fontFamily: 'ArbFONTS'),
                        ),
                      ])),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
