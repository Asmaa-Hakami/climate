//import 'dart:html';

//import 'dart:convert';

//import 'package:climate_calendar_new/get_location.dart';
import 'package:climate_calendar_new/stores/observable_alarm/observable_alarm.dart';
import 'package:climate_calendar_new/ui/text_scale.dart';
//import 'package:climate_calendar_new/widgets/rounded_button.dart';
//import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

//import 'package:flutter_picker/flutter_picker.dart';

//import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:flutter/cupertino.dart';

//import 'package:intl/intl.dart';


class EditAlarmTime extends StatefulWidget {
  final ObservableAlarm alarm;

  const EditAlarmTime({Key? key, required this.alarm}) : super(key: key);

  @override
  State<EditAlarmTime> createState() => _EditAlarmTimeState();
}

class _EditAlarmTimeState extends State<EditAlarmTime> {
  var minutesController = TextEditingController(text: '');
  var hoursController = TextEditingController(text: '');
  late String dropdownvalue = widget.alarm.hour.toString();
  late String image = widget.alarm.period == 'am'
      ? 'assets/images/am.png'
      : 'assets/images/pm.png';
      
  late FixedExtentScrollController firstController;
  late FixedExtentScrollController secondController;
  @override
  void initState() {
    super.initState();
    firstController = FixedExtentScrollController(initialItem:  widget.alarm.minute!);
    secondController = FixedExtentScrollController(initialItem: widget.alarm.hour! - 1);
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    super.dispose();
  }
  /*
@override
void initState() {
super.initState();
}
*/
  @override
  Widget build(BuildContext context) {
    return Center(
      //child: GestureDetector(
      child: Observer(builder: (context) {
        //final hours = widget.alarm.hour.toString().padLeft(2, '0');
        //final minutes = widget.alarm.minute.toString().padLeft(2, '0');

        return Column(
          children: [
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.065,
                  left: 9,
                ),
                child: 
                Container(
                  padding: EdgeInsets.only(left: 10),
                    //padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.12),
                    width:  MediaQuery.of(context).size.width * 0.2,//130,
                    alignment: Alignment.center,
                    
                child: const TextScaleFactorClamper(
                              child:Text(
                  'دقيقة',
                  style: TextStyle(color: Color(0xff4C7884), height: 0.8),
                )))),
                              Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.065,
                  left: 9),
                child:Container(
                  //padding: EdgeInsets.only(right: 10),
                    //padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.085)
                    width:  MediaQuery.of(context).size.width * 0.2,//100,
                    alignment: Alignment.center,
                child: const TextScaleFactorClamper(
                              child:Text(
                  'ساعة',
                  style: TextStyle(color: Color(0xff4C7884), height: 0.8),
                )))),
              ],
            ),
            Row(children: [
              Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.065,
                  left: 9,
                  top: 4,
                  bottom: MediaQuery.of(context).size.height * 0.05,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.055,
                  width: MediaQuery.of(context).size.width * 0.2,
                                    decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/time_box.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  //child: Expanded(
            //child: Center(
              child: CupertinoPicker(
            magnification: 0.0001,
                itemExtent: 60,
                looping: true,
                scrollController: firstController,
                onSelectedItemChanged: (int value) =>  this.widget.alarm.minute = value,
                children: List<Widget>.generate(60, (int index) {
                  return Center(
                    child: TextScaleFactorClamper(
                              child:Text(
                      (index++).toString(), style: TextStyle(color: Color(0xff506B75)),
                    )),
                  );
                }),
              ),
            //),
         // ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  top: 4,
                  bottom: MediaQuery.of(context).size.height * 0.05,
                ),
                child: Image.asset('assets/icons/points.png', width: 10,)
              ),



              Padding(
                padding: EdgeInsets.only(
                  right: 9,
                  bottom: MediaQuery.of(context).size.height * 0.05,
                  top: 4,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.055,
                  width: MediaQuery.of(context).size.width * 0.2,
                                    decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/time_box.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  //child: Expanded(
              child: CupertinoPicker(
            magnification: 0.0001,
                itemExtent: 60,
                looping: true,
                scrollController: secondController,
                onSelectedItemChanged: (int value) =>  this.widget.alarm.hour = value + 1,
                children: List<Widget>.generate(12, (int index) {
                  return Center(
                    child:TextScaleFactorClamper(
                              child:Text(
                      (++index).toString(),style: TextStyle(color: Color(0xff506B75))
                    )),
                  );
                }),
             // ),
            //),
          ),
                ),

                  )
            ]),

                                                Container(
                  //width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.055,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                 child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                 GestureDetector(
                        onTap: () {
                          setState(() {
                            image = 'assets/images/am.png';
                            widget.alarm.period = 'am'; //'م';
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.18,
                          height: MediaQuery.of(context).size.height * 0.06,
                          alignment: Alignment.center,
                          //padding: EdgeInsets.only(
                            //  right: MediaQuery.of(context).size.width * 0.2),
                          child:
                    const TextScaleFactorClamper(
                              child:Text(
                      'صباح',
                      //textScaleFactor: 1.0,
                         style: TextStyle(
                                color: Color(0xff506B75),
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                          fontFamily: 'ArbFONTS'),
                    ),
                    )   )),

                                         GestureDetector(
                        onTap: () {
                          setState(() {
                            image = 'assets/images/pm.png';
                            widget.alarm.period = 'pm'; //'م';
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.18,
                          height: MediaQuery.of(context).size.height * 0.06,
                          alignment: Alignment.center,
                          //padding: EdgeInsets.only(
                            //  right: MediaQuery.of(context).size.width * 0.2),
                          child:
                    const TextScaleFactorClamper(
                              child:Text(
                      'مساء',
                      //textScaleFactor: 1.0,
                         style: TextStyle(
                                color: Color(0xff506B75),
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                          fontFamily: 'ArbFONTS'),
                    )
                                         ))),
                  ],
              ),
                                    ),
          ],
        );
      }),
    );
  }
}
