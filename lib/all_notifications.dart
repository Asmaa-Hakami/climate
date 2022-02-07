import 'package:adhan/adhan.dart';
import 'package:climate_calendar_new/all_data.dart';
import 'package:location/location.dart';

import 'dates.dart';
import 'get_location.dart';
import 'notification_service.dart';
import 'package:intl/intl.dart';

class AllNotifications {
  static PrayerTimes? prayerTimes; //= PrayerTimes.today(, calculationParameters);
  //Prayer? next;
  final location = Location();
   static DateTime mToday = DateTime.now(); // DateTime(2021, 1, 22, 12, 32); // 


static void prayerNotifications(locationData){
      //getLocationData().then((locationData) {
         DateTime now = DateTime.now(); 
      if (locationData != null) {
        for (var i = 0; i < 7; i++) {
          prayerTimes = PrayerTimes(
              Coordinates(locationData.latitude, locationData.longitude),
              DateComponents.from(now.add(Duration(days: i))),
              CalculationMethod.umm_al_qura.getParameters());
          if (i == 0 && mToday.isAfter(prayerTimes!.fajr)) {

            if (mToday.isBefore(prayerTimes!.dhuhr)) {
              NotificationService.azanScheduleNotifications(
                //title: formattedPrayerName(next!).toString(),
                body: ('الظهر'),
                payload: '0',
                schedualedDate: DateTime(prayerTimes!.dhuhr.year, prayerTimes!.dhuhr.month, prayerTimes!.dhuhr.day, prayerTimes!.dhuhr.hour, prayerTimes!.dhuhr.minute), //prayerTimes!.isha//'2022-01-07 01:48'
                //'2022-01-07 01:48'  //'${now.year}-${now.month}-${now.day} ' + DateFormat.jm().format(
              );//DateFormat('yyyyy-MM-dd h:mm').parse('${prayerTimes!.dhuhr}'),
              
              NotificationService.azanScheduleNotifications(
                //title: formattedPrayerName(next!).toString(),
                body: ('العصر'),
                payload: '0',
                schedualedDate: DateTime(prayerTimes!.asr.year, prayerTimes!.asr.month, prayerTimes!.asr.day, prayerTimes!.asr.hour, prayerTimes!.asr.minute), //prayerTimes!.isha//'2022-01-07 01:48'
              );
              NotificationService.azanScheduleNotifications(
                //title: formattedPrayerName(next!).toString(),
                body: ('المغرب'),
                payload: '0',
                schedualedDate: DateTime(prayerTimes!.maghrib.year, prayerTimes!.maghrib.month, prayerTimes!.maghrib.day, prayerTimes!.maghrib.hour, prayerTimes!.maghrib.minute), //prayerTimes!.isha//'2022-01-07 01:48'
              );
              NotificationService.azanScheduleNotifications(
                //title: formattedPrayerName(next!).toString(),
                body: ('العشاء'),
                payload: '0',
                schedualedDate: DateTime(prayerTimes!.isha.year, prayerTimes!.isha.month, prayerTimes!.isha.day, prayerTimes!.isha.hour, prayerTimes!.isha.minute), //prayerTimes!.isha//'2022-01-07 01:48'
              );
            } else if (mToday.isBefore(prayerTimes!.asr)) {
              NotificationService.azanScheduleNotifications(
                //title: formattedPrayerName(next!).toString(),
                body: ('العصر'),
                payload: '0',
                schedualedDate: DateTime(prayerTimes!.asr.year, prayerTimes!.asr.month, prayerTimes!.asr.day, prayerTimes!.asr.hour, prayerTimes!.asr.minute), //prayerTimes!.isha//'2022-01-07 01:48'
              );
              NotificationService.azanScheduleNotifications(
                //title: formattedPrayerName(next!).toString(),
                body: ('المغرب'),
                payload: '0',
                schedualedDate: DateTime(prayerTimes!.maghrib.year, prayerTimes!.maghrib.month, prayerTimes!.maghrib.day, prayerTimes!.maghrib.hour, prayerTimes!.maghrib.minute), //prayerTimes!.isha//'2022-01-07 01:48'
              );
              NotificationService.azanScheduleNotifications(
                //title: formattedPrayerName(next!).toString(),
                body: ('العشاء'),
                payload: '0',
                schedualedDate: DateTime(prayerTimes!.isha.year, prayerTimes!.isha.month, prayerTimes!.isha.day, prayerTimes!.isha.hour, prayerTimes!.isha.minute), //prayerTimes!.isha//'2022-01-07 01:48'
              );
            } else if (mToday.isBefore(prayerTimes!.maghrib)) {
              NotificationService.azanScheduleNotifications(
                //title: formattedPrayerName(next!).toString(),
                body: ('المغرب'),
                payload: '0',
                schedualedDate: DateTime(prayerTimes!.maghrib.year, prayerTimes!.maghrib.month, prayerTimes!.maghrib.day, prayerTimes!.maghrib.hour, prayerTimes!.maghrib.minute), //prayerTimes!.isha//'2022-01-07 01:48'
              );
              NotificationService.azanScheduleNotifications(
                //title: formattedPrayerName(next!).toString(),
                body: ('العشاء'),
                payload: '0',
                schedualedDate: DateTime(prayerTimes!.isha.year, prayerTimes!.isha.month, prayerTimes!.isha.day, prayerTimes!.isha.hour, prayerTimes!.isha.minute), //prayerTimes!.isha//'2022-01-07 01:48'
              );
            } else if (mToday.isBefore(prayerTimes!.isha)) {
              NotificationService.azanScheduleNotifications(
                //title: formattedPrayerName(next!).toString(),
                body: ('العشاء'),
                payload: '0',
                schedualedDate: DateTime(prayerTimes!.isha.year, prayerTimes!.isha.month, prayerTimes!.isha.day, prayerTimes!.isha.hour, prayerTimes!.isha.minute), //prayerTimes!.isha//'2022-01-07 01:48'
              );
            } else {}

          } else {
            NotificationService.azanScheduleNotifications(
              //title: formattedPrayerName(next!).toString(),
              body: ('الفجر'),
              payload: '0',
                schedualedDate: DateTime(prayerTimes!.fajr.year, prayerTimes!.fajr.month, prayerTimes!.fajr.day, prayerTimes!.fajr.hour, prayerTimes!.fajr.minute), //prayerTimes!.isha//'2022-01-07 01:48'
            );
              NotificationService.azanScheduleNotifications(
                //title: formattedPrayerName(next!).toString(),
                body: ('الظهر'),
                payload: '0',
                schedualedDate: DateTime(prayerTimes!.dhuhr.year, prayerTimes!.dhuhr.month, prayerTimes!.dhuhr.day, prayerTimes!.dhuhr.hour, prayerTimes!.dhuhr.minute), //prayerTimes!.isha//'2022-01-07 01:48'
                //'2022-01-07 01:48'  //'${now.year}-${now.month}-${now.day} ' + DateFormat.jm().format(
              );//DateFormat('yyyyy-MM-dd h:mm').parse('${prayerTimes!.dhuhr}'),
              
              NotificationService.azanScheduleNotifications(
                //title: formattedPrayerName(next!).toString(),
                body: ('العصر'),
                payload: '0',
                schedualedDate: DateTime(prayerTimes!.asr.year, prayerTimes!.asr.month, prayerTimes!.asr.day, prayerTimes!.asr.hour, prayerTimes!.asr.minute), //prayerTimes!.isha//'2022-01-07 01:48'
              );
              NotificationService.azanScheduleNotifications(
                //title: formattedPrayerName(next!).toString(),
                body: ('المغرب'),
                payload: '0',
                schedualedDate: DateTime(prayerTimes!.maghrib.year, prayerTimes!.maghrib.month, prayerTimes!.maghrib.day, prayerTimes!.maghrib.hour, prayerTimes!.maghrib.minute), //prayerTimes!.isha//'2022-01-07 01:48'
              );
              NotificationService.azanScheduleNotifications(
                //title: formattedPrayerName(next!).toString(),
                body: ('العشاء'),
                payload: '0',
                schedualedDate: DateTime(prayerTimes!.isha.year, prayerTimes!.isha.month, prayerTimes!.isha.day, prayerTimes!.isha.hour, prayerTimes!.isha.minute), //prayerTimes!.isha//'2022-01-07 01:48'
              );
          }
        }}
      else{
        print('Location Error');
      }
}


