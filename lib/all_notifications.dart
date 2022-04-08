// ignore: import_of_legacy_library_into_null_safe
import 'package:adhan/adhan.dart';
import 'package:climate_calendar_new/all_data.dart';

import 'dates.dart';
import 'get_location.dart';
import 'notification_service.dart';
import 'package:intl/intl.dart';

class AllNotifications {
  static PrayerTimes? prayerTimes;
   static DateTime mToday = DateTime.now(); 


static void prayerNotifications(){
      getLocationData().then((locationData) {
         DateTime now = DateTime.now(); 
      if (locationData != null) {
        for (var i = 0; i < 5; i++) {
          prayerTimes = PrayerTimes(
              Coordinates(locationData.latitude, locationData.longitude),
              DateComponents.from(now.add(Duration(days: i))),
              CalculationMethod.umm_al_qura.getParameters());
          if (i == 0 && mToday.isAfter(prayerTimes!.fajr)) {

            if (mToday.isBefore(prayerTimes!.dhuhr)) {
              NotificationService.azanScheduleNotifications(
                body: ('الظهر'),
                payload: '0',
                schedualedDate: DateTime(prayerTimes!.dhuhr.year, prayerTimes!.dhuhr.month, prayerTimes!.dhuhr.day, prayerTimes!.dhuhr.hour, prayerTimes!.dhuhr.minute), //prayerTimes!.isha//'2022-01-07 01:48'
              );
              
              NotificationService.azanScheduleNotifications(
                body: ('العصر'),
                payload: '0',
                schedualedDate: DateTime(prayerTimes!.asr.year, prayerTimes!.asr.month, prayerTimes!.asr.day, prayerTimes!.asr.hour, prayerTimes!.asr.minute), //prayerTimes!.isha//'2022-01-07 01:48'
              );
              NotificationService.azanScheduleNotifications(
                body: ('المغرب'),
                payload: '0',
                schedualedDate: DateTime(prayerTimes!.maghrib.year, prayerTimes!.maghrib.month, prayerTimes!.maghrib.day, prayerTimes!.maghrib.hour, prayerTimes!.maghrib.minute), //prayerTimes!.isha//'2022-01-07 01:48'
              );
              NotificationService.azanScheduleNotifications(
                body: ('العشاء'),
                payload: '0',
                schedualedDate: DateTime(prayerTimes!.isha.year, prayerTimes!.isha.month, prayerTimes!.isha.day, prayerTimes!.isha.hour, prayerTimes!.isha.minute), //prayerTimes!.isha//'2022-01-07 01:48'
              );
            } else if (mToday.isBefore(prayerTimes!.asr)) {
              NotificationService.azanScheduleNotifications(
                body: ('العصر'),
                payload: '0',
                schedualedDate: DateTime(prayerTimes!.asr.year, prayerTimes!.asr.month, prayerTimes!.asr.day, prayerTimes!.asr.hour, prayerTimes!.asr.minute), //prayerTimes!.isha//'2022-01-07 01:48'
              );
              NotificationService.azanScheduleNotifications(
                body: ('المغرب'),
                payload: '0',
                schedualedDate: DateTime(prayerTimes!.maghrib.year, prayerTimes!.maghrib.month, prayerTimes!.maghrib.day, prayerTimes!.maghrib.hour, prayerTimes!.maghrib.minute), //prayerTimes!.isha//'2022-01-07 01:48'
              );
              NotificationService.azanScheduleNotifications(
                body: ('العشاء'),
                payload: '0',
                schedualedDate: DateTime(prayerTimes!.isha.year, prayerTimes!.isha.month, prayerTimes!.isha.day, prayerTimes!.isha.hour, prayerTimes!.isha.minute), //prayerTimes!.isha//'2022-01-07 01:48'
              );
            } else if (mToday.isBefore(prayerTimes!.maghrib)) {
              NotificationService.azanScheduleNotifications(
                body: ('المغرب'),
                payload: '0',
                schedualedDate: DateTime(prayerTimes!.maghrib.year, prayerTimes!.maghrib.month, prayerTimes!.maghrib.day, prayerTimes!.maghrib.hour, prayerTimes!.maghrib.minute), //prayerTimes!.isha//'2022-01-07 01:48'
              );
              NotificationService.azanScheduleNotifications(
                body: ('العشاء'),
                payload: '0',
                schedualedDate: DateTime(prayerTimes!.isha.year, prayerTimes!.isha.month, prayerTimes!.isha.day, prayerTimes!.isha.hour, prayerTimes!.isha.minute), //prayerTimes!.isha//'2022-01-07 01:48'
              );
            } else if (mToday.isBefore(prayerTimes!.isha)) {
              NotificationService.azanScheduleNotifications(
                body: ('العشاء'),
                payload: '0',
                schedualedDate: DateTime(prayerTimes!.isha.year, prayerTimes!.isha.month, prayerTimes!.isha.day, prayerTimes!.isha.hour, prayerTimes!.isha.minute), //prayerTimes!.isha//'2022-01-07 01:48'
              );
            } else {}

          } else {
            NotificationService.azanScheduleNotifications(
              body: ('الفجر'),
              payload: '0',
                schedualedDate: DateTime(prayerTimes!.fajr.year, prayerTimes!.fajr.month, prayerTimes!.fajr.day, prayerTimes!.fajr.hour, prayerTimes!.fajr.minute), //prayerTimes!.isha//'2022-01-07 01:48'
            );
              NotificationService.azanScheduleNotifications(
                body: ('الظهر'),
                payload: '0',
                schedualedDate: DateTime(prayerTimes!.dhuhr.year, prayerTimes!.dhuhr.month, prayerTimes!.dhuhr.day, prayerTimes!.dhuhr.hour, prayerTimes!.dhuhr.minute), //prayerTimes!.isha//'2022-01-07 01:48'
              );
              
              NotificationService.azanScheduleNotifications(
                body: ('العصر'),
                payload: '0',
                schedualedDate: DateTime(prayerTimes!.asr.year, prayerTimes!.asr.month, prayerTimes!.asr.day, prayerTimes!.asr.hour, prayerTimes!.asr.minute), //prayerTimes!.isha//'2022-01-07 01:48'
              );
              NotificationService.azanScheduleNotifications(
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
      }
      });
}


  static Future<void> appNotifications() async {
   //LocationData? locationData = await getLocationData();  
    prayerNotifications();
    
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
