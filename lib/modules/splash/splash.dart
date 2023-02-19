

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled73/modules/bottom/bottom_pages/homePage.dart';
import '../../shared/conditinalLogin/ConditionLoginCustomer.dart';

class splashScreen extends StatefulWidget {
  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
          backgroundColor: Colors.grey.shade100 ,
          splashIconSize: MediaQuery.of(context).size.height*7000.0 ,
          splash:
          Container(
            width: MediaQuery.of(context).size.width ,
           child:
      Column(children: [
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(
                      top : MediaQuery.of(context).size.height*.4,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'CCI',
                        style: TextStyle(
                            fontFamily: 'poppins', fontSize: MediaQuery.of(context).size.height*.05, color: Colors.black , fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Club Car international',
                        style: TextStyle(
                            fontFamily: 'pacifico', fontSize: MediaQuery.of(context).size.height*.023, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex:0,
                child: Container(
                  child: Lottie.asset('assets/lf30_editor_wg2fmziq.json', width: 100 , height: 100  ),
                ),
              ),
            ]),
          ),
          splashTransition: SplashTransition.fadeTransition,
          animationDuration: Duration(seconds: 4),
          nextScreen:  ConditionLoginCustomer() ,
          pageTransitionType: PageTransitionType.leftToRight,
          duration: 6 ,
      );
  }
}
