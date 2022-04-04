// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i28;

import '../about_app.dart' as _i23;
import '../home_page.dart' as _i4;
import '../months/month.dart' as _i8;
import '../months/month_char.dart' as _i9;
import '../months/month_temp.dart' as _i11;
import '../months/month_temp_map.dart' as _i10;
import '../months/months.dart' as _i27;
import '../nav_bar.dart' as _i2;
import '../qiblah/qibla.dart' as _i21;
import '../screens/main/main_screen.dart' as _i24;
import '../seasons/season.dart' as _i5;
import '../seasons/season_char.dart' as _i6;
import '../seasons/seasons.dart' as _i25;
import '../stores/alarm_list/alarm_list.dart' as _i29;
import '../ui/about_idea.dart' as _i12;
import '../ui/calendar.dart' as _i18;
import '../ui/calendar_hijri.dart' as _i17;
import '../ui/climate_calender.dart' as _i14;
import '../ui/climate_note_paper.dart' as _i13;
import '../ui/convert.dart' as _i19;
import '../ui/farm_calender.dart' as _i15;
import '../ui/prayer_times.dart' as _i20;
import '../ui/ramadan.dart' as _i22;
import '../ui/splash.dart' as _i1;
import '../ui/weather.dart' as _i16;
import '../zodiacs/home_zodiac.dart' as _i26;
import '../zodiacs/zodiac_info.dart' as _i7;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i28.GlobalKey<_i28.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    NavigationBarBottom.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.NavigationBarBottom());
    },
    HomeRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    SeasonsRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    ZodiacsRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    MonthsRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    HomeRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HomePage());
    },
    Season.name: (routeData) {
      final args = routeData.argsAs<SeasonArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.Season(args.sNum, args.sName, args.left, key: args.key));
    },
    SeasonInfo.name: (routeData) {
      final args = routeData.argsAs<SeasonInfoArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.SeasonInfo(args.index, args.sName, args.titleColor,
              key: args.key));
    },
    ZodiacInfo.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ZodiacInfoArgs>(
          orElse: () => ZodiacInfoArgs(index: pathParams.getInt('index')));
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.ZodiacInfo(args.index, key: args.key));
    },
    Month.name: (routeData) {
      final args = routeData.argsAs<MonthArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.Month(args.mname, args.mnum, key: args.key));
    },
    MonthChar.name: (routeData) {
      final args = routeData.argsAs<MonthCharArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.MonthChar(args.mname, args.mnum, key: args.key));
    },
    Monthgraphs.name: (routeData) {
      final args = routeData.argsAs<MonthgraphsArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.Monthgraphs(args.mname, args.mnum, key: args.key));
    },
    MonthTemp.name: (routeData) {
      final args = routeData.argsAs<MonthTempArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.MonthTemp(args.mname, args.mnum, key: args.key));
    },
    AboutIdea.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.AboutIdea());
    },
    ClimateNotePaper.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.ClimateNotePaper());
    },
    ClimateCalendar.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.ClimateCalendar());
    },
    FarmCalender.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.FarmCalender());
    },
    Weather.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.Weather());
    },
    CalendarHijri.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.CalendarHijri());
    },
    Calendar.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.Calendar());
    },
    Convert.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i19.Convert());
    },
    Prayers.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i20.Prayers());
    },
    Qiblah.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i21.Qiblah());
    },
    Ramadan.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i22.Ramadan());
    },
    AboutApp.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i23.AboutApp());
    },
    MainScreen.name: (routeData) {
      final args = routeData.argsAs<MainScreenArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i24.MainScreen(key: args.key, alarms: args.alarms));
    },
    Seasons.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i25.Seasons());
    },
    HomeZodiac.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i26.HomeZodiac());
    },
    Months.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i27.Months());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(SplashRoute.name, path: '/'),
        _i3.RouteConfig(NavigationBarBottom.name, path: '/', children: [
          _i3.RouteConfig(HomeRouter.name,
              path: 'home',
              parent: NavigationBarBottom.name,
              children: [
                _i3.RouteConfig(HomeRoute.name,
                    path: '', parent: HomeRouter.name),
                _i3.RouteConfig(Season.name,
                    path: ':seasonId', parent: HomeRouter.name),
                _i3.RouteConfig(SeasonInfo.name,
                    path: ':seasonChar', parent: HomeRouter.name),
                _i3.RouteConfig(ZodiacInfo.name,
                    path: ':zodiacId', parent: HomeRouter.name),
                _i3.RouteConfig(Month.name,
                    path: ':monthId', parent: HomeRouter.name),
                _i3.RouteConfig(MonthChar.name,
                    path: ':monthChar', parent: HomeRouter.name),
                _i3.RouteConfig(Monthgraphs.name,
                    path: ':monthMaps', parent: HomeRouter.name),
                _i3.RouteConfig(MonthTemp.name,
                    path: ':monthTemp', parent: HomeRouter.name),
                _i3.RouteConfig(AboutIdea.name,
                    path: ':drawerAboutIdea', parent: HomeRouter.name),
                _i3.RouteConfig(ClimateNotePaper.name,
                    path: ':drawerClimateNotePaper', parent: HomeRouter.name),
                _i3.RouteConfig(ClimateCalendar.name,
                    path: ':drawerClimateCalendar', parent: HomeRouter.name),
                _i3.RouteConfig(FarmCalender.name,
                    path: ':drawerFarmCalender', parent: HomeRouter.name),
                _i3.RouteConfig(Weather.name,
                    path: ':drawerWeather', parent: HomeRouter.name),
                _i3.RouteConfig(CalendarHijri.name,
                    path: ':drawerCalendarHijri', parent: HomeRouter.name),
                _i3.RouteConfig(Calendar.name,
                    path: ':drawerCalendar', parent: HomeRouter.name),
                _i3.RouteConfig(Convert.name,
                    path: ':drawerConvert', parent: HomeRouter.name),
                _i3.RouteConfig(Prayers.name,
                    path: ':drawerPrayers', parent: HomeRouter.name),
                _i3.RouteConfig(Qiblah.name,
                    path: ':drawerQiblah', parent: HomeRouter.name),
                _i3.RouteConfig(Ramadan.name,
                    path: ':drawerRamadan', parent: HomeRouter.name),
                _i3.RouteConfig(AboutApp.name,
                    path: ':drawerAboutApp', parent: HomeRouter.name),
                _i3.RouteConfig(MainScreen.name,
                    path: '', parent: HomeRouter.name)
              ]),
          _i3.RouteConfig(SeasonsRouter.name,
              path: 'seasons',
              parent: NavigationBarBottom.name,
              children: [
                _i3.RouteConfig(Seasons.name,
                    path: '', parent: SeasonsRouter.name),
                _i3.RouteConfig(Season.name,
                    path: ':seasonId', parent: SeasonsRouter.name),
                _i3.RouteConfig(SeasonInfo.name,
                    path: ':seasonChar', parent: SeasonsRouter.name),
                _i3.RouteConfig(ZodiacInfo.name,
                    path: ':zodiacId', parent: SeasonsRouter.name),
                _i3.RouteConfig(AboutIdea.name,
                    path: ':drawerAboutIdea', parent: SeasonsRouter.name),
                _i3.RouteConfig(ClimateNotePaper.name,
                    path: ':drawerClimateNotePaper',
                    parent: SeasonsRouter.name),
                _i3.RouteConfig(ClimateCalendar.name,
                    path: ':drawerClimateCalendar', parent: SeasonsRouter.name),
                _i3.RouteConfig(FarmCalender.name,
                    path: ':drawerFarmCalender', parent: SeasonsRouter.name),
                _i3.RouteConfig(Weather.name,
                    path: ':drawerWeather', parent: SeasonsRouter.name),
                _i3.RouteConfig(CalendarHijri.name,
                    path: ':drawerCalendarHijri', parent: SeasonsRouter.name),
                _i3.RouteConfig(Calendar.name,
                    path: ':drawerCalendar', parent: SeasonsRouter.name),
                _i3.RouteConfig(Convert.name,
                    path: ':drawerConvert', parent: SeasonsRouter.name),
                _i3.RouteConfig(Prayers.name,
                    path: ':drawerPrayers', parent: SeasonsRouter.name),
                _i3.RouteConfig(Qiblah.name,
                    path: ':drawerQiblah', parent: SeasonsRouter.name),
                _i3.RouteConfig(Ramadan.name,
                    path: ':drawerRamadan', parent: SeasonsRouter.name),
                _i3.RouteConfig(AboutApp.name,
                    path: ':drawerAboutApp', parent: SeasonsRouter.name),
                _i3.RouteConfig(MainScreen.name,
                    path: '', parent: SeasonsRouter.name)
              ]),
          _i3.RouteConfig(ZodiacsRouter.name,
              path: 'zodiacs',
              parent: NavigationBarBottom.name,
              children: [
                _i3.RouteConfig(HomeZodiac.name,
                    path: '', parent: ZodiacsRouter.name),
                _i3.RouteConfig(ZodiacInfo.name,
                    path: ':zodiacId', parent: ZodiacsRouter.name),
                _i3.RouteConfig(AboutIdea.name,
                    path: ':drawerAboutIdea', parent: ZodiacsRouter.name),
                _i3.RouteConfig(ClimateNotePaper.name,
                    path: ':drawerClimateNotePaper',
                    parent: ZodiacsRouter.name),
                _i3.RouteConfig(ClimateCalendar.name,
                    path: ':drawerClimateCalendar', parent: ZodiacsRouter.name),
                _i3.RouteConfig(FarmCalender.name,
                    path: ':drawerFarmCalender', parent: ZodiacsRouter.name),
                _i3.RouteConfig(Weather.name,
                    path: ':drawerWeather', parent: ZodiacsRouter.name),
                _i3.RouteConfig(CalendarHijri.name,
                    path: ':drawerCalendarHijri', parent: ZodiacsRouter.name),
                _i3.RouteConfig(Calendar.name,
                    path: ':drawerCalendar', parent: ZodiacsRouter.name),
                _i3.RouteConfig(Convert.name,
                    path: ':drawerConvert', parent: ZodiacsRouter.name),
                _i3.RouteConfig(Prayers.name,
                    path: ':drawerPrayers', parent: ZodiacsRouter.name),
                _i3.RouteConfig(Qiblah.name,
                    path: ':drawerQiblah', parent: ZodiacsRouter.name),
                _i3.RouteConfig(Ramadan.name,
                    path: ':drawerRamadan', parent: ZodiacsRouter.name),
                _i3.RouteConfig(AboutApp.name,
                    path: ':drawerAboutApp', parent: ZodiacsRouter.name),
                _i3.RouteConfig(MainScreen.name,
                    path: '', parent: ZodiacsRouter.name)
              ]),
          _i3.RouteConfig(MonthsRouter.name,
              path: 'months',
              parent: NavigationBarBottom.name,
              children: [
                _i3.RouteConfig(Months.name,
                    path: '', parent: MonthsRouter.name),
                _i3.RouteConfig(Month.name,
                    path: ':monthId', parent: MonthsRouter.name),
                _i3.RouteConfig(MonthChar.name,
                    path: ':monthChar', parent: MonthsRouter.name),
                _i3.RouteConfig(Monthgraphs.name,
                    path: ':monthMaps', parent: MonthsRouter.name),
                _i3.RouteConfig(MonthTemp.name,
                    path: ':monthTemp', parent: MonthsRouter.name),
                _i3.RouteConfig(ZodiacInfo.name,
                    path: ':zodiacId', parent: MonthsRouter.name),
                _i3.RouteConfig(Season.name,
                    path: ':seasonId', parent: MonthsRouter.name),
                _i3.RouteConfig(SeasonInfo.name,
                    path: ':seasonChar', parent: MonthsRouter.name),
                _i3.RouteConfig(AboutIdea.name,
                    path: ':drawerAboutIdea', parent: MonthsRouter.name),
                _i3.RouteConfig(ClimateNotePaper.name,
                    path: ':drawerClimateNotePaper', parent: MonthsRouter.name),
                _i3.RouteConfig(ClimateCalendar.name,
                    path: ':drawerClimateCalendar', parent: MonthsRouter.name),
                _i3.RouteConfig(FarmCalender.name,
                    path: ':drawerFarmCalender', parent: MonthsRouter.name),
                _i3.RouteConfig(Weather.name,
                    path: ':drawerWeather', parent: MonthsRouter.name),
                _i3.RouteConfig(CalendarHijri.name,
                    path: ':drawerCalendarHijri', parent: MonthsRouter.name),
                _i3.RouteConfig(Calendar.name,
                    path: ':drawerCalendar', parent: MonthsRouter.name),
                _i3.RouteConfig(Convert.name,
                    path: ':drawerConvert', parent: MonthsRouter.name),
                _i3.RouteConfig(Prayers.name,
                    path: ':drawerPrayers', parent: MonthsRouter.name),
                _i3.RouteConfig(Qiblah.name,
                    path: ':drawerQiblah', parent: MonthsRouter.name),
                _i3.RouteConfig(Ramadan.name,
                    path: ':drawerRamadan', parent: MonthsRouter.name),
                _i3.RouteConfig(AboutApp.name,
                    path: ':drawerAboutApp', parent: MonthsRouter.name),
                _i3.RouteConfig(MainScreen.name,
                    path: '', parent: MonthsRouter.name)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i3.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.NavigationBarBottom]
class NavigationBarBottom extends _i3.PageRouteInfo<void> {
  const NavigationBarBottom({List<_i3.PageRouteInfo>? children})
      : super(NavigationBarBottom.name, path: '/', initialChildren: children);

  static const String name = 'NavigationBarBottom';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class HomeRouter extends _i3.PageRouteInfo<void> {
  const HomeRouter({List<_i3.PageRouteInfo>? children})
      : super(HomeRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class SeasonsRouter extends _i3.PageRouteInfo<void> {
  const SeasonsRouter({List<_i3.PageRouteInfo>? children})
      : super(SeasonsRouter.name, path: 'seasons', initialChildren: children);

  static const String name = 'SeasonsRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class ZodiacsRouter extends _i3.PageRouteInfo<void> {
  const ZodiacsRouter({List<_i3.PageRouteInfo>? children})
      : super(ZodiacsRouter.name, path: 'zodiacs', initialChildren: children);

  static const String name = 'ZodiacsRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class MonthsRouter extends _i3.PageRouteInfo<void> {
  const MonthsRouter({List<_i3.PageRouteInfo>? children})
      : super(MonthsRouter.name, path: 'months', initialChildren: children);

  static const String name = 'MonthsRouter';
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.Season]
class Season extends _i3.PageRouteInfo<SeasonArgs> {
  Season(
      {required int sNum,
      required String sName,
      required String left,
      _i28.Key? key})
      : super(Season.name,
            path: ':seasonId',
            args: SeasonArgs(sNum: sNum, sName: sName, left: left, key: key),
            rawPathParams: {'sNum': sNum});

  static const String name = 'Season';
}

class SeasonArgs {
  const SeasonArgs(
      {required this.sNum, required this.sName, required this.left, this.key});

  final int sNum;

  final String sName;

  final String left;

  final _i28.Key? key;

  @override
  String toString() {
    return 'SeasonArgs{sNum: $sNum, sName: $sName, left: $left, key: $key}';
  }
}

/// generated route for
/// [_i6.SeasonInfo]
class SeasonInfo extends _i3.PageRouteInfo<SeasonInfoArgs> {
  SeasonInfo(
      {required int index,
      required String sName,
      required int titleColor,
      _i28.Key? key})
      : super(SeasonInfo.name,
            path: ':seasonChar',
            args: SeasonInfoArgs(
                index: index, sName: sName, titleColor: titleColor, key: key));

  static const String name = 'SeasonInfo';
}

class SeasonInfoArgs {
  const SeasonInfoArgs(
      {required this.index,
      required this.sName,
      required this.titleColor,
      this.key});

  final int index;

  final String sName;

  final int titleColor;

  final _i28.Key? key;

  @override
  String toString() {
    return 'SeasonInfoArgs{index: $index, sName: $sName, titleColor: $titleColor, key: $key}';
  }
}

/// generated route for
/// [_i7.ZodiacInfo]
class ZodiacInfo extends _i3.PageRouteInfo<ZodiacInfoArgs> {
  ZodiacInfo({required int index, _i28.Key? key})
      : super(ZodiacInfo.name,
            path: ':zodiacId',
            args: ZodiacInfoArgs(index: index, key: key),
            rawPathParams: {'index': index});

  static const String name = 'ZodiacInfo';
}

class ZodiacInfoArgs {
  const ZodiacInfoArgs({required this.index, this.key});

  final int index;

  final _i28.Key? key;

  @override
  String toString() {
    return 'ZodiacInfoArgs{index: $index, key: $key}';
  }
}

/// generated route for
/// [_i8.Month]
class Month extends _i3.PageRouteInfo<MonthArgs> {
  Month({required String mname, required int mnum, _i28.Key? key})
      : super(Month.name,
            path: ':monthId',
            args: MonthArgs(mname: mname, mnum: mnum, key: key),
            rawPathParams: {'mnum': mnum});

  static const String name = 'Month';
}

class MonthArgs {
  const MonthArgs({required this.mname, required this.mnum, this.key});

  final String mname;

  final int mnum;

  final _i28.Key? key;

  @override
  String toString() {
    return 'MonthArgs{mname: $mname, mnum: $mnum, key: $key}';
  }
}

/// generated route for
/// [_i9.MonthChar]
class MonthChar extends _i3.PageRouteInfo<MonthCharArgs> {
  MonthChar({required String mname, required int mnum, _i28.Key? key})
      : super(MonthChar.name,
            path: ':monthChar',
            args: MonthCharArgs(mname: mname, mnum: mnum, key: key));

  static const String name = 'MonthChar';
}

class MonthCharArgs {
  const MonthCharArgs({required this.mname, required this.mnum, this.key});

  final String mname;

  final int mnum;

  final _i28.Key? key;

  @override
  String toString() {
    return 'MonthCharArgs{mname: $mname, mnum: $mnum, key: $key}';
  }
}

/// generated route for
/// [_i10.Monthgraphs]
class Monthgraphs extends _i3.PageRouteInfo<MonthgraphsArgs> {
  Monthgraphs({required String mname, required int mnum, _i28.Key? key})
      : super(Monthgraphs.name,
            path: ':monthMaps',
            args: MonthgraphsArgs(mname: mname, mnum: mnum, key: key));

  static const String name = 'Monthgraphs';
}

class MonthgraphsArgs {
  const MonthgraphsArgs({required this.mname, required this.mnum, this.key});

  final String mname;

  final int mnum;

  final _i28.Key? key;

  @override
  String toString() {
    return 'MonthgraphsArgs{mname: $mname, mnum: $mnum, key: $key}';
  }
}

/// generated route for
/// [_i11.MonthTemp]
class MonthTemp extends _i3.PageRouteInfo<MonthTempArgs> {
  MonthTemp({required String mname, required int mnum, _i28.Key? key})
      : super(MonthTemp.name,
            path: ':monthTemp',
            args: MonthTempArgs(mname: mname, mnum: mnum, key: key));

  static const String name = 'MonthTemp';
}

class MonthTempArgs {
  const MonthTempArgs({required this.mname, required this.mnum, this.key});

  final String mname;

  final int mnum;

  final _i28.Key? key;

  @override
  String toString() {
    return 'MonthTempArgs{mname: $mname, mnum: $mnum, key: $key}';
  }
}

/// generated route for
/// [_i12.AboutIdea]
class AboutIdea extends _i3.PageRouteInfo<void> {
  const AboutIdea() : super(AboutIdea.name, path: ':drawerAboutIdea');

  static const String name = 'AboutIdea';
}

/// generated route for
/// [_i13.ClimateNotePaper]
class ClimateNotePaper extends _i3.PageRouteInfo<void> {
  const ClimateNotePaper()
      : super(ClimateNotePaper.name, path: ':drawerClimateNotePaper');

  static const String name = 'ClimateNotePaper';
}

/// generated route for
/// [_i14.ClimateCalendar]
class ClimateCalendar extends _i3.PageRouteInfo<void> {
  const ClimateCalendar()
      : super(ClimateCalendar.name, path: ':drawerClimateCalendar');

  static const String name = 'ClimateCalendar';
}

/// generated route for
/// [_i15.FarmCalender]
class FarmCalender extends _i3.PageRouteInfo<void> {
  const FarmCalender() : super(FarmCalender.name, path: ':drawerFarmCalender');

  static const String name = 'FarmCalender';
}

/// generated route for
/// [_i16.Weather]
class Weather extends _i3.PageRouteInfo<void> {
  const Weather() : super(Weather.name, path: ':drawerWeather');

  static const String name = 'Weather';
}

/// generated route for
/// [_i17.CalendarHijri]
class CalendarHijri extends _i3.PageRouteInfo<void> {
  const CalendarHijri()
      : super(CalendarHijri.name, path: ':drawerCalendarHijri');

  static const String name = 'CalendarHijri';
}

/// generated route for
/// [_i18.Calendar]
class Calendar extends _i3.PageRouteInfo<void> {
  const Calendar() : super(Calendar.name, path: ':drawerCalendar');

  static const String name = 'Calendar';
}

/// generated route for
/// [_i19.Convert]
class Convert extends _i3.PageRouteInfo<void> {
  const Convert() : super(Convert.name, path: ':drawerConvert');

  static const String name = 'Convert';
}

/// generated route for
/// [_i20.Prayers]
class Prayers extends _i3.PageRouteInfo<void> {
  const Prayers() : super(Prayers.name, path: ':drawerPrayers');

  static const String name = 'Prayers';
}

/// generated route for
/// [_i21.Qiblah]
class Qiblah extends _i3.PageRouteInfo<void> {
  const Qiblah() : super(Qiblah.name, path: ':drawerQiblah');

  static const String name = 'Qiblah';
}

/// generated route for
/// [_i22.Ramadan]
class Ramadan extends _i3.PageRouteInfo<void> {
  const Ramadan() : super(Ramadan.name, path: ':drawerRamadan');

  static const String name = 'Ramadan';
}

/// generated route for
/// [_i23.AboutApp]
class AboutApp extends _i3.PageRouteInfo<void> {
  const AboutApp() : super(AboutApp.name, path: ':drawerAboutApp');

  static const String name = 'AboutApp';
}

/// generated route for
/// [_i24.MainScreen]
class MainScreen extends _i3.PageRouteInfo<MainScreenArgs> {
  MainScreen({_i28.Key? key, required _i29.AlarmList alarms})
      : super(MainScreen.name,
            path: '', args: MainScreenArgs(key: key, alarms: alarms));

  static const String name = 'MainScreen';
}

class MainScreenArgs {
  const MainScreenArgs({this.key, required this.alarms});

  final _i28.Key? key;

  final _i29.AlarmList alarms;

  @override
  String toString() {
    return 'MainScreenArgs{key: $key, alarms: $alarms}';
  }
}

/// generated route for
/// [_i25.Seasons]
class Seasons extends _i3.PageRouteInfo<void> {
  const Seasons() : super(Seasons.name, path: '');

  static const String name = 'Seasons';
}

/// generated route for
/// [_i26.HomeZodiac]
class HomeZodiac extends _i3.PageRouteInfo<void> {
  const HomeZodiac() : super(HomeZodiac.name, path: '');

  static const String name = 'HomeZodiac';
}

/// generated route for
/// [_i27.Months]
class Months extends _i3.PageRouteInfo<void> {
  const Months() : super(Months.name, path: '');

  static const String name = 'Months';
}
