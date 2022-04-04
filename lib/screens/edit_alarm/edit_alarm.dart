
import 'package:auto_route/auto_route.dart';
import 'package:climate_calendar_new/services/alarm_list_manager.dart';
import 'package:climate_calendar_new/services/alarm_scheduler.dart';
import 'package:climate_calendar_new/stores/alarm_list/alarm_list.dart';
import 'package:climate_calendar_new/stores/observable_alarm/observable_alarm.dart';
import 'package:climate_calendar_new/ui/text_scale.dart';
import 'package:climate_calendar_new/widgets/dialog_container/dialog_container.dart';
import 'package:flutter/material.dart';
import '../../routes/ router.gr.dart';
import 'components/edit_alarm_days.dart';
import 'components/edit_alarm_head.dart';
import 'components/edit_alarm_time.dart';

class EditAlarm extends StatelessWidget {
  final ObservableAlarm? alarm;
  final AlarmListManager? manager;
  final AlarmList? alarms;
  final String? title;

  // ignore: use_key_in_widget_constructors
  const EditAlarm({this.alarm, this.manager, this.alarms, this.title});

  @override
  Widget build(BuildContext context) {
    return
    /*
        WillPopScope(
      onWillPop: () async {
        print('onWillPop $alarm');
        await manager!.saveAlarm(alarm!);
        await AlarmScheduler().scheduleAlarm(alarm!);
        return true;
      },
      
        child:
        */
        DialogContainer(
      child: SingleChildScrollView(
        child: Column(children: [
          Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                 Padding(padding: EdgeInsets.only(right: 30, top: MediaQuery.of(context).size.height * 0.12)),
                TextScaleFactorClamper(
                              child:Text(
                  title!,
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                )),
              ]),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Column(
            children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.height * 0.1),
                child: EditAlarmTime(alarm: this.alarm!),
              ),

              EditAlarmDays(this.manager, this.alarms,  this.title, alarm: this.alarm!,  ), 

              EditAlarmHead(alarm: this.alarm!),

              const SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05,
                        bottom: MediaQuery.of(context).size.height * 0.035),
                    child: GestureDetector(
                        onTap: () async {
                         // if(title == 'إضافة المنبه'){
                          alarms!.alarms.add(alarm!);
                          await manager!.saveAlarm(alarm!);
                          await AlarmScheduler().scheduleAlarm(alarm!);
                          
                          //Navigator.pop(context);
                          //Navigator.push(
                          //context,
                          //MaterialPageRoute(
                              //builder: (context) => 
                             context.pushRoute(MainScreen(alarms: this.alarms!));
                             //Navigator.pushNamed(context, "/");
                             
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/images/add_box.png',
                              width: MediaQuery.of(context).size.width * 0.4,
                            ),
                             Text(
                              title == 'إضافة المنبه'? "إضافة" : 'حفظ',
                              textScaleFactor: 1.0,
                              style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  height: 1.5,
                                  fontFamily: 'ArbFONTS'),
                            ),
                          ],
                        ))),
              ])
            ],
          ),
        ]),
        ));
  }
}
