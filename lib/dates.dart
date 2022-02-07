
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

class AllDates{

  static DateTime mToday = DateTime.now();
  static int mnum = mToday.month;
  static String mDate = replaceEngNumber(mToday.day.toString());
  static String mMonth = replaceToEngMonth(DateFormat('MMM').format(mToday));
  static String mYear = replaceEngNumber(mToday.year.toString());

  static final HijriCalendar _today = HijriCalendar.now();
  static String hday = replaceEngDay(_today.dayWeName);
  static String hYear = replaceEngNumber(_today.hYear.toString());
  static String hMonth =
      replaceEngMonth(_today.hMonth.toString()); //Rabi' al-awwal
  static String hdate = replaceEngNumber(_today.hDay.toString());
  
   static String replaceEngDay(String day) {
    const english = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday'
    ];
    const arab = [
      'الأحد',
      'الاثنين',
      'الثلاثاء',
      'الأربعاء',
      'الخميس',
      'الجمعة',
      'السبت'
    ];

    for (int i = 0; i < english.length; i++) {
      day = day.replaceAll(english[i], arab[i]);
    }
    return day;
  }

  static String replaceEngNumber(String num) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arab = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    for (int i = 0; i < english.length; i++) {
      num = num.replaceAll(english[i], arab[i]);
    }
    return num;
  }

  static String replaceEngMonth(String month) {
    const english = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      '11',
      '12'
    ];
    const arab = [
      'محرم',
      'صفر',
      'ربيع الأول',
      'ربيع الآخر',
      'جماد الأول',
      'جماد الآخر',
      'رجب',
      'شعبان',
      'رمضان',
      'شوال',
      'ذو القعدة',
      'ذو الحجة'
    ];

    for (int i = 0; i < english.length; i++) {
      month = month.replaceAll(english[i], arab[i]);
    }
    return month;
  }

  static String replaceToEngMonth(String month) {

    const english = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    const arab = [
      'يناير',
      'فبراير',
      'مارس',
      'أبريل',
      'مايو',
      'يونيو',
      'يوليو',
      'أغسطس',
      'سبتمبر',
      'أكتوبر',
      'نوفمبر',
      'ديسمبر'
    ];

    for (int i = 0; i < english.length; i++) {
      month = month.replaceAll(english[i], arab[i]);
    }
    return month;
  }

}