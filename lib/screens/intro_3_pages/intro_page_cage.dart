import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vela/screens/bottomNavBar_other_pages/bottomNavBarPage.dart';
import 'package:vela/screens/homepage.dart';
import 'package:vela/screens/intro_3_pages/introPage1.dart';
import 'package:vela/screens/intro_3_pages/introPage2.dart';
import 'package:vela/screens/intro_3_pages/introPage3.dart';
import 'package:vela/screens/profile/fill_ur_profile.dart';

class IntroPageCage extends StatefulWidget {
  const IntroPageCage({ Key? key }) : super(key: key);

  @override
  _IntroPageCageState createState() => _IntroPageCageState();
}

class _IntroPageCageState extends State<IntroPageCage> {

  List<Widget> introPages = [
    const IntroPage1(),
    const IntroPage2(),
    const IntroPage3()
  ];
  PageController pageView_Controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageView_Controller,
            itemCount: introPages.length,
            itemBuilder: (context, index) {
              return introPages[index];
            }
            ),

            Positioned(
              bottom: 0,
              left: 28,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Welcome To Vela", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white,),),
                  SizedBox(height: 20,),
                  Text("The best movie streaming app of the country", style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 236, 234, 234),),),
                  Text("to make your days better!", style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 236, 234, 234),),),
              
                  SizedBox(height: 20,),
              
              SmoothPageIndicator(
              controller: pageView_Controller, 
              count: introPages.length,
              effect: WormEffect(
                dotHeight: 16,
                dotWidth: 16,
                dotColor: Color.fromARGB(255, 189, 14, 81)
              ),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => FillUrProfile()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width*(4/5),
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 196, 12, 95),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Center(child: Text("Get Started", style: TextStyle(fontSize: 12, color: Colors.white,))),
                ),
                
              ),
              SizedBox(height: 20,),
              SizedBox(height: 20,),
              
              
              
              
                ],
              )
              )

            
        ],
      ),
    );
  }
}