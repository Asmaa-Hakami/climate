//import 'package:climate_calendar_new/constants/theme_data.dart';
import 'package:climate_calendar_new/screens/main/main_screen.dart';
import 'package:climate_calendar_new/services/alarm_list_manager.dart';
import 'package:climate_calendar_new/services/alarm_scheduler.dart';
import 'package:climate_calendar_new/stores/alarm_list/alarm_list.dart';
import 'package:climate_calendar_new/stores/observable_alarm/observable_alarm.dart';
import 'package:climate_calendar_new/ui/text_scale.dart';
import 'package:climate_calendar_new/widgets/dialog_container/dialog_container.dart';
//import 'package:climate_calendar_new/widgets/simple_button.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
//import 'package:clockee/screens/edit_alarm/components/edit_alarm_days.dart';
//import 'package:clockee/screens/edit_alarm/components/edit_alarm_music.dart';
//import 'package:clockee/screens/edit_alarm/components/edit_alarm_slider.dart';
//import 'package:clockee/utils/widget_helper.dart';
//import 'package:flutter_mobx/flutter_mobx.dart';
//import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'components/edit_alarm_days.dart';
import 'components/edit_alarm_head.dart';
import 'components/edit_alarm_time.dart';

class EditAlarm extends StatelessWidget {
  final ObservableAlarm? alarm;
  final AlarmListManager? manager;
  final AlarmList? alarms;
  final String? title;

  EditAlarm({this.alarm, this.manager, this.alarms, this.title});

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
                  //textScaleFactor: 1.0,
                  //textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )),
              ]),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Column(
            children: <Widget>[
              //Divider(),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.height * 0.1),
                child: EditAlarmTime(alarm: this.alarm!),
              ),

              EditAlarmDays(this.manager,  this.alarms,  this.title, alarm: this.alarm!,),

              EditAlarmHead(alarm: this.alarm!),
              //Divider(),
              //text("repeat", fontSize: CustomFontSize.textSizeSmall),
              //Divider(),
              SizedBox(
                height: 10,
              ),
              //EditAlarmMusic(alarm: this.alarm!),
              //Divider(),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                //Expanded(child: EditAlarmSlider(alarm: this.alarm!)),
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
                         // }
                          
                          //Navigator.pop(context);
                                                                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainScreen(alarms: this.alarms!,
                                  )));
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
      //),
        ));
  }
}
