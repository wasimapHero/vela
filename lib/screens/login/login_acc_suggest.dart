import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vela/classes/button_long.dart';
import 'package:vela/classes/colors.dart';
import 'package:vela/classes/textStyle.dart';
import 'package:vela/screens/login/create_acc_page.dart';

class LoginAccSuggest extends StatefulWidget {
  const LoginAccSuggest({ Key? key }) : super(key: key);

  @override
  _LoginAccSuggestState createState() => _LoginAccSuggestState();
}

class _LoginAccSuggestState extends State<LoginAccSuggest> {

  final ButtonLong instance = ButtonLong();
  final ColorsList colors = ColorsList();
  final TextStyleClass textColor = TextStyleClass();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back))),
        toolbarHeight: 100,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/5,
                  width: MediaQuery.of(context).size.width/2,
                  child: SvgPicture.asset("assets/images/illustration_svg/undraw_mobile_login_re_9ntv (1).svg")),
                SizedBox(height: 10,),
                Text("Let's you in", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Container(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: (){

                        },
                        child: instance.long_button_white("assets/images/icons_svg/facebook.png", MediaQuery.of(context).size.width*(4/5)-30, "Continue with Facebook"),
                      ),
                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){

                        },
                        child: instance.long_button_white("assets/images/icons_svg/google.png", MediaQuery.of(context).size.width*(4/5)-30, "Continue with Google"),
                      ),
            
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(width: MediaQuery.of(context).size.width*(1.1/3), child: Divider(color: Colors.grey.withOpacity(0.5), thickness: 0.5,)),
                    Container(margin: EdgeInsets.symmetric(horizontal: 5), child: Text("or", style: textColor.colorStyleGrey(),)),
                    Container(width:MediaQuery.of(context).size.width*(1.1/3), child: Divider( color: Colors.grey.withOpacity(0.5), thickness: 0.5,))
                  ],
                ),
                SizedBox(height: 25,),
                GestureDetector(
                  onTap: () {

                  },
                  child: instance.long_button_golapi(MediaQuery.of(context).size.width*(4/5)-30, "Sign in With password"),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    SizedBox(width: 5,),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CreateAccPage()));
                      },
                      child: Text("Sign up", style: TextStyle(fontWeight: FontWeight.w500, color: colors.golapi),)),
                  ],
                ),
                SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}