import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../all_notifications.dart';

import '../get_location.dart';
import '../routes/ router.gr.dart';
//import '../main.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    //getLocationData();
    ref
        .read(locationProvider)
        .initLocationData()
        .then((value) => ref.read(notificationProvider).appNotifications());

    Future.delayed(
      const Duration(seconds: 8),
      () => context.replaceRoute(const NavigationBarBottom()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset("assets/images/splash.gif",
                gaplessPlayback: true, fit: BoxFit.contain)));
  }
}
