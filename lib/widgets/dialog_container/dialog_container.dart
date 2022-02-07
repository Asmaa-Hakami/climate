//import 'dart:ffi';

//import 'package:climate_calendar_new/ui/navdraw.dart';
import 'package:climate_calendar_new/ui/top_icons.dart';
import 'package:flutter/material.dart';

class DialogContainer extends StatelessWidget {
  final Widget child;

  DialogContainer({required this.child});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      
      // backgroundColor: Colors.black54,
      body:     SafeArea(
           
      top: false,
      bottom: false,
     child:  Container(
                        decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/ramadan.png'),
                  fit: BoxFit.fill,
                ),
              ),
              
        child: Column(
          children: [
            TopIconsWhite(context, 0),
            child,
          ],
        )
        /*
        padding: const EdgeInsets.only(
          bottom: 15,
          left: 15,
          right: 15,
          top: 50,
        ),

        */
       // child: this.child,
      ),
      ),
      appBar: null,
       //drawer: const navigationDrawer(),
    );
  }
}
