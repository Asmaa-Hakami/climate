import 'package:climate_calendar_new/constants/theme_data.dart';
import 'package:climate_calendar_new/services/alarm_list_manager.dart';
import 'package:climate_calendar_new/stores/alarm_list/alarm_list.dart';
import 'package:climate_calendar_new/stores/observable_alarm/observable_alarm.dart';
import 'package:climate_calendar_new/ui/text_scale.dart';
import 'package:climate_calendar_new/ui/top_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
//import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../edit_alarm.dart';

class EditAlarmDays extends StatefulWidget {
  final ObservableAlarm alarm;
  final AlarmListManager? manager;
  final AlarmList? alarms;
  final String? title;

  const EditAlarmDays(this.manager, this.alarms, this.title, {Key? key, required this.alarm}) : super(key: key);

  @override
  State<EditAlarmDays> createState() => _EditAlarmDays();
}

class _EditAlarmDays extends State<EditAlarmDays> {
   String repeatDays = '';
 @override
  void initState() {
                                      if(!this.widget.alarm.days.contains(false)){
                                    repeatDays = 'كل يوم';
                                  }else{
                                          if (this.widget.alarm.saturday == true){ // && !repeatDays.contains(' السبت')
                                    repeatDays = repeatDays + ' السبت';
                                  }

                                  if (this.widget.alarm.sunday == true){ // && !repeatDays.contains(' الأحد')
                                    repeatDays = repeatDays + ' الأحد';
                                  }

                                  if (this.widget.alarm.monday == true ){ //&& !repeatDays.contains(' الاثنين')
                                    repeatDays = repeatDays + ' الاثنين';
                                  }

                                  if (this.widget.alarm.tuesday == true ){ //&& !repeatDays.contains(' الثلاثاء')
                                    repeatDays = repeatDays + ' الثلاثاء';
                                  }
                                  
                                  if (this.widget.alarm.wednesday == true ){ //&& !repeatDays.contains(' الأربعاء')
                                    repeatDays = repeatDays + ' الأربعاء';
                                  }

                                  if (this.widget.alarm.thursday == true ){ //&& !repeatDays.contains(' الخميس')
                                    repeatDays = repeatDays + ' الخميس';
                                  }

                                  if (this.widget.alarm.friday == true ){ //&& !repeatDays.contains(' الجمعة')
                                    repeatDays = repeatDays + ' الجمعة';
                                  }
                                  if (repeatDays == ''){
                                    repeatDays = 'مطلقًا';
                                  }
                                  }
                                  
                                  super.initState();
  }

  @override
  Widget build(BuildContext context) {            
    return 
   // Observer(
     // builder: (context) => 
      Row(
          //fit: BoxFit.scaleDown,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(right: 10)),
            Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.82,
                  alignment: Alignment.centerRight,
                  child: const TextScaleFactorClamper(
                              child:Text(
                    'التكرار',
                    style: TextStyle(fontSize: 20, color: Color(0xff506B75)),
                  )),
                ),
                GestureDetector(
                    onTap: //() { setState(() {RepeatAlarm(alarm: this.widget.alarm); }); }
                    () { setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RepeatAlarm(
                                      this.widget.manager,  this.widget.alarms,  this.widget.title, alarm: this.widget.alarm,
                                  )));
          
                    });
                    },
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Image.asset('assets/images/title_repeat_rec.png',
                            width: MediaQuery.of(context).size.width * 0.85),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.75,
                              child:Padding(padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05),
                        child: TextScaleFactorClamper(
                              child:Text(repeatDays, maxLines: 1, style:  const TextStyle(fontSize: 15, overflow: TextOverflow.ellipsis,  color: Color(0xffA9B7BC))),
                            )))
                      ],
                    ))
                /*
            WeekDayToggle(
              text: 'Mo',
              current: alarm!.monday!,
              onToggle: (monday) => alarm!.monday = monday,
            ),
            WeekDayToggle(
              text: 'Tu',
              current: alarm!.tuesday!,
              onToggle: (tuesday) => alarm!.tuesday = tuesday,
            ),
            WeekDayToggle(
              text: 'We',
              current: alarm!.wednesday!,
              onToggle: (wednesday) => alarm!.wednesday = wednesday,
            ),
            WeekDayToggle(
              text: 'Th',
              current: alarm!.thursday!,
              onToggle: (thursday) => alarm!.thursday = thursday,
            ),
            WeekDayToggle(
              text: 'Fr',
              current: alarm!.friday!,
              onToggle: (friday) => alarm!.friday = friday,
            ),
            WeekDayToggle(
              text: 'Sa',
              current: alarm!.saturday!,
              onToggle: (saturday) => alarm!.saturday = saturday,
            ),
            WeekDayToggle(
              text: 'Su',
              current: alarm!.sunday!,
              onToggle: (sunday) => alarm!.sunday = sunday,
            ),
            */
              ],
            ),
          ]//),
    );
  }
}
/*
class RepeatAlarmState extends StatelessWidget {
  final ObservableAlarm? alarm;

  const RepeatAlarmState({Key? key, this.alarm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepeatAlarm(alarm: this.alarm,);
  }
}
*/


class RepeatAlarm extends StatefulWidget {
  final ObservableAlarm alarm;
  final AlarmListManager? manager;
  final AlarmList? alarms;
  final String? title;

  const RepeatAlarm(this.manager, this.alarms, this.title, {Key? key, required this.alarm}) : super(key: key);

  @override
  State<RepeatAlarm> createState() => _RepeatAlarm();
}

class _RepeatAlarm extends State<RepeatAlarm> {

