



// ignore_for_file: prefer_const_constructors

import 'package:climate_calendar_new/months/months.dart';
import 'package:climate_calendar_new/seasons/seasons.dart';
import 'package:flutter/material.dart';

import '../home_page.dart';
import '../home_zodiac.dart';
import 'text_scale.dart';

class NavigationBarBottom extends StatefulWidget {
  //List nowStatus;
  int selectedIndex;
  NavigationBarBottom(this.selectedIndex, {Key? key}) : super(key: key);
  @override
  _NavigationBarBottom createState() => _NavigationBarBottom();
}

class _NavigationBarBottom extends State<NavigationBarBottom> {

 late int _selectedIndex = widget.selectedIndex;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>  HomePage()), //nowStatus[0][1]
        );
      } else if (index == 1) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Seasons()));
      } else if (index == 2) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomeZodiac()));
      } else if (index == 3) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Months()));
      }
      else{}
    });
  }
  @override
  Widget build(BuildContext context) {
  return Container(
     //height: 65,//MediaQuery.of(context).size.height * 0.1,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/nav_back.png'),
                fit: BoxFit.fill //fitHeight,
                ),
          ),

  child: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Image(image: AssetImage('assets/icons/home.png'), height: 25,),
            title: Column(children: [
              TextScaleFactorClamper(
                              child:Text('الرئيسية', style: TextStyle(fontSize: 11, height: 1.5, color: const Color(0xff3A6978)), 
                              //extScaleFactor: 1.0
                              )),
              if(_selectedIndex == 0 )
              Image(image: AssetImage('assets/icons/nav_circle.png'), height: 10,),
            ],),
          ),

          BottomNavigationBarItem(
            icon: Image(image: AssetImage('assets/icons/seasons.png'), height: 25,),
            title: Column(children: [
              TextScaleFactorClamper(
                              child:Text('الفصول', style: TextStyle(fontSize: 11, height: 1.5, color: const Color(0xff3A6978)), 
                              //textScaleFactor: 1.0
              )),
              if(_selectedIndex == 1 )
              Image(image: AssetImage('assets/icons/nav_circle.png'), height: 10,),
            ],),
          ),

          BottomNavigationBarItem(
            icon: Image(image: AssetImage('assets/icons/zodiac.png'), height: 25,),
            title: Column(children: [
              Padding(padding: EdgeInsets.all(0)),
              //Image(image: AssetImage('assets/icons/zodiac.png'), height: 25,),
              TextScaleFactorClamper(
                              child:Text('المواسم',  style: TextStyle(fontSize: 11, height: 1.5, color: const Color(0xff3A6978)), 
                              //textScaleFactor: 1.0
              )),
              if(_selectedIndex == 2 )
              Image(image: AssetImage('assets/icons/nav_circle.png'), height: 10,),
            ],),
          ),
                    BottomNavigationBarItem(
            icon: Image(image: AssetImage('assets/icons/months.png'), height: 25,),
            title: Column(children: [
              TextScaleFactorClamper(
                              child:Text('الأشهر', style: TextStyle(fontSize: 11, height: 1.5, color: const Color(0xff3A6978)), 
                             // textScaleFactor: 1.0
              )),
              if(_selectedIndex == 3 )
              Image(image: AssetImage('assets/icons/nav_circle.png'), height: 10,),
            ],),
            
          ),
        ],
        //elevation: 10.0,
        showUnselectedLabels: true,
        //currentIndex: _selectedIndex,
        
        onTap: _onItemTapped,
        
  ));
}
}