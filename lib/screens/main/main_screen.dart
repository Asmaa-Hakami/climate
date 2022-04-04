import 'package:climate_calendar_new/services/alarm_list_manager.dart';
import 'package:climate_calendar_new/services/alarm_scheduler.dart';
import 'package:climate_calendar_new/stores/alarm_list/alarm_list.dart';
import 'package:climate_calendar_new/stores/observable_alarm/observable_alarm.dart';
import 'package:climate_calendar_new/ui/navdraw.dart';
import 'package:climate_calendar_new/ui/text_scale.dart';
import 'package:climate_calendar_new/ui/top_icons.dart';
import 'package:climate_calendar_new/widgets/alarm_item/alarm_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import '../edit_alarm/edit_alarm.dart';

class MainScreen extends StatefulWidget {
  final AlarmList alarms;

  const MainScreen({Key? key, required this.alarms}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final alarms = widget.alarms;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: []); // fullscreen
    final AlarmListManager _manager = AlarmListManager(alarms);
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/alarm_back.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: <Widget>[
              TopIconsWhite(context, 1),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 15, bottom: 10), //top: 64
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TextScaleFactorClamper(
                            child: Text('المنبه',
                                style: TextStyle(
                                    fontFamily: 'ArbFONTS',
                                    fontSize: 30,
                                    color: Colors.white)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: GestureDetector(
                              onTap: () {
                                addAlarm(_manager);
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icons/add_alarm.png',
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                  ),
                                  const Text(
                                    '     منبه جديد',
                                    textScaleFactor: 1.0,
                                    style: TextStyle(
                                        color: Color(0xff506B75),
                                        fontSize: 17,
                                        height: 0.1),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      Flexible(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Observer(
                                builder: (context) => ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      final alarm = alarms.alarms[index];

                                      return Dismissible(
                                        key: Key(alarm.id.toString()),
                                        child: AlarmItem(
                                          alarm: alarm,
                                          manager: _manager,
                                          alarms: alarms,
                                        ),
                                        onDismissed: (_) {
                                          AlarmScheduler().clearAlarm(alarm);
                                          alarms.alarms.removeAt(index);
                                        },
                                      );
                                    },
                                    itemCount: alarms.alarms.length,
                                    separatorBuilder: (context, index) =>
                                        const Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 20)) //const Divider(),

                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: const NavigationDrawer(),
    );
  }

  void addAlarm(_manager) {
    TimeOfDay tod = TimeOfDay.fromDateTime(DateTime.now());
    final newAlarm = ObservableAlarm.dayList(
        widget.alarms.alarms.length,
        '',
        tod.hourOfPeriod, //tod.hour,
        tod.minute,
        tod.period.toString().substring(
              10,
            ),
        0.7,
        false,
        true,
        List.filled(7, false),
        ObservableList<String>.of([]),
        <String>[]);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditAlarm(
            alarm: newAlarm,
            manager: _manager,
            alarms: widget.alarms,
            title: 'إضافة المنبه',
          ),
        ));
  }
}
