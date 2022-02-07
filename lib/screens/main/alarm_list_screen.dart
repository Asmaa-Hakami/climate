//import 'package:clockee/constants/theme_data.dart';
// import 'package:dotted_border/dotted_border.dart';
import 'package:climate_calendar_new/screens/edit_alarm/edit_alarm.dart';
import 'package:climate_calendar_new/services/alarm_list_manager.dart';
import 'package:climate_calendar_new/services/alarm_scheduler.dart';
import 'package:climate_calendar_new/stores/alarm_list/alarm_list.dart';
import 'package:climate_calendar_new/stores/observable_alarm/observable_alarm.dart';
import 'package:climate_calendar_new/ui/top_icons.dart';
import 'package:climate_calendar_new/widgets/alarm_item/alarm_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
//import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:mobx/mobx.dart';

class AlarmListScreen extends StatelessWidget {
  final AlarmList alarms;

  const AlarmListScreen({Key? key, required this.alarms}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AlarmListManager _manager = AlarmListManager(alarms);

    return Container(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 20, bottom: 20), //top: 64
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        //  Material(
        //  child: TopIconsWhite(context),
        //  ),
        /*
          NeumorphicText(
            "المنبه",
            style: const NeumorphicStyle(
              depth: 0,
              //intensity: 14,
            ),
            textStyle: NeumorphicTextStyle(
              fontFamily: 'ArbFONTS',
                fontSize: 33, //customize size here
                //fontWeight: FontWeight.w900
                // AND others usual text style properties (fontFamily, fontWeight, ...)
                ),
          ),
          */
          const Text('المنبه',
          textScaleFactor: 1.0,
          style: TextStyle(
                 fontFamily: 'ArbFONTS',
                fontSize: 33,
                color: Colors.white
          ),
          ),
          const SizedBox(
            height: 20,
          ),
          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Observer(
                    builder: (context) => ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
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
                      separatorBuilder: (context, index) => const Divider(),
                    ),
                  ),
                  /*
                  NeumorphicButton(
                    margin: EdgeInsets.only(top: 50),
                    style: const NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.circle(),
                      depth: 2,
                      //intensity: 0.7,
                    ),
                    child: const Icon(
                      Icons.add_circle,
                      size: 80,
                      color: Color(0xFF3A6978),
                    ),
                    onPressed: () {
                      addAlarm(context, _manager);
                    },
                  ),
                  */
                  /*
                  Container(
                    //alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 50),
                                         child: IconButton(
                      icon: const Icon(Icons.add_circle,
                      size: 80,
                      color: Color(0xFF3A6978),
                      ),
                    onPressed: () {
                      addAlarm(context, _manager);
                    },
                  ),
                  ),
                  */
                   
                ],
              ),
            ),
          ),

          // BottomAddButton(
          //   onPressed: () {
          //     },
          // )
        ],
      ),
      
    );
  }
/*
  void addAlarm(context, _manager) {
    TimeOfDay tod = TimeOfDay.fromDateTime(DateTime.now());
    final newAlarm = ObservableAlarm.dayList(
        alarms.alarms.length,
        'New Alarm',
        tod.hour,
        tod.minute,
        0.7,
        false,
        true,
        List.filled(7, false),
        ObservableList<String>.of([]), <String>[]);
    alarms.alarms.add(newAlarm);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditAlarm(
          alarm: newAlarm,
          manager: _manager,
        ),
      ),
    );
  }
  */
}
