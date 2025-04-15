import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vela/screens/login/login_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({ Key? key }) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  TextEditingController takeEmailForgotPassCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forgot Password"), centerTitle: true,),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 200,
                  child: SvgPicture.asset('assets/images/illustration_svg/undraw_my_password_re_ydq7.svg', fit: BoxFit.cover),
                ),
                SizedBox(height: 30,),
      
                FadeInLeft(
                  duration: Duration(milliseconds: 1800),
                  child: TextFormField(
                    controller: takeEmailForgotPassCon,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      )
                    ),
                    
                  ),
                ),
                
                
                SizedBox(height: 20,),
                FadeInUp(child: ElevatedButton(onPressed: () async{

                  var takeEmailForgotPass = takeEmailForgotPassCon.text.trim();

                  try {
                    await FirebaseAuth.instance.sendPasswordResetEmail(email: takeEmailForgotPass)
                    .then((value) {
                      print("email sent");
                      
                    });
                  } on FirebaseAuthException catch (e) {
                    print("Error $e");
                  }
                  Fluttertoast.showToast(msg: "Check your email \n Email sent.", fontSize: 20);
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) { return  LoginPage(); }));
                      Future.delayed(Duration(milliseconds: 2), (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) { return  LoginPage(); }));
                      });

                }, child: Text("Recover Password"))),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}