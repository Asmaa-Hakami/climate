import 'package:flutter/material.dart';
import 'dates.dart';

class AllData {
  static DateTime date = DateTime.now(); //DateTime(2021, 7, 2); //
  static DateTime today = DateTime(date.year, date.month, date.day);
  static List<DateTime> summerDate = [
    DateTime(today.year, 5, 11),
    DateTime(today.year, 9, 18)
  ]; //[DateTime( 11, 5), DateTime( 18, 9)];//
  static List<DateTime> autumnDate = [
    DateTime(today.year, 9, 19),
    DateTime(today.year, 11, 22)
  ]; //[DateTime( 19, 9), DateTime( 22, 11)];//

  static List<DateTime> winterDate = (today.month.toString() == '1' ||
          today.month.toString() == '2' ||
          (today.month.toString() == '3' && today.day < 6))
      ? [DateTime(today.year - 1, 11, 23), DateTime(today.year, 3, 6)]
      : [
          DateTime(today.year, 11, 23),
          DateTime(today.year + 1, 3, 6)
        ]; //[DateTime( 23, 11), DateTime( 6, 3)];//

  static DateTime sunQabaDate1 = DateTime(today.year, 5, 28);
  static DateTime sunSaratan = DateTime(today.year, 6, 21);
  static DateTime sunQabaDate2 = DateTime(today.year, 7, 15);
  static DateTime sunLineDate2 = DateTime(today.year, 9, 23);
  static DateTime equalAMPM = DateTime(today.year, 9, 28);

  static DateTime sunJadi = DateTime(today.year, 12, 21);
  static DateTime sunLineDate1 = DateTime(today.year, 3, 21);

  static List<DateTime> springDate = [
    DateTime(today.year, 3, 7),
    DateTime(today.year, 5, 10)
  ]; //[DateTime( 7, 3), DateTime( 10, 5)]; //[
  static late List nowSeason = ['', '', 0, []];
  static late List nowZodiac = [[], [], []];
  static late List nowTalea = ['', '', 0];

  static String getSWhen(String name, DateTime startDate) {
    if (name == nowSeason[0]) {
      return 'مضى ' + AllDates.replaceEngNumber(nowSeason[1]) + ' يوم';
    } else {
      String left;
      if (startDate.month < today.month ||
          (startDate.month == today.month && startDate.day == today.day)) {
        left = (DateTime(startDate.year + 1, startDate.month, startDate.day)
                .difference(today)
                .inDays)
            .toString();
        return 'متبقي ' + AllDates.replaceEngNumber(left) + ' يوم';
      } else {
        left = (startDate.difference(today).inDays).toString();
        return 'متبقي ' + AllDates.replaceEngNumber(left) + ' يوم';
      }
    }
  }

  static List getNowStatus(DateTime now) {
    nowSeason = ['', '', 0, []];
    nowZodiac = [[], [], []];
    nowTalea = ['', '', 0];

    if (now.isAfter(summerDate[0].subtract(const Duration(days: 1))) &&
        now.isBefore(summerDate[1].add(const Duration(days: 1)))) {
      nowSeason[0] = 'الصيف';
      nowSeason[1] = (now.difference(summerDate[0]).inDays + 1).toString();
      nowSeason[2] = 0;
      nowSeason[3] = [0xff466977, 0xff3A6978];
    } else if (now.isAfter(autumnDate[0].subtract(const Duration(days: 1))) &&
        now.isBefore(autumnDate[1].add(const Duration(days: 1)))) {
      nowSeason[0] = 'الخريف';
      nowSeason[1] = (now.difference(autumnDate[0]).inDays + 1)
          .toString(); //now.month.toString();//
      nowSeason[2] = 1;
      nowSeason[3] = [0xffBB6B45, 0xffBD7148];
    } else if (now.isAfter(winterDate[0].subtract(const Duration(days: 1))) &&
        now.isBefore(winterDate[1].add(const Duration(days: 1)))) {
      nowSeason[0] = 'الشتاء';
      nowSeason[1] = (now.difference(winterDate[0]).inDays + 1)
          .toString(); //(winterDate[0].day - now.day).toString();
      nowSeason[2] = 2;
      nowSeason[3] = [Colors.white.value, 0xff3A6978];
    } else {
      nowSeason[0] = 'الربيع';
      nowSeason[1] = (now.difference(springDate[0]).inDays + 1)
          .toString(); //(springDate[0].day - now.day).toString();
      nowSeason[2] = 3;
      nowSeason[3] = [0xff4E5A33, 0xff3A6978];
    }

    for (var i = 0; i < seasinsInfo[today.month - 1][1].length; i++) {
      //DateTime temp = seasinsInfo[today.month - 1][1][i][1];  DateTime(temp.year, temp.month, temp.day - 1)
      if (now.isAfter(seasinsInfo[today.month - 1][1][i][1]
              .subtract(const Duration(days: 1))) &&
          now.isBefore(seasinsInfo[today.month - 1][1][i][2]
              .add(const Duration(days: 1)))) {
        nowTalea[0] = seasinsInfo[today.month - 1][1][i][0];
        nowTalea[1] = AllDates.replaceEngNumber(
            (1 + now.difference(seasinsInfo[today.month - 1][1][i][1]).inDays)
                .toString());
        nowTalea[2] = seasinsInfo[today.month - 1][1][i][3];
        break;
      } else {
        nowTalea[0] = 'not a date';
      }
    }
    for (var i = 0; i < seasinsInfo[today.month - 1][2].length; i++) {
      if (now.isAfter(seasinsInfo[today.month - 1][2][i][1]
              .subtract(const Duration(days: 1))) &&
          now.isBefore(seasinsInfo[today.month - 1][2][i][2]
              .add(const Duration(days: 1)))) {
        nowZodiac[0].add(seasinsInfo[today.month - 1][2][i][0]);
        nowZodiac[1].add(AllDates.replaceEngNumber(
            (1 + now.difference(seasinsInfo[today.month - 1][2][i][1]).inDays)
                .toString()));
        nowZodiac[2].add(seasinsInfo[today.month - 1][2][i][3]);
      }
    }

    return [nowSeason, nowZodiac, nowTalea];
  }