  static Future<void> appNotifications() async {
   LocationData? locationData = await getLocationData();  

    prayerNotifications(locationData);

/*
    for (var i = 0; i < AllData.seasinsInfo.length; i++) {
      for (var j = 0; j < AllData.seasinsInfo[i][2].length; j++) {
        if  (mToday.isBefore(AllData.seasinsInfo[i][2][j][1])) {
          NotificationService.datesScheduleNotifications(
            title: AllDates.replaceEngNumber(
                    AllData.seasinsInfo[i][2][j][1].day.toString()) + ' ' +
                AllDates.replaceToEngMonth(DateFormat('MMM')
                    .format(AllData.seasinsInfo[i][2][j][1])
                    .toString()),
            body: 'بداية موسم ' + AllData.seasinsInfo[i][2][j][0],
            payload: '0',
            schedualedDate: DateTime(
                AllData.seasinsInfo[i][2][j][1].year,
                AllData.seasinsInfo[i][2][j][1].month,
                AllData.seasinsInfo[i][2][j][1].day,
                0,
                0),
          );
        }
      }
    }
    */
        for (var i = 0; i < AllData.zodiacDates.length; i++) {
        if  (mToday.isBefore(AllData.zodiacDates[i][1])) {
          NotificationService.datesScheduleNotifications(
            title: AllDates.replaceEngNumber(
                    AllData.zodiacDates[i][1].day.toString()) + ' ' +
                AllDates.replaceToEngMonth(DateFormat('MMM')
                    .format(AllData.zodiacDates[i][1])
                    .toString()),
            body: 'بداية موسم ' + AllData.zodiacDates[i][0],
            payload: '0',
            schedualedDate: DateTime(
                AllData.zodiacDates[i][1].year,
                AllData.zodiacDates[i][1].month,
                AllData.zodiacDates[i][1].day,
                0,
                0),
          );
        }
    }
    
    

//_____________________________________________________TEST_____________________________________________________

/*
          //if (mToday.isAfter(prayerTimes!.isha)) {
                      prayerTimes = PrayerTimes(
              Coordinates(locationData!.latitude, locationData.longitude),
              DateComponents.from(mToday),
              CalculationMethod.umm_al_qura.getParameters());

              print(prayerTimes!.maghrib);

              NotificationService.azanScheduleNotifications(
                //title: formattedPrayerName(next!).toString(),
                body: ('لحاله المغرب'),
                payload: '0',
                schedualedDate: 
                prayerTimes!.maghrib //'2022-01-07 01:48'
              );

    
                    NotificationService.azanScheduleNotifications(
      title: AllDates.replaceEngNumber(AllData.summerDate[0].day.toString()) + AllDates.replaceToEngMonth(DateFormat('MMM').format(AllData.summerDate[0]).toString()),
      body: '  دخول صلاة المغرب',
      payload: '0',
      schedualedDate: DateTime(mToday.year, mToday.month, mToday.day , 9, 19), //prayerTimes!.maghrib,
    );
                    NotificationService.azanScheduleNotifications(
      title: AllDates.replaceEngNumber(AllData.summerDate[0].day.toString()) + AllDates.replaceToEngMonth(DateFormat('MMM').format(AllData.summerDate[0]).toString()),
      body: ' 2 دخول صلاة المغرب',
      payload: '0',
      schedualedDate: DateTime(mToday.year, mToday.month, mToday.day , 9, 20), //prayerTimes!.maghrib,
    );

          NotificationService.datesScheduleNotifications(
           // id: dateID + 2,
      title: 'hhh',
      body: 'دخول الخريف',
      payload: '0',
      schedualedDate: DateTime(mToday.year, mToday.month, mToday.day , 9, 21),
      
    );
         // }
          
    

                NotificationService.azanScheduleNotifications(
      title: AllDates.replaceEngNumber(AllData.summerDate[0].day.toString()) + AllDates.replaceToEngMonth(DateFormat('MMM').format(AllData.summerDate[0]).toString()),
      body: ' 2 دخول صلاة المغرب',
      payload: '0',
      schedualedDate: DateTime(mToday.year, mToday.month, mToday.day , 19, 25), //prayerTimes!.maghrib,
    );
    

        NotificationService.azanScheduleNotifications(
      title: AllDates.replaceEngNumber(AllData.summerDate[0].day.toString()) + AllDates.replaceToEngMonth(DateFormat('MMM').format(AllData.summerDate[0]).toString()),
      body: 'دخول صلاة المغرب',
      payload: '0',
      schedualedDate: prayerTimes!.isha, // DateTime(mToday.year, mToday.month, mToday.day , 16, 44), //prayerTimes!.maghrib,
    );
    */
        //    }
            
//_____________________________________________________TEST_____________________________________________________

    

    if (AllData.summerDate[0].isAfter(mToday)) {
      NotificationService.datesScheduleNotifications(
        title: AllDates.replaceEngNumber(AllData.summerDate[0].day.toString()) +
            AllDates.replaceToEngMonth(
                DateFormat('MMM').format(AllData.summerDate[0]).toString()),
        body: 'دخول فصل الصيف',
        payload: '0',
        schedualedDate: DateTime(mToday.year, AllData.summerDate[0].month,
            AllData.summerDate[0].day, 0, 0),
      );
    }
    if (AllData.sunQabaDate1.isAfter(mToday)) {
      NotificationService.datesScheduleNotifications(
        title: AllDates.replaceEngNumber(AllData.sunQabaDate1.day.toString()) +
            AllDates.replaceToEngMonth(
                DateFormat('MMM').format(AllData.sunQabaDate1).toString()),
        body: 'تعامد الشمس على الكعبة التعامد الأول',
        payload: '0',
        schedualedDate: DateTime(mToday.year, AllData.sunQabaDate1.month,
            AllData.sunQabaDate1.day, 0, 0),
      );
    }

    if (AllData.sunSaratan.isAfter(mToday)) {
      NotificationService.datesScheduleNotifications(
        title: AllDates.replaceEngNumber(AllData.sunSaratan.day.toString()) +
            AllDates.replaceToEngMonth(
                DateFormat('MMM').format(AllData.sunSaratan).toString()),
        body: 'تعامد الشمس على مدار السرطان',
        payload: '0',
        schedualedDate: DateTime(mToday.year, AllData.sunSaratan.month,
            AllData.sunSaratan.day, 0, 0),
      );
    }

    if (AllData.sunQabaDate2.isAfter(mToday)) {
      NotificationService.datesScheduleNotifications(
        title: AllDates.replaceEngNumber(AllData.sunQabaDate2.day.toString()) +
            AllDates.replaceToEngMonth(
                DateFormat('MMM').format(AllData.sunQabaDate2).toString()),
        body: 'تعامد الشمس على الكعبة التعامد الثاني',
        payload: '0',
        schedualedDate: DateTime(mToday.year, AllData.sunQabaDate2.month,
            AllData.sunQabaDate2.day, 0, 0),
      );
    }

    if (AllData.autumnDate[0].isAfter(mToday)) {
      NotificationService.datesScheduleNotifications(
        title: AllDates.replaceEngNumber(AllData.autumnDate[0].day.toString()) +
            AllDates.replaceToEngMonth(
                DateFormat('MMM').format(AllData.autumnDate[0]).toString()),
        body: 'دخول فصل الخريف',
        payload: '0',
        schedualedDate: DateTime(mToday.year, AllData.autumnDate[0].month,
            AllData.autumnDate[0].day, 0, 0),
      );
    }

    if (AllData.sunLineDate2.isAfter(mToday)) {
      NotificationService.datesScheduleNotifications(
        title: AllDates.replaceEngNumber(AllData.sunLineDate2.day.toString()) +
            AllDates.replaceToEngMonth(
                DateFormat('MMM').format(AllData.sunLineDate2).toString()),
        body: 'تعامد الشمس على خط الاستواء',
        payload: '0',
        schedualedDate: DateTime(mToday.year, AllData.sunLineDate2.month,
            AllData.sunLineDate2.day, 0, 0),
      );
    }

    if (AllData.equalAMPM.isAfter(mToday)) {
      NotificationService.datesScheduleNotifications(
        title: AllDates.replaceEngNumber(AllData.equalAMPM.day.toString()) +
            AllDates.replaceToEngMonth(
                DateFormat('MMM').format(AllData.equalAMPM).toString()),
        body: 'تساوي الليل والنهار',
        payload: '0',
        schedualedDate: DateTime(
            mToday.year, AllData.equalAMPM.month, AllData.equalAMPM.day, 0, 0),
      );
    }

    if (AllData.winterDate[0].isAfter(mToday)) {
      NotificationService.datesScheduleNotifications(
        title: AllDates.replaceEngNumber(AllData.winterDate[0].day.toString()) +
            AllDates.replaceToEngMonth(
                DateFormat('MMM').format(AllData.winterDate[0]).toString()),
        body: 'دخول فصل الشتاء',
        payload: '0',
        schedualedDate: DateTime(mToday.year, AllData.winterDate[0].month,
            AllData.winterDate[0].day, 0, 0),
      );
    }

    if (AllData.sunJadi.isAfter(mToday)) {
      NotificationService.datesScheduleNotifications(
        title: AllDates.replaceEngNumber(AllData.sunJadi.day.toString()) +
            AllDates.replaceToEngMonth(
                DateFormat('MMM').format(AllData.sunJadi).toString()),
        body: 'تعامد الشمس على مدار الجدي',
        payload: '0',
        schedualedDate: DateTime(
            mToday.year, AllData.sunJadi.month, AllData.sunJadi.day, 0, 0),
      );
    }

    if (AllData.springDate[0].isAfter(mToday)) {
      NotificationService.datesScheduleNotifications(
        title: AllDates.replaceEngNumber(AllData.springDate[0].day.toString()) +
            AllDates.replaceToEngMonth(
                DateFormat('MMM').format(AllData.springDate[0]).toString()),
        body: 'دخول فصل الربيع',
        payload: '0',
        schedualedDate: DateTime(mToday.year, AllData.springDate[0].month,
            AllData.springDate[0].day, 0, 0),
      );
    }

    if (AllData.sunLineDate1.isAfter(mToday)) {
      NotificationService.datesScheduleNotifications(
        title: AllDates.replaceEngNumber(AllData.sunLineDate1.day.toString()) +
            AllDates.replaceToEngMonth(
                DateFormat('MMM').format(AllData.sunLineDate1).toString()),
        body: 'تعامد الشمس على خط الاستواء',
        payload: '0',
        schedualedDate: DateTime(mToday.year, AllData.sunLineDate1.month,
            AllData.sunLineDate1.day, 0, 0),
      );
    }
    
    
  }
}
