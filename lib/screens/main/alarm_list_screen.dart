import 'package:climate_calendar_new/services/alarm_list_manager.dart';
import 'package:climate_calendar_new/services/alarm_scheduler.dart';
import 'package:climate_calendar_new/stores/alarm_list/alarm_list.dart';
import 'package:climate_calendar_new/widgets/alarm_item/alarm_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
                      separatorBuilder: (context, index) => const Divider(),
                    ),
                  ),     
                   
                ],
              ),
            ),
          ),
        ],
      ),
      
    );
  }
}
