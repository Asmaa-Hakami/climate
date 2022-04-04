
import 'dart:async';

//import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:video_player/video_player.dart';

//import '../get_location.dart';
import '../all_notifications.dart';
import '../get_location.dart';
import '../routes/ router.gr.dart';
//import '../main.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

      @override 
  void initState() {
    super.initState();
    //getLocationData();
    //AllNotifications.appNotifications();  
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
      gaplessPlayback: true, 
      fit: BoxFit.contain
      )
      ));
      
      
      /*Center(
        child: Stack(
          children: <Widget>[
            _getVideoBackground(),
          ],
        ),
      ),*/
    
  }
}