  late List<bool?> days = [
    this.widget.alarm.sunday,
    this.widget.alarm.monday,
    this.widget.alarm.tuesday,
    this.widget.alarm.wednesday,
    this.widget.alarm.thursday,
    this.widget.alarm.friday,
    this.widget.alarm.saturday
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
                body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/title_repeat_back.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  TopIconsWhite(context, 0),
                  Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              right: 30,
                              top: MediaQuery.of(context).size.height * 0.12)),
                      const TextScaleFactorClamper(
                              child:Text(
                        'التكرار',
                        //textScaleFactor: 1.0,
                        //textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )),
                    ],
                  ),
                  SizedBox(height:  MediaQuery.of(context).size.height * 0.07),
                  Container(
                      height: 380,//MediaQuery.of(context).size.height * 0.45,
                      width: MediaQuery.of(context).size.width * 0.75,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/repeate_list.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.only(right: 20),
                              height: 52,
                              alignment: Alignment.centerRight,
                              child: _eachDay(
                                  day: 'الأحد',
                                  onTapDay: () =>
                                      this.widget.alarm.sunday = days[0],
                                  index: 0)),
                          Container(
                              padding: const EdgeInsets.only(right: 20),
                              height: 52,
                              alignment: Alignment.centerRight,
                              child: _eachDay(
                                  day: 'الاثنين',
                                  onTapDay: () =>
                                      this.widget.alarm.monday = days[1],
                                  index: 1)),
                          Container(
                              padding: const EdgeInsets.only(right: 20),
                              height: 55,
                              alignment: Alignment.centerRight,
                              child: _eachDay(
                                  day: 'الثلاثاء',
                                  onTapDay: () =>
                                      this.widget.alarm.tuesday = days[2],
                                  index: 2)),
                          Container(
                              padding: const EdgeInsets.only(right: 20),
                              height: 55,
                              alignment: Alignment.centerRight,
                              child: _eachDay(
                                  day: 'الأربعاء',
                                  onTapDay: () =>
                                      this.widget.alarm.wednesday = days[3],
                                  index: 3)),
                          Container(
                              padding: const EdgeInsets.only(right: 20),
                              height: 53,
                              alignment: Alignment.centerRight,
                              child: _eachDay(
                                  day: 'الخميس',
                                  onTapDay: () =>
                                      this.widget.alarm.thursday = days[4],
                                  index: 4)),
                          Container(
                              padding: const EdgeInsets.only(right: 20),
                              height: 52,
                              alignment: Alignment.centerRight,
                              child: _eachDay(
                                  day: 'الجمعة',
                                  onTapDay: () =>
                                      this.widget.alarm.friday = days[5],
                                  index: 5)),
                          Container(
                              padding: const EdgeInsets.only(right: 20),
                              height: 52,
                              alignment: Alignment.centerRight,
                              child: _eachDay(
                                  day: 'السبت',
                                  onTapDay: () =>
                                      this.widget.alarm.saturday = days[6],
                                  index: 6)),
                        ],
                      )),
                                                SizedBox(height: 25,),

                  GestureDetector(
                      onTap: (){
                       setState(() {
                        //Navigator.pop(context);
                                              Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditAlarm(
                                    alarm: this.widget.alarm, manager: this.widget.manager, alarms: this.widget.alarms, title: this.widget.title, 
                                  )));

                        //repeatDays = '';
                       // Navigator.pushNamed(context, 'Setting');
                        });
                      },
                        /*
                          Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
                EditAlarmDays(alarm: this.widget.alarm,)));
                */
                      
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/images/ok.png',
                            width:
                                125, //MediaQuery.of(context).size.width * 0.3,
                            height:
                                55, //MediaQuery.of(context).size.height * 0.065,
                            fit: BoxFit.fill,
                          ),
                          const Text(
                            "موافق",
                            textScaleFactor: 1.0,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                                height: 1.5,
                                fontFamily: 'ArbFONTS'),
                          ),
                        ],
                      )),
                ],
              ),
            ));
  }

  Widget _eachDay(
      {required String day, required Function onTapDay, required int index}) {
    return InkWell(
            ///CHECKBOX
            onTap: () {
              setState(() {
                days[index] = !days[index]!;
                onTapDay();
                
                //() => this.onTapDay!(!this.current);
                //onTap;//(sunday) => widget.alarm!.sunday = sunday;
              });
            },
            child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextScaleFactorClamper(
                              child:Text(
                  day,
                  style:
                      const TextStyle(fontSize: 18, color: Color(0xff506B75)),
                )),
                days[index]!
                    ? Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: const Image(
                          image: AssetImage('assets/icons/check.png'),
                          height: 20.0,
                          color: Color(0xff506B75),
                        ))
                    : Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        /*
                        child: const Icon(
                          Icons.circle,
                          size: 30.0,
                          color: Color(0xffE0E7E9),
                        ),
                        */
                      ),
              ],
            )));
  }
}

//class WeekDayList extends
/*
class WeekDayToggle extends StatelessWidget {
  final Function? onToggle;
  final bool current;
  final String text;

  const WeekDayToggle(
      {Key? key, this.onToggle, this.current = false, this.text = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const fontSize = 18.0;
    const size = 25.0;

    return GestureDetector(
      child: SizedBox.fromSize(
        size: Size.fromRadius(size),
        child: Neumorphic(
          style: NeumorphicStyle(
            depth: this.current ? 2 : 0,
            intensity: this.current ? 0.7 : 0,
            //boxShape: NeumorphicBoxShape.circle(),
          ),
          child: Container(
            width: size,
            height: size,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                this.text,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight:
                      this.current ? FontWeight.bold : FontWeight.normal,
                  color: this.current
                      ? CustomColors.sdPrimaryColor
                      : CustomColors.sdPrimaryColor.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      ),
      //onTap: () => this.onToggle!(!this.current),
    );
  }
}
*/