  static String getTWhen(String name) {
    String def;
    String d;
    if (name == nowTalea[0].toString()) {
      def = AllDates.replaceEngNumber((nowTalea[1]));
      return 'مضى ' + def + ' ' + 'يوم';
    } else {
      for (var i = 0; i < seasinsInfo.length; i++) {
        for (var j = 0; j < seasinsInfo[i][1].length; j++) {
          if (seasinsInfo[i][1][j][0].toString() == name) {
            if (seasinsInfo[i][1][j][1].month < today.month ||
                (seasinsInfo[i][1][j][1].month == today.month &&
                    seasinsInfo[i][1][j][1].day <= today.day)) {
              DateTime temp = seasinsInfo[i][1][j][1];
              def = AllDates.replaceEngNumber(
                  (DateTime(temp.year + 1, temp.month, temp.day)
                          .difference(today)
                          .inDays)
                      .toString());
              d = DateTime(temp.year + 1, temp.month, temp.day)
                          .difference(today)
                          .inDays <=
                      10
                  ? 'أيام'
                  : ' يوم';
              return 'متبقي ' + def + ' ' + d;
            } else {
              def = AllDates.replaceEngNumber(
                  (seasinsInfo[i][1][j][1].difference(today).inDays)
                      .toString());
              d = seasinsInfo[i][1][j][1].difference(today).inDays <= 10
                  ? 'أيام'
                  : ' يوم';

              return 'متبقي ' + def + ' ' + d;
            }
          }
        }
      }
    }
    return 'Not correct name';
  }

  static String getZWhen(int num) {
    for (var i = 0; i < nowZodiac[0].length; i++) {
      if (nowZodiac[2][i] == num) {
        return 'مضى ' + AllDates.replaceEngNumber(nowZodiac[1][i]) + ' يوم';
      }
    }
    for (var i = 0; i < seasinsInfo.length; i++) {
      for (var j = 0; j < seasinsInfo[i][2].length; j++) {
        if (seasinsInfo[i][2][j][3] == num) {
          if (seasinsInfo[i][2][j][1].month < today.month ||
              (seasinsInfo[i][2][j][1].month == today.month &&
                  seasinsInfo[i][2][j][1].day < today.day)) {
            DateTime temp = seasinsInfo[i][2][j][1];
            return 'متبقي ' +
                AllDates.replaceEngNumber(
                    (DateTime(temp.year + 1, temp.month, temp.day)
                            .difference(today)
                            .inDays)
                        .toString()) +
                ' يوم';
          }
          if (num == 8) {
            return 'متبقي ' +
                AllDates.replaceEngNumber((DateTime(
                            today.year,
                            seasinsInfo[i][2][j][1].month,
                            seasinsInfo[i][2][j][1].day)
                        .difference(today)
                        .inDays)
                    .toString()) +
                ' يوم';
          } else {
            return 'متبقي ' +
                AllDates.replaceEngNumber(
                    (seasinsInfo[i][2][j][1].difference(today).inDays)
                        .toString()) +
                ' يوم';
          }
        }
      }
    }
    //}
    return 'Not correct name';
  }

