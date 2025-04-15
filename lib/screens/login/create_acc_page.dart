import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vela/classes/button_long.dart';
import 'package:vela/classes/colors.dart';
import 'package:vela/classes/textStyle.dart';
import 'package:vela/firebase_store.dart';
import 'package:vela/screens/login/login_page.dart';
import 'package:vela/screens/profile/fill_ur_profile.dart';

class CreateAccPage extends StatefulWidget {
  const CreateAccPage({ Key? key }) : super(key: key);

  @override
  _CreateAccPageState createState() => _CreateAccPageState();
}

class _CreateAccPageState extends State<CreateAccPage> {


  TextEditingController email_Controller = TextEditingController();
  TextEditingController pass_Controller = TextEditingController();

  final ButtonLong instance = ButtonLong();
  final ColorsList colors = ColorsList();
  final TextStyleClass textColor = TextStyleClass();

  bool visibility = true;
  bool remember = false;
  bool focusedPass = false;
  bool focusedEmail = false;

  User? currentUser = FirebaseAuth.instance.currentUser;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(left: 20, top: 15),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back))),
        toolbarHeight: 40,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height/7,
                    width: MediaQuery.of(context).size.width/3,
                    child: Image.asset("assets/images/icons_svg/text vela logo-01.png",height: double.infinity, width: double.infinity, fit: BoxFit.contain,)),
                  SizedBox(height: 20,),
                  Text("Create Your Account", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20,),
                  Container(
                    height: MediaQuery.of(context).size.height/5,
                    child: Column(
                      children: [
                        TextField(
                    controller: email_Controller,
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.w400),
                      prefixIcon: Container(margin: EdgeInsets.only(left: 15, right: 10)  ,child: Icon(Icons.email)),
                      prefixIconColor: (!focusedEmail && focusedPass) ? Colors.grey.shade400 : colors.golapi,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      )
                    ),
                    onChanged: (v) {
                      setState(() {
                        focusedPass = false;
                        focusedEmail = true;
                      });
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    controller: pass_Controller,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.w400),
                      prefixIcon: Container(margin: EdgeInsets.only(left: 15, right: 10)  ,child: Icon(Icons.lock)),
                      prefixIconColor: (!focusedPass && focusedEmail) ? Colors.grey.shade400 : colors.golapi,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            visibility = !visibility;
                          });
                        },
                        child: visibility ? Icon(Icons.visibility_off) : Icon(Icons.visibility)),
                      suffixIconColor: (!focusedPass) ? Colors.grey.shade400 : colors.golapi,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      )
                    ),
                    onChanged: (v) {
                      setState(() {
                        focusedPass = true;
                        focusedEmail = false;
                      });
                    },
                    obscureText: visibility ? false : true,
                  ),],
                    ),
                  ),

                  SizedBox(height: 15,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(value: !remember ? false : true, onChanged: (v) {
                          setState(() {
                            remember = !remember;
                          });
                          print("onchanged value is: $v");
                        }),
                        Text("Remember me", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, ),)
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  GestureDetector(
                    onTap: () async{
                      
                  var email = email_Controller.text.trim();
                  var pass = pass_Controller.text.trim();

                  try {
                    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass)
                    .then((value) {
                      signupUser(email, pass);
                    } 
                    );
                  } on FirebaseAuthException catch (e) {
                    print("Error $e");
                    }
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));

                    },
                    child: instance.long_button_beguni(MediaQuery.of(context).size.width*(4/5)-30, "Sign up"),
                  ),
                  SizedBox(height: 25,),
                  Text("or Continue with"),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          
                        },
                        child: instance.squareIconButton("assets/images/icons_svg/google.png")),
                        SizedBox(width: 18,),
                      GestureDetector(
                        onTap: () {

                        },
                        child: instance.squareIconButton("assets/images/icons_svg/facebook.png")),
                    ],
                  ),
                  SizedBox(height: 40,),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    SizedBox(width: 5,),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => FillUrProfile()));
                      },
                      
                      child: Text("Sign in", style: TextStyle(fontWeight: FontWeight.w500, color: colors.golapi),)),
                  ],
                ),
                
                ],
              )),
          ))
        ),
    );
  }
}