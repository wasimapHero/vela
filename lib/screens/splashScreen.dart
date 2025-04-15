import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:vela/screens/homepage.dart';
import 'package:vela/screens/intro_3_pages/introPage1.dart';
import 'package:vela/screens/intro_3_pages/intro_page_cage.dart';
import 'package:vela/screens/login/login_acc_suggest.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 1),() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => LoginAccSuggest()));
    });
  }
  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }


    List<Color> _kDefaultRainbowColors = [
      Color.fromARGB(255, 218, 28, 94),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(245, 247, 240, 255),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(flex: 1, child: Container()),
          Expanded(
              flex: 2,
              child: ElasticIn(
                duration: Duration(seconds: 3),
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  width: MediaQuery.of(context).size.width * (1 / 3),
                  height: MediaQuery.of(context).size.width * (1 / 3),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(
                      "assets/images/icons_svg/vela pic logo-01.png"),
                ),
              )),
          Expanded(
            flex: 2,
            child: Container(
              width: MediaQuery.of(context).size.width * (1 / 3),
              height: MediaQuery.of(context).size.width * (1 / 3),
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: LoadingIndicator(
                      indicatorType: Indicator.ballSpinFadeLoader,

                      /// Required, The loading type of the widget
                      colors: _kDefaultRainbowColors,

                      /// Optional, The color collections
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