  static String getMWhen(int mnum) {
    String def;
    String d;
    if (mnum == today.month) {
      def = AllDates.replaceEngNumber(today.day.toString());
      d = today.day <= 10 ? 'أيام' : ' يوم';
      return 'مضى ' + def + ' ' + d;
    } else if (mnum < today.month) {
      DateTime temp = DateTime(today.year + 1, mnum, 1);

      def =
          AllDates.replaceEngNumber((temp.difference(today).inDays).toString());
      d = temp.difference(today).inDays <= 10 ? 'أيام' : ' يوم';

      return 'متبقي ' + def + ' ' + d;
    } else {
      DateTime temp = DateTime(today.year, mnum, 1);

      def =
          AllDates.replaceEngNumber((temp.difference(today).inDays).toString());
      d = temp.difference(today).inDays <= 10 ? 'أيام' : ' يوم';

      return 'متبقي ' + def + ' ' + d;
    }
  }

  static final List tawalea = [
    ['الشرطين', '١١ مايو', '١٣ يوم'],
    ['البطين', '٢٤ مايو', '١٣ يوم'],
    ['الثريا', '٦ يونيو', '١٣ يوم'],
    ['التويبع', '١٩ يونيو', '١٣ يوم'],
    ['الهقعة', '٢ يونيو', '١٣ يوم '],
    ['الهنعة', '١٥ يوليو', '١٣ يوم'],
    ['الذراع', '٢٨ يوليو', '١٣ يوم'],
    ['النثرة', '١٠ أغسطس', '١٣ يوم'],
    ['الطرف', '٢٣ أغسطس', '١٣ يوم'],
    ['الجبهة', '٥ سبتمبر', '١٤ يوم'],
    ['الزبرة', '١٩ سبتمبر', '١٣ يوم'],
    ['الصرفة', '٢ أكتوبر', '١٣ يوم'],
    ['العواء', '١٥ أكتوبر', '١٣ يوم'],
    ['السماك', '٢٨ أكتوبر', '١٣ يوم'],
    ['الغفر', '١٠ نوفمبر', '١٣ يوم'],
    ['الزبانا', '٢٣ نوفمبر', '١٣ يوم'],
    ['الاكليل', '٦ ديسمبر', '١٣ يوم'],
    ['القلب', '١٩ ديسمبر', '١٣ يوم'],
    ['الشولة', '١ يناير', '١٣ يوم'],
    ['النعائم', '١٤ يناير', '١٣ يوم'],
    ['البلدة', '٢٧ يناير', '١٣ يوم'],
    ['سعد الذابح', '٩ فبراير', '١٣ يوم'],
    ['سعد بلع', '٢٢ فبراير', '١٣ يوم'],
    ['سعد السعود', '٧ مارس', '١٣ يوم'],
    ['سعد الأخبية', '٢٠ مارس', '١٣ يوم'],
    ['المقدم', '٢ أبريل', '١٣ يوم'],
    ['المؤخر', '١٥ أبريل', '١٣ يوم'],
    ['الرشا', '٢٨ أبريل', '١٣ يوم'],
  ];

