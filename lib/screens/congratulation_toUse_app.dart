import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:vela/classes/colors.dart';
import 'package:vela/screens/bottomNavBar_other_pages/bottomNavBarPage.dart';
import 'package:vela/screens/homepage.dart';

class CongratulationToUseApp extends StatefulWidget {
  const CongratulationToUseApp({ Key? key }) : super(key: key);

  @override
  _CongratulationToUseAppState createState() => _CongratulationToUseAppState();
}

class _CongratulationToUseAppState extends State<CongratulationToUseApp> {

  final ColorsList colors = ColorsList();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => BottomNavBarPage()));
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset("assets/images/illustration_svg/congrates pic-01.png", fit: BoxFit.cover,),
              )),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Text("Congratulations!", style: TextStyle(color: Colors.pink.shade600, fontWeight: FontWeight.bold, fontSize: 25),),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Your account is ready to use. You will"),
                      Text(" be redirected to Home Page in a"),
                      Text("few seconds."),
                    ],
                  ),
              
                  Container(
                    // color: Colors.amber,
                    width: MediaQuery.of(context).size.width * (1 / 4),
                    height: MediaQuery.of(context).size.height * (1 / 6),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: LoadingIndicator(
                      indicatorType: Indicator.ballSpinFadeLoader,
                      colors: [Colors.pink.shade600],
                      ),
                  )],
              ),
            )
          ],
        ),
      )
   ;
  }
}