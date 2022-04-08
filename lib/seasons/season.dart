// ignore_for_file: prefer_const_constructors

import 'package:auto_route/auto_route.dart';
import 'package:climate_calendar_new/data/seasons/seasons_data.dart';
import 'package:climate_calendar_new/data/zodiacs/zodiacs_data.dart';
import 'package:climate_calendar_new/ui/navdraw.dart';
import 'package:climate_calendar_new/ui/text_scale.dart';
import 'package:climate_calendar_new/ui/top_icons.dart';
import 'package:flutter/material.dart';

import '../all_data.dart';
import '../routes/ router.gr.dart';

// ignore: must_be_immutable
class Season extends StatefulWidget {
  int sNum;
  String sName;
  String left;
  Season(@PathParam() this.sNum, this.sName, this.left, {Key? key})
      : super(key: key);

  @override
  _Season createState() => _Season();
}

class _Season extends State<Season> {
  final List zo = ZodiacsData().zodiacData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(seasonsData[widget.sNum][1][0]),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              TopIconsGreen(context, 1),
              Container(
                padding: EdgeInsets.only(right: 5),
                width: MediaQuery.of(context).size.width * 0.9,
                alignment: Alignment.centerRight,
                child: TextScaleFactorClamper(
                    child: Text('فصل ' + widget.sName,
                        style: TextStyle(
                            color: Color(seasonsData[widget.sNum][5][0]),
                            height: 1.2,
                            fontSize: 30))),
              ),
              Row(
                children: [
                  Container(
                      padding: EdgeInsets.only(right: 25),
                      child: TextScaleFactorClamper(
                        child: Text(
                          seasonsData[widget.sNum][2][0],
                          style: TextStyle(
                              color: Color(seasonsData[widget.sNum][5][1]),
                              fontSize: 16,
                              height: 1.3,
                              fontFamily: 'ArbFONTS'),
                        ),
                      )),
                  TextScaleFactorClamper(
                    child: Text(
                      seasonsData[widget.sNum][2][1],
                      style: TextStyle(
                          color: Color(seasonsData[widget.sNum][5][1]),
                          fontSize: 16,
                          height: 1.3,
                          fontFamily: 'ArbFONTS'),
                    ),
                  )
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05),
                    child: GestureDetector(
                      onTap: () => context.router.push(SeasonInfo(
                          index: widget.sNum,
                          sName: widget.sName,
                          titleColor: seasonsData[widget.sNum][5][0])),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/images/char_botton.png',
                            color: Color(seasonsData[widget.sNum][5][5]),
                            width: MediaQuery.of(context).size.width * 0.47,
                            fit: BoxFit.fill,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/about.png',
                                height: 20.0,
                                color: Colors.white,
                              ),
                              Padding(padding: EdgeInsets.only(right: 7)),
                              Text(
                                'خصائص فصل ' + widget.sName,
                                 
                                style: TextStyle(
                                    fontSize: 15,
                                    height: 1.0,
                                    color: Colors.white,
                                    fontFamily: 'ArbFONTS'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.05,
                    top: MediaQuery.of(context).size.height * 0.013),
                child: Row(
                  children: [
                    Image.asset(
                      seasonsData[widget.sNum][6][0],
                      height: 20.0,
                      width: 20.0,
                    ),
                    TextScaleFactorClamper(
                        child: Text(
                      '   ' + seasonsData[widget.sNum][0],
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Color(seasonsData[widget.sNum][5][2]),
                          fontFamily: 'ArbFONTS'),
                    )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.05,
                    bottom: 10,
                    top: MediaQuery.of(context).size.height * 0.005),
                child: Row(
                  children: [
                    Image.asset(
                      seasonsData[widget.sNum][6][1],
                      height: 20.0,
                      width: 20.0,
                    ),
                    TextScaleFactorClamper(
                        child: Text(
                      '   ' + widget.left,
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Color(seasonsData[widget.sNum][5][2]),
                          fontFamily: 'ArbFONTS'),
                    )),
                  ],
                ),
              ),
              Flexible(
                  child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01,
                      ),
                      child: TextScaleFactorClamper(
                        child: Text(
                          'مواسم ${widget.sName}',
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Color(seasonsData[widget.sNum][5][3]),
                              fontFamily: 'ArbFONTS'),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01,
                        right: MediaQuery.of(context).size.width * 0.02),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for (var i = 0; i < 3; i++)
                            createZodiacBody(
                              text: ZodiacsData().zodiacData[
                                  seasonsData[widget.sNum][3][i]][0],
                              //.split(' ')[1],
                              text2: AllData.getZWhen(
                                  seasonsData[widget.sNum][3][i]),
                              onTap: () => context.router.push(ZodiacInfo(
                                  index: seasonsData[widget.sNum][3][i])),
                              zodiac: true,
                            ),
                        ]),
                  ),
                  if (seasonsData[widget.sNum][3].length > 3)
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01,
                          right: MediaQuery.of(context).size.width * 0.02),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (seasonsData[widget.sNum][3].length <= 6)
                              for (var i = 3;
                                  i < seasonsData[widget.sNum][3].length;
                                  i++)
                                createZodiacBody(
                                  text: ZodiacsData().zodiacData[
                                      seasonsData[widget.sNum][3][i]][0],
                                  //.split(' ')[1],
                                  text2: AllData.getZWhen(
                                      seasonsData[widget.sNum][3][i]),
                                  onTap: () => context.router.push(ZodiacInfo(
                                      index: seasonsData[widget.sNum][3][i])),
                                  zodiac: true,
                                ),
                            if (seasonsData[widget.sNum][3].length > 6)
                              for (var i = 3; i < 6; i++)
                                createZodiacBody(
                                  text: ZodiacsData().zodiacData[
                                      seasonsData[widget.sNum][3][i]][0],
                                  //.split(' ')[1],
                                  text2: AllData.getZWhen(
                                      seasonsData[widget.sNum][3][i]),
                                  onTap: () => context.router.push(ZodiacInfo(
                                      index: seasonsData[widget.sNum][3][i])),
                                  zodiac: true,
                                ),
                          ]),
                    ),
                  if (seasonsData[widget.sNum][3].length > 6)
                    Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.01,
                            right: MediaQuery.of(context).size.width * 0.02),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              for (var i = 6;
                                  i < seasonsData[widget.sNum][3].length;
                                  i++)
                                createZodiacBody(
                                  text: ZodiacsData().zodiacData[
                                      seasonsData[widget.sNum][3][i]][0],
                                  text2: AllData.getZWhen(
                                      seasonsData[widget.sNum][3][i]),
                                  onTap: () => context.router.push(ZodiacInfo(
                                      index: seasonsData[widget.sNum][3][i])),
                                  zodiac: true,
                                ),
                            ])),

