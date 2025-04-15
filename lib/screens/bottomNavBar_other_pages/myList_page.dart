import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vela/classes/appbar.dart';
import 'package:vela/classes/colors.dart';

class MyListPage extends StatefulWidget {
  const MyListPage({ Key? key }) : super(key: key);

  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {

  CustomAppBar customAppBar = CustomAppBar();
  final ColorsList colors = ColorsList();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: customAppBar.customAppBar("My List"),
      body: SafeArea(
        child: Stack(
          children: [
        
             Container(
                height: 80,
                child: customAppBar.customAppBar("My List", MediaQuery.of(context).size.width),
              ),
          
              SizedBox(height: 15,),
              
            Container(
              margin: EdgeInsets.only(top: 70),
              child: Center(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*(1/3)+50,
                      width: MediaQuery.of(context).size.width*(3/5),
                      child: SvgPicture.asset("assets/images/illustration_svg/undraw_no_data_re_kwbl.svg", color: Colors.grey,)
                    ),
                    SizedBox(height: 10,),
                    Text("Your List is empty", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: colors.beguni),),
                    SizedBox(height: 10,),
                    Text("It seems that you haven't added", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,),),
                    SizedBox(height: 10,),
                    Text("any movies to the list", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,),),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}