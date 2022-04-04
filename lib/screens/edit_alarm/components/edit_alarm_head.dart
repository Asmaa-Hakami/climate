
import 'package:climate_calendar_new/stores/observable_alarm/observable_alarm.dart';
import 'package:climate_calendar_new/ui/text_scale.dart';
import 'package:climate_calendar_new/ui/top_icons.dart';
import 'package:flutter/material.dart';


class EditAlarmHead extends StatefulWidget {
  final ObservableAlarm alarm;

  const EditAlarmHead({Key? key, required this.alarm}) : super(key: key);

  @override
  State<EditAlarmHead> createState() => _EditAlarmHeadState();
}

class _EditAlarmHeadState extends State<EditAlarmHead> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Padding(padding: EdgeInsets.only(right: 10)),
      Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.82,
              alignment: Alignment.centerRight,
              child: const TextScaleFactorClamper(
                              child:Text(
                'العنوان',
                style: TextStyle(fontSize: 20, color: Color(0xff506B75)),
              )),
            ),
            GestureDetector(
                onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => AlarmTitle(alarm: this.widget.alarm)));
                  //context.pushRoute(g.AlarmTitle(alarm: this.widget.alarm));
                },
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Image.asset('assets/images/title_repeat_rec.png',
                        width: MediaQuery.of(context).size.width * 0.85),
                        Padding(                  
                          padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05),

                    child: TextScaleFactorClamper(
                              child:Text(this.widget.alarm.name.toString(), style:  const TextStyle(fontSize: 15, color: Color(0xffA9B7BC)),))
                        )
                  ],
                ))
          ])
    ]);
  }
}



// ignore: must_be_immutable
class AlarmTitle extends StatelessWidget {
  final ObservableAlarm alarm;
  AlarmTitle({Key? key, required this.alarm}) : super(key: key);

  late TextEditingController nameController = TextEditingController(text: this.alarm.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: SafeArea(
            top: false,
            bottom: false,
            child: SingleChildScrollView(
        child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
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
                    'العنوان',
                    textScaleFactor: 1.0,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.13,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/title_box.png'),
                      fit: BoxFit.fill //fitHeight,
                      ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05),
                child: TextScaleFactorClamper(
                              child:TextFormField(
                  showCursor: true,
                  cursorColor: const Color(0xFF5D5C5D),
                  autocorrect: true,
                  autofocus: false,
                  decoration: const InputDecoration(border: InputBorder.none),
                  textAlign: TextAlign.right,
                  controller: nameController,
                  onChanged: (newName) => newName == '' ? this.alarm.name == '' : this.alarm.name = nameController.text,  //newName == '' ? widget.alarm.name == 'منبه جديد' :
                ),))
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              GestureDetector(
                  onTap: () {
                   // nameController.text == ''
                     //   ? this.alarm.name == 'المنبه'
                       // : this.alarm.name = nameController.text; //newName == '' ? widget.alarm.name == 'منبه جديد' :
                    Navigator.pop(context);
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/ok.png',
                        width: 125, //MediaQuery.of(context).size.width * 0.3,
                        height: 55, //MediaQuery.of(context).size.height * 0.065,
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
        )))
        ));
  }
}
