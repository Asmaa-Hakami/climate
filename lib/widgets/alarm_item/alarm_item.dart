import 'package:climate_calendar_new/constants/theme_data.dart';
import 'package:climate_calendar_new/screens/edit_alarm/edit_alarm.dart';
import 'package:climate_calendar_new/services/alarm_list_manager.dart';
import 'package:climate_calendar_new/services/alarm_scheduler.dart';
import 'package:climate_calendar_new/stores/alarm_list/alarm_list.dart';
import 'package:climate_calendar_new/stores/observable_alarm/observable_alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
//import 'package:clockee/stores/alarm_list/alarm_list.dart';
//import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:mobx/mobx.dart';

import '../../dates.dart';

const dates = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];

class AlarmItem extends StatelessWidget {
  final ObservableAlarm alarm;
  final AlarmListManager? manager;
  final AlarmList alarms;

  const AlarmItem(
      {Key? key, required this.alarm, this.manager, required this.alarms})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final alarms = widget.alarms;
    //var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){ Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditAlarm(
          alarm: alarm,
          manager: manager,
          alarms: alarms,
          title: 'تحرير المنبه',
        ),
      ),
    );
                                AlarmScheduler().clearAlarm(alarm);
                        alarms.alarms.remove(alarm);
  },
      /*Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  EditAlarm(alarm: this.alarm, manager: manager!))),
                  */
      child: Observer(
        builder: (context) => 
                   Container(
          
          width: MediaQuery.of(context).size.width * 0.85,
                    decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/alarm_item_box.png'),
              fit: BoxFit.fill,
            ),
          ),
        /*Neumorphic(
          style: NeumorphicStyle(
            //shape: NeumorphicShape.concave,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
            depth: alarm.active! ? 2 : 0,
            color: Colors.white,
*/

            //intensity: 0.5,//alarm.active! ? 0.9 : 0.1,
          //),

          /*
           Container(
          
          width: MediaQuery.of(context).size.width * 0.85,
                    decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/alarm_item_box.png'),
              fit: BoxFit.fill,
            ),
          ),
          */

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
                            fontSize: 30,
                            //fontFamily: 'ArbFONTS',
                            //fontWeight: FontWeight.bold,
                            color: Color(0xff506B75)),
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 8),
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
                      //DateRow(alarm: alarm)
                    ],
                  ),
                ),
                Column(children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: GestureDetector(
                        onTap: () {
                              Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditAlarm(
          alarm: this.alarm,
          manager: this.manager,
          alarms: this.alarms,
          title: 'تحرير المنبه',
        ),
      ),
    );
                            AlarmScheduler().clearAlarm(alarm);
                        alarms.alarms.remove(alarm);
                        
                        },//=> editAlarm(context, manager),
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
                          color: Color(0xffD66E3E),
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
  /*
      void editAlarm(context, _manager) {
    //TimeOfDay tod = TimeOfDay.fromDateTime(DateTime.now());
    final newAlarm = ObservableAlarm.dayList(
        alarm.id,//alarms.alarms.length,
        alarm.name,
        alarm.hour,//tod.hourOfPeriod,//tod.hour,
        alarm.minute,//tod.minute,

        alarm.period,//tod.period.toString().substring(10, ),

        alarm.volume,//0.7,
       alarm.progressiveVolume,// false,
        alarm.active,//true,
        alarm.days,//List.filled(7, false),
        ObservableList<String>.of([]), <String>[]);
    //widget.alarms.alarms.add(newAlarm);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditAlarm(
          alarm: newAlarm,
          manager: _manager,
          alarms: alarms,
          title: 'تحرير المنبه',
        ),
      ),
    );
  }
  */
}


/*
class DateRow extends StatelessWidget {
  final ObservableAlarm alarm;
  final List<bool> dayEnabled;

  DateRow({
    Key? key,
    required this.alarm,
  })  : dayEnabled = [
          alarm.monday!,
          alarm.tuesday!,
          alarm.wednesday!,
          alarm.thursday!,
          alarm.friday!,
          alarm.saturday!,
          alarm.sunday!
        ],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size(150, 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: dates.asMap().entries.map((indexStringPair) {
          final dayString = indexStringPair.value;
          final index = indexStringPair.key;
          return Text(
            dayString,
            style: TextStyle(
                color: dayEnabled[index]
                    ? CustomColors.sdPrimaryColor
                    : CustomColors.sdPrimaryColor.withOpacity(0.5),
                fontWeight:
                    dayEnabled[index] ? FontWeight.bold : FontWeight.normal),
          );
        }).toList(),
      ),
    );
  }
}
*/