  static final List zodiacDates = [
    ['المربعانية', DateTime(today.year, 12, 6)],
    ['الشبط', DateTime(today.year, 1, 14)],
    ['العقارب', DateTime(today.year, 2, 9)],
    ['الحميمين', DateTime(today.year, 3, 20)],
    ['السرايات', DateTime(today.year, 4, 15)],
    ['كنة الثريا', DateTime(today.year, 4, 28)],
    ['البوارح', DateTime(today.year, 5, 24)],
    [' مربعانية القيظ', DateTime(today.year, 6, 6)],
    ['الغبرة', DateTime(today.year, 6, 15)],
    ['الجوزاء', DateTime(today.year, 7, 2)],
    ['جمرة القيظ', DateTime(today.year, 7, 15)],
    ['سهيل', DateTime(today.year, 8, 23)],
    ['الصفري', DateTime(today.year, 9, 20)],
    ['الوسم', DateTime(today.year, 10, 15)],
  ];
  static final List seasinsInfo = [
    [
      '1',
      [
        ['الشولة', DateTime(today.year, 1, 1), DateTime(today.year, 1, 13), 19],
        [
          'النعائم',
          DateTime(today.year, 1, 14),
          DateTime(today.year, 1, 26),
          20
        ],
        ['البلدة', DateTime(today.year, 1, 27), DateTime(today.year, 2, 8), 21],
      ],
      [
        [
          'المربعانية',
          DateTime(today.year - 1, 12, 6),
          DateTime(today.year, 1, 13),
          8
        ],
        ['الشبط', DateTime(today.year, 1, 14), DateTime(today.year, 2, 8), 9],
      ],
    ],
    [
      '2',
      [
        ['البلدة', DateTime(today.year, 1, 27), DateTime(today.year, 2, 8), 21],
        [
          'سعد الذابح',
          DateTime(today.year, 2, 9),
          DateTime(today.year, 2, 21),
          22
        ],
        [
          'سعد بلع',
          DateTime(today.year, 2, 22),
          DateTime(today.year, 3, 6),
          23
        ],
      ],
      [
        ['الشبط', DateTime(today.year, 1, 14), DateTime(today.year, 2, 8), 9],
        [
          'العقارب',
          DateTime(today.year, 2, 9),
          DateTime(today.year, 3, 19),
          10
        ],
      ],
    ],
    [
      '3',
      [
        [
          'سعد بلع',
          DateTime(today.year, 2, 22),
          DateTime(today.year, 3, 6),
          23
        ],
        [
          'سعد السعود',
          DateTime(today.year, 3, 7),
          DateTime(today.year, 3, 19),
          24
        ],
        [
          'سعد الأخبية',
          DateTime(today.year, 3, 20),
          DateTime(today.year, 4, 1),
          25
        ],
      ],
      [
        [
          'العقارب',
          DateTime(today.year, 2, 9),
          DateTime(today.year, 3, 19),
          10
        ],
        [
          'الحميمين',
          DateTime(today.year, 3, 20),
          DateTime(today.year, 4, 14),
          11
        ],
      ],
    ],
    [
      '4',
      [
        [
          'سعد الأخبية',
          DateTime(today.year, 3, 20),
          DateTime(today.year, 4, 1),
          25
        ],
        ['المقدم', DateTime(today.year, 4, 2), DateTime(today.year, 4, 14), 26],
        [
          'المؤخر',
          DateTime(today.year, 4, 15),
          DateTime(today.year, 4, 27),
          27
        ],
        ['الرشا', DateTime(today.year, 4, 28), DateTime(today.year, 5, 10), 28],
      ],
      [
        [
          'الحميمين',
          DateTime(today.year, 3, 20),
          DateTime(today.year, 4, 14),
          11
        ],
        [
          'السرايات',
          DateTime(today.year, 4, 15),
          DateTime(today.year, 5, 23),
          12
        ],
        [
          'كنة الثريا',
          DateTime(today.year, 4, 28),
          DateTime(today.year, 6, 5),
          13
        ],
      ],
    ],
    [
      '5',
      [
        ['الرشا', DateTime(today.year, 4, 28), DateTime(today.year, 5, 10), 28],
        [
          'الشرطين',
          DateTime(today.year, 5, 11),
          DateTime(today.year, 5, 23),
          1
        ],
        ['البطين', DateTime(today.year, 5, 24), DateTime(today.year, 6, 5), 2],
      ],
      [
        [
          'السرايات',
          DateTime(today.year, 4, 15),
          DateTime(today.year, 5, 23),
          12
        ],
        [
          'كنة الثريا',
          DateTime(today.year, 4, 28),
          DateTime(today.year, 6, 5),
          13
        ],
        [
          'البوارح',
          DateTime(today.year, 5, 24),
          DateTime(today.year, 7, 27),
          0
        ],
      ],
    ],
    [
      '6',
      [
        ['البطين', DateTime(today.year, 5, 24), DateTime(today.year, 6, 5), 2],
        ['الثريا', DateTime(today.year, 6, 6), DateTime(today.year, 6, 18), 3],
        ['التويبع', DateTime(today.year, 6, 19), DateTime(today.year, 7, 1), 4],
      ],
      [
        [
          'كنة الثريا',
          DateTime(today.year, 4, 28),
          DateTime(today.year, 6, 5),
          13
        ],
        [
          'البوارح',
          DateTime(today.year, 5, 24),
          DateTime(today.year, 7, 27),
          0
        ],
        [
          ' مربعانية القيظ',
          DateTime(today.year, 6, 6),
          DateTime(today.year, 7, 14),
          1
        ],
        ['الغبرة', DateTime(today.year, 6, 15), DateTime(today.year, 8, 31), 2],
      ],
    ],
    [
      '7',
      [
        ['التويبع', DateTime(today.year, 6, 19), DateTime(today.year, 7, 1), 4],
        ['الهقعة', DateTime(today.year, 7, 2), DateTime(today.year, 7, 14), 5],
        ['الهنعة', DateTime(today.year, 7, 15), DateTime(today.year, 7, 27), 6],
        ['الذراع', DateTime(today.year, 7, 28), DateTime(today.year, 8, 9), 7],
      ],
      [
        [
          'البوارح',
          DateTime(today.year, 5, 24),
          DateTime(today.year, 7, 27),
          0
        ],
        [
          ' مربعانية القيظ',
          DateTime(today.year, 6, 6),
          DateTime(today.year, 7, 14),
          1
        ],
        ['الغبرة', DateTime(today.year, 6, 15), DateTime(today.year, 8, 31), 2],
        ['الجوزاء', DateTime(today.year, 7, 2), DateTime(today.year, 7, 27), 3],
        [
          'جمرة القيظ',
          DateTime(today.year, 7, 15),
          DateTime(today.year, 8, 22),
          4
        ],
      ],
    ],
    [
      '8',
      [
        // الطوالع
        ['الذراع', DateTime(today.year, 7, 28), DateTime(today.year, 8, 9), 7],
        ['النثرة', DateTime(today.year, 8, 10), DateTime(today.year, 8, 22), 8],
        ['الطرف', DateTime(today.year, 8, 23), DateTime(today.year, 9, 4), 9],
      ],
      [
        // المواسم
        ['الغبرة', DateTime(today.year, 6, 15), DateTime(today.year, 8, 31), 2],
        [
          'جمرة القيظ',
          DateTime(today.year, 7, 15),
          DateTime(today.year, 8, 22),
          4
        ],
        ['سهيل', DateTime(today.year, 8, 23), DateTime(today.year, 10, 14), 5],
      ],
    ],
    [
      '9',
      [
        // الطوالع
        ['الطرف', DateTime(today.year, 8, 23), DateTime(today.year, 9, 4), 9],
        ['الجبهة', DateTime(today.year, 9, 5), DateTime(today.year, 9, 18), 10],
        [
          'الزبرة',
          DateTime(today.year, 9, 19),
          DateTime(today.year, 10, 1),
          11
        ],
      ],
      [
        // المواسم
        ['سهيل', DateTime(today.year, 8, 23), DateTime(today.year, 10, 14), 5],
        [
          'الصفري',
          DateTime(today.year, 9, 20),
          DateTime(today.year, 10, 27),
          6
        ],
      ],
    ],
    [
      '10',
      [
        // الطوالع
        [
          'الزبرة',
          DateTime(today.year, 9, 19),
          DateTime(today.year, 10, 1),
          11
        ],
        [
          'الصرفة',
          DateTime(today.year, 10, 2),
          DateTime(today.year, 10, 14),
          12
        ],
        [
          'العواء',
          DateTime(today.year, 10, 15),
          DateTime(today.year, 10, 27),
          13
        ],
        [
          'السماك',
          DateTime(today.year, 10, 28),
          DateTime(today.year, 11, 9),
          14
        ],
      ],
      [
        //المواسم
        ['سهيل', DateTime(today.year, 8, 23), DateTime(today.year, 10, 14), 5],
        [
          'الصفري',
          DateTime(today.year, 9, 20),
          DateTime(today.year, 10, 27),
          6
        ],
        ['الوسم', DateTime(today.year, 10, 15), DateTime(today.year, 12, 5), 7],
      ],
    ],
    [
      '11',
      [
        [
          'السماك',
          DateTime(today.year, 10, 28),
          DateTime(today.year, 11, 9),
          14
        ],
        [
          'الغفر',
          DateTime(today.year, 11, 10),
          DateTime(today.year, 11, 22),
          15
        ],
        [
          'الزبانا',
          DateTime(today.year, 11, 23),
          DateTime(today.year, 12, 5),
          16
        ],
      ],
      [
        // المواسم
        ['الوسم', DateTime(today.year, 10, 15), DateTime(today.year, 12, 5), 7],
      ],
    ],
    [
      '12',
      [
        // الطوالع
        [
          'الزبانا',
          DateTime(today.year, 11, 23),
          DateTime(today.year, 12, 5),
          16
        ],
        [
          'الاكليل',
          DateTime(today.year, 12, 6),
          DateTime(today.year, 12, 18),
          17
        ],
        [
          'القلب',
          DateTime(today.year, 12, 19),
          DateTime(today.year, 12, 31),
          18
        ],
      ],
      [
        // المواسم
        ['الوسم', DateTime(today.year, 10, 15), DateTime(today.year, 12, 5), 7],
        [
          'المربعانية',
          DateTime(today.year, 12, 6),
          DateTime(today.year + 1, 1, 13),
          8
        ],
      ],
    ],
  ];
}
