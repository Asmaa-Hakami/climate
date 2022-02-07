
import 'dart:async';

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:video_player/video_player.dart';

import '../home_page.dart';
//import '../main.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

      @override void initState() { 
    super.initState(); 
    Future.delayed( const Duration(seconds: 7), () =>
    Navigator.pushReplacement( context, 
    MaterialPageRoute(builder: (context) => const HomePage()),
       ));
     }
  /*
  late VideoPlayerController? _controller;
  bool _visible = true;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    _controller = VideoPlayerController.asset("assets/video/start.mp4");
    _controller!.initialize().then((_) {
      _controller!.setLooping(true);
      Timer(const Duration(milliseconds: 100), () {
        setState(() {
          _controller!.play();
          _visible = true;
        });
      });
    });

    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(MyApp.nowStatus)),
          (e) => false);
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (_controller != null) {
      _controller!.dispose();
      _controller = null;
    }
  }

  _getVideoBackground() {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 1000),
      child: VideoPlayer(_controller!),
    );
  }

/*
  _getBackgroundColor() {
    return Container(color: Colors.transparent //.withAlpha(120),
        );
  }

  _getContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
    );
  }
  */
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white, 
       body: Container( 
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