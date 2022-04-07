// ignore: file_names
import 'package:auto_route/auto_route.dart';
import 'package:climate_calendar_new/screens/edit_alarm/components/edit_alarm_days.dart';
import 'package:climate_calendar_new/screens/edit_alarm/components/edit_alarm_head.dart';
import 'package:climate_calendar_new/screens/edit_alarm/edit_alarm.dart';
import 'package:climate_calendar_new/screens/main/main_screen.dart';
import 'package:climate_calendar_new/ui/splash.dart';
import '../about_app.dart';
import '../home_page.dart';
import '../zodiacs/home_zodiac.dart';
import '../months/month.dart';
import '../months/month_char.dart';
import '../months/month_temp.dart';
import '../months/month_temp_map.dart';
import '../months/months.dart';
import '../qiblah/qibla.dart';
import '../seasons/season.dart';
import '../seasons/season_char.dart';
import '../seasons/seasons.dart';
import '../ui/about_idea.dart';
import '../ui/calendar.dart';
import '../ui/calendar_hijri.dart';
import '../ui/climate_calender.dart';
import '../ui/climate_note_paper.dart';
import '../ui/convert.dart';
import '../ui/farm_calender.dart';
import '../nav_bar.dart';
import '../ui/prayer_times.dart';
import '../ui/ramadan.dart';
import '../ui/weather.dart';
import '../zodiacs/zodiac_info.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(
      path: '/',
      page: NavigationBarBottom,
      children: [
        AutoRoute(
          path: 'home',
          name: 'HomeRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: HomePage),
            AutoRoute(path: ':seasonId', page: Season),
            AutoRoute(path: ':seasonChar', page: SeasonInfo),
            AutoRoute(path: ':zodiacId', page: ZodiacInfo),
            AutoRoute(path: ':monthId', page: Month),
            AutoRoute(path: ':monthChar', page: MonthChar),
            AutoRoute(path: ':monthMaps', page: Monthgraphs),
            AutoRoute(path: ':monthTemp', page: MonthTemp),
            AutoRoute(path: ':drawerAboutIdea', page: AboutIdea),
            AutoRoute(path: ':drawerClimateNotePaper', page: ClimateNotePaper),
            AutoRoute(path: ':drawerClimateCalendar', page: ClimateCalendar),
            AutoRoute(path: ':drawerFarmCalender', page: FarmCalender),
            AutoRoute(path: ':drawerWeather', page: Weather),
            AutoRoute(path: ':drawerCalendarHijri', page: CalendarHijri),
            AutoRoute(path: ':drawerCalendar', page: Calendar),
            AutoRoute(path: ':drawerConvert', page: Convert),
            AutoRoute(path: ':drawerPrayers', page: Prayers),
            AutoRoute(path: ':drawerQiblah', page: Qiblah),
            AutoRoute(path: ':drawerRamadan', page: Ramadan),
            AutoRoute(path: ':drawerAboutApp', page: AboutApp),

          ],
        ),
        AutoRoute(
          path: 'seasons',
          name: 'SeasonsRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: Seasons),
            AutoRoute(path: ':seasonId', page: Season),
            AutoRoute(path: ':seasonChar', page: SeasonInfo),
            AutoRoute(path: ':zodiacId', page: ZodiacInfo),
            AutoRoute(path: ':drawerAboutIdea', page: AboutIdea),
            AutoRoute(path: ':drawerClimateNotePaper', page: ClimateNotePaper),
            AutoRoute(path: ':drawerClimateCalendar', page: ClimateCalendar),
            AutoRoute(path: ':drawerFarmCalender', page: FarmCalender),
            AutoRoute(path: ':drawerWeather', page: Weather),
            AutoRoute(path: ':drawerCalendarHijri', page: CalendarHijri),
            AutoRoute(path: ':drawerCalendar', page: Calendar),
            AutoRoute(path: ':drawerConvert', page: Convert),
            AutoRoute(path: ':drawerPrayers', page: Prayers),
            AutoRoute(path: ':drawerQiblah', page: Qiblah),
            AutoRoute(path: ':drawerRamadan', page: Ramadan),
            AutoRoute(path: ':drawerAboutApp', page: AboutApp),

          ],
        ),
        AutoRoute(
            path: 'zodiacs',
            name: 'ZodiacsRouter',
            page: EmptyRouterPage,
            children: [
              AutoRoute(path: '', page: HomeZodiac),
              AutoRoute(path: ':zodiacId', page: ZodiacInfo),
              AutoRoute(path: ':drawerAboutIdea', page: AboutIdea),
              AutoRoute(path: ':drawerClimateNotePaper', page: ClimateNotePaper),
              AutoRoute(path: ':drawerClimateCalendar', page: ClimateCalendar),
              AutoRoute(path: ':drawerFarmCalender', page: FarmCalender),
              AutoRoute(path: ':drawerWeather', page: Weather),
              AutoRoute(path: ':drawerCalendarHijri', page: CalendarHijri),
              AutoRoute(path: ':drawerCalendar', page: Calendar),
              AutoRoute(path: ':drawerConvert', page: Convert),
              AutoRoute(path: ':drawerPrayers', page: Prayers),
              AutoRoute(path: ':drawerQiblah', page: Qiblah),
              AutoRoute(path: ':drawerRamadan', page: Ramadan),
              AutoRoute(path: ':drawerAboutApp', page: AboutApp),

            ]),

        AutoRoute(
            path: 'months',
            name: 'MonthsRouter',
            page: EmptyRouterPage,
            children: [
              AutoRoute(path: '', page: Months),
              AutoRoute(path: ':monthId', page: Month),
              AutoRoute(path: ':monthChar', page: MonthChar),
              AutoRoute(path: ':monthMaps', page: Monthgraphs),
              AutoRoute(path: ':monthTemp', page: MonthTemp),
              AutoRoute(path: ':zodiacId', page: ZodiacInfo),

              AutoRoute(path: ':seasonId', page: Season),
              AutoRoute(path: ':seasonChar', page: SeasonInfo),
              AutoRoute(path: ':drawerAboutIdea', page: AboutIdea),
              AutoRoute(path: ':drawerClimateNotePaper', page: ClimateNotePaper),
              AutoRoute(path: ':drawerClimateCalendar', page: ClimateCalendar),
              AutoRoute(path: ':drawerFarmCalender', page: FarmCalender),
              AutoRoute(path: ':drawerWeather', page: Weather),
              AutoRoute(path: ':drawerCalendarHijri', page: CalendarHijri),
              AutoRoute(path: ':drawerCalendar', page: Calendar),
              AutoRoute(path: ':drawerConvert', page: Convert),
              AutoRoute(path: ':drawerPrayers', page: Prayers),
              AutoRoute(path: ':drawerQiblah', page: Qiblah),
              AutoRoute(path: ':drawerRamadan', page: Ramadan),
              AutoRoute(path: ':drawerAboutApp', page: AboutApp),

            ]),
        
                AutoRoute(
            path: 'screens',
            name: 'MainScreenRouter',
            page: EmptyRouterPage,
            children: [
              AutoRoute(path: '', page: MainScreen),
              AutoRoute(path: 'editID', page: EditAlarm),
              AutoRoute(path: ':title', page: AlarmTitle),
              AutoRoute(path: ':repeat', page: RepeatAlarm),

            ]),
            
            ],
    ),
    
                    
  ],
)
class $AppRouter {}
