import 'package:flutter/material.dart';

class IntroPage1 extends StatefulWidget {
const IntroPage1({ Key? key }) : super(key: key);


  @override
  State<IntroPage1> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> {



  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Image.asset("assets/images/illustration_svg/rotated bg1.png",height: double.infinity, width: double.infinity, fit: BoxFit.cover,),
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