import 'package:flutter/material.dart';

class IntroPage2 extends StatefulWidget {
const IntroPage2({ Key? key }) : super(key: key);

  @override
  _IntroPage2State createState() => _IntroPage2State();
}

class _IntroPage2State extends State<IntroPage2> {


  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Image.asset("assets/images/illustration_svg/rotated bg2.png",height: double.infinity, width: double.infinity, fit: BoxFit.cover,),
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height*(3/4),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Color.fromARGB(255, 7, 7, 7).withOpacity(0.9), Colors.transparent])
                ),
              )
              )
          ],
        ),
      ),
    );
  }
}