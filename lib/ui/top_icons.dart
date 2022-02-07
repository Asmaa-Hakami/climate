         

import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget TopIconsWhite(BuildContext context, int num){
  if (num == 0){
                   return Padding(
                     padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02,right: MediaQuery.of(context).size.width * 0.015),
                   child:Row(
                      children: [
                         Expanded(child: Container()),
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new_rounded,
                              size: 20, color: Colors.white,), // 0xFF3A6978
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                   ),
                    );  }
                   return Padding(
                     padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02,right: MediaQuery.of(context).size.width * 0.015),
                   child:Row(
                      children: [
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset(
                              'assets/icons/white_list.png',
                              height: 15,
                            ),
                            onPressed: () => Scaffold.of(context).openDrawer(),
                          ),
                        ),
                         Expanded(child: Container()),
                        if (num == 2)
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new_rounded,
                              size: 20, color: Colors.white,), // 0xFF3A6978
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                   ),
                    );
}

// ignore: non_constant_identifier_names
Widget TopIconsGreen(BuildContext context, int num){
                   return Padding(
                     padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02,right: MediaQuery.of(context).size.width * 0.02, left: MediaQuery.of(context).size.width * 0.02),
                   child:Row(
                      children: [
                        Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset(
                              'assets/icons/green_list.png',
                              height: 15,
                            ),
                            onPressed: () => Scaffold.of(context).openDrawer(),
                          ),
                        ),
                        Expanded(child: Container()),
                        if (num == 2)
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new_rounded,
                              size: 20, color: Color(0xff506B75)), // 0xFF3A6978
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                   ),
                    );
}