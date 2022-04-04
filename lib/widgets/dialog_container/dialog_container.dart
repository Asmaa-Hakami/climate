import 'package:climate_calendar_new/ui/top_icons.dart';
import 'package:flutter/material.dart';

class DialogContainer extends StatelessWidget {
  final Widget child;

  const DialogContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:
                    NetworkImage('https://i.postimg.cc/qqdPg7tr/ramadan.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                TopIconsWhite(context, 0),
                child,
              ],
            )),
      ),
      appBar: null,
    );
  }
}