//---------------------------------------Tawales---------------------------------------
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 90, vertical: 15),
                    child: Image(image: AssetImage('assets/icons/line.png')),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.01,
                        right: MediaQuery.of(context).size.width * 0.07),
                    child: Row(
                      children:
                          // ignore: prefer_const_literals_to_create_immutables
                          [
                        TextScaleFactorClamper(
                            child: Text(
                          'طوالع ${widget.sName}',
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Color(seasonsData[widget.sNum][5][3]),
                              fontFamily: 'ArbFONTS'),
                        )),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (var i = 0; i < 3; i++)
                            createZodiacBody(
                              text: AllData
                                  .tawalea[seasonsData[widget.sNum][4][i]][0],
                              text2: AllData.getTWhen(AllData
                                  .tawalea[seasonsData[widget.sNum][4][i]][0]),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      _buildPopupDialog(
                                          context,
                                          AllData.tawalea[
                                              seasonsData[widget.sNum][4][i]]),
                                );
                              },
                              zodiac: false,
                            ),
                        ],
                      ),
                      if (seasonsData[widget.sNum][4].length > 3)
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.01,
                              bottom: MediaQuery.of(context).size.height * 0.01,
                              right: MediaQuery.of(context).size.width * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (seasonsData[widget.sNum][4].length <= 6)
                                for (var i = 3;
                                    i < seasonsData[widget.sNum][4].length;
                                    i++)
                                  createZodiacBody(
                                    text: AllData.tawalea[
                                        seasonsData[widget.sNum][4][i]][0],
                                    text2: AllData.getTWhen(AllData.tawalea[
                                        seasonsData[widget.sNum][4][i]][0]),
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            _buildPopupDialog(
                                                context,
                                                AllData.tawalea[
                                                    seasonsData[widget.sNum][4]
                                                        [i]]),
                                      );
                                    },
                                    zodiac: false,
                                  ),
                              if (seasonsData[widget.sNum][4].length > 6)
                                for (var i = 3; i <= 5; i++)
                                  createZodiacBody(
                                    text: AllData.tawalea[
                                        seasonsData[widget.sNum][4][i]][0],
                                    text2: AllData.getTWhen(AllData.tawalea[
                                        seasonsData[widget.sNum][4][i]][0]),
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            _buildPopupDialog(
                                                context,
                                                AllData.tawalea[
                                                    seasonsData[widget.sNum][4]
                                                        [i]]),
                                      );
                                    },
                                    zodiac: false,
                                  ),
                            ],
                          ),
                        ),
                      if (seasonsData[widget.sNum][4].length > 6)
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height * 0.01,
                              right: MediaQuery.of(context).size.width * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (seasonsData[widget.sNum][4].length <= 9)
                                for (var i = 6;
                                    i < seasonsData[widget.sNum][4].length;
                                    i++)
                                  createZodiacBody(
                                    text: AllData.tawalea[
                                        seasonsData[widget.sNum][4][i]][0],
                                    text2: AllData.getTWhen(AllData.tawalea[
                                        seasonsData[widget.sNum][4][i]][0]),
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            _buildPopupDialog(
                                                context,
                                                AllData.tawalea[
                                                    seasonsData[widget.sNum][4]
                                                        [i]]),
                                      );
                                    },
                                    zodiac: false,
                                  ),
                              if (seasonsData[widget.sNum][4].length > 9)
                                for (var i = 6; i < 9; i++)
                                  createZodiacBody(
                                    text: AllData.tawalea[
                                        seasonsData[widget.sNum][4][i]][0],
                                    text2: AllData.getTWhen(AllData.tawalea[
                                        seasonsData[widget.sNum][4][i]][0]),
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            _buildPopupDialog(
                                                context,
                                                AllData.tawalea[
                                                    seasonsData[widget.sNum][4]
                                                        [i]]),
                                      );
                                    },
                                    zodiac: false,
                                  ),
                            ],
                          ),
                        ),
                      if (seasonsData[widget.sNum][4].length > 9)
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height * 0.01,
                              right: MediaQuery.of(context).size.width * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              for (var i = 9;
                                  i < seasonsData[widget.sNum][4].length;
                                  i++)
                                createZodiacBody(
                                  text: AllData.tawalea[seasonsData[widget.sNum]
                                      [4][i]][0],
                                  text2: AllData.getTWhen(AllData.tawalea[
                                      seasonsData[widget.sNum][4][i]][0]),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          _buildPopupDialog(
                                              context,
                                              AllData.tawalea[
                                                  seasonsData[widget.sNum][4]
                                                      [i]]),
                                    );
                                  },
                                  zodiac: false,
                                ),
                            ],
                          ),
                        ),
                    ],
                  )
                ]),
              )),
            ],
          ),
        ),
      ),
      drawer: const NavigationDrawer(),
    );
  }

  Widget createZodiacBody(
      {required String text,
      required String text2,
      required bool zodiac,
      required GestureTapCallback onTap}) {
    String image;
    int bottonColor;
    int titleColor;
    int subColor;
    if (zodiac == true && AllData.nowZodiac[0].contains(text) ||
        zodiac == false && AllData.nowTalea[0] == text) {
      image = 'assets/images/zodiac_show.png';
      titleColor = Colors.white.value;
      subColor = 0xffE8F0F0;
      bottonColor = seasonsData[widget.sNum][5][5];
    } else {
      image = 'assets/images/zodiac_show.png';
      titleColor = seasonsData[widget.sNum][5][4]; // 0xFF3F6E7B;
      subColor = seasonsData[widget.sNum][5][4];
      bottonColor = seasonsData[widget.sNum][5][6];
    }
    return GestureDetector(
      child: Stack(alignment: Alignment.center, children: <Widget>[
        Image.asset(
          image,
          color: Color(bottonColor),
          width: MediaQuery.of(context).size.width * 0.32,
          height: MediaQuery.of(context).size.height * 0.095,
          fit: BoxFit.fill,
        ),
        Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            TextScaleFactorClamper(
                child: Text(text,
                    style: TextStyle(
                        color: Color(titleColor),
                        fontSize: 16,
                        fontFamily: 'ArbFONTS'))),
            // ),
            TextScaleFactorClamper(
                child: Text(text2,
                    style: TextStyle(
                        color: Color(subColor),
                        fontSize: 12,
                        fontFamily: 'ArbFONTS'))),
          ],
        ),
      ]),
      onTap: onTap,
    );
  }

  Widget _buildPopupDialog(BuildContext context, List tawalea) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(0),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Image.asset(
                'assets/icons/close.png',
                height: 20,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Center(
              child: Column(
            children: [
              TextScaleFactorClamper(
                  child: Text(
                tawalea[0],
                // 
                style: const TextStyle(
                    fontSize: 18.0,
                    color: Color(0xff506B75),
                    fontWeight: FontWeight.bold,
                    height: 0.8,
                    fontFamily: 'ArbFONTS'),
              )),
              const SizedBox(
                height: 17,
                width: 200,
                child: Image(image: AssetImage('assets/icons/line.png')),
              ),
            ],
          )),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextScaleFactorClamper(
                  child: Text(
                ' ${tawalea[1]} ',
                // 
                style: const TextStyle(
                    fontSize: 20.0,
                    height: 1.0,
                    color: Color(0xff506B75),
                    fontFamily: 'ArbFONTS'),
              )),
              Container(
                width: 90,
                alignment: Alignment.centerRight,
                child: const TextScaleFactorClamper(
                    child: Text(
                  ":وقت الدخول",
                  style: TextStyle(
                      fontSize: 15.0,
                      height: 1.0,
                      color: Color(0xff506B75),
                      fontFamily: 'ArbFONTS'),
                )),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01,
                bottom: 20,
                left: 10), //right: tawalea[0].length.toDouble() + 22
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextScaleFactorClamper(
                    child: Text(
                  ' ${tawalea[2]}',
                  style: const TextStyle(
                      fontSize: 20.0,
                      height: 2,
                      color: Color(0xff506B75),
                      fontFamily: 'ArbFONTS'),
                )),
                Container(
                  width: 90,
                  alignment: Alignment.centerRight,
                  child: const TextScaleFactorClamper(
                      child: Text(
                    ":عدد الأيام",
                    style: TextStyle(
                        fontSize: 15.0,
                        height: 2,
                        color: Color(0xff506B75),
                        fontFamily: 'ArbFONTS'),
                  )),
                )
              ],
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    );
  }
}
