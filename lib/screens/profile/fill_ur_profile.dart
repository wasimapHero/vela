import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vela/classes/button_long.dart';
import 'package:vela/classes/colors.dart';
import 'package:vela/classes/textField.dart';
import 'package:vela/classes/textStyle.dart';
import 'package:vela/screens/bottomNavBar_other_pages/bottomNavBarPage.dart';
import 'package:vela/screens/congratulation_toUse_app.dart';
import 'package:vela/screens/homepage.dart';

class FillUrProfile extends StatefulWidget {
  const FillUrProfile({ Key? key }) : super(key: key);

  @override
  _FillUrProfileState createState() => _FillUrProfileState();
}

class _FillUrProfileState extends State<FillUrProfile> {

  final ButtonLong instance = ButtonLong();
  final ColorsList colors = ColorsList();
  final TextStyleClass textColor = TextStyleClass();
  final TextFieldClass textInput = TextFieldClass();

  
  bool visibility = true;
  bool remember = false;
  bool focusedPass = false;
  bool focusedEmail = false;

  TextEditingController full_name_Controller = TextEditingController();
  TextEditingController name_Controller = TextEditingController();
  TextEditingController email_Controller = TextEditingController();
  TextEditingController phn_number_Controller = TextEditingController();
  TextEditingController gender_Controller = TextEditingController();
  List<String> genderList = ["Female", "Male", "Other"];
  late String dropdownValue = "Female";


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
            title: Text("Fill Your Profile", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        toolbarHeight: 40,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
            
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*(1/6),
                        width: MediaQuery.of(context).size.width*(1/4),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage("assets/images/illustration_svg/default profile user.png", ),
                        ),
                      ),
                      Positioned(
                        bottom: 22,
                        right: 10,
                        child: Container(
                          height: 25,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), ),
                          child: SvgPicture.asset("assets/images/icons_svg/edit.svg", height: 22, color: colors.golapi,)))
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  child: textInput.inputText_without_prefix((v) {
                    setState(() {
                          focusedPass = false;
                          focusedEmail = true;
                        });
                  }, full_name_Controller, "Full Name", TextInputType.name)
                ),
                    SizedBox(height: 10,),
                    Container(
                  child: textInput.inputText_without_prefix((v) {
                    setState(() {
                          focusedPass = false;
                          focusedEmail = true;
                        });
                  }, name_Controller, "Nick Name", TextInputType.name)
                ),
                    SizedBox(height: 10,),
                    Container(
                  child: textInput.inputText_without_prefix((v) {
                    setState(() {
                          focusedPass = false;
                          focusedEmail = true;
                        });
                  }, email_Controller, "Email", TextInputType.emailAddress)
                ),
                    SizedBox(height: 10,),
                    Container(
                  child: textInput.inputText_without_prefix((v) {
                    setState(() {
                          focusedPass = false;
                          focusedEmail = true;
                        });
                  }, phn_number_Controller, "Phone Number", TextInputType.number)
                ),
                    SizedBox(height: 10,),
                    Container(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
                          suffixIcon: DropdownButtonFormField(
                            padding: EdgeInsets.only(left: 20, right: 20),
                          value: dropdownValue,
                          hint: Text("Gender"),
                          items: genderList.map(
                            (listValue) {
                              return DropdownMenuItem(
                                child: Text("$listValue"),
                                value: listValue,
                                );
                            }
                            ).toList(), 
                          onChanged: (newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                            
                          });
                          }),
                        ),
                      ),
                ),
            
                
                   Container(
                    // color: Colors.amber,
                    height: MediaQuery.of(context).size.height/5 - 10,
                    alignment: Alignment.bottomCenter,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         GestureDetector(
                          onTap: () {
                            
                          },
                           child: instance.shortButton(Color.fromARGB(255, 189, 172, 245), MediaQuery.of(context).size.width*(1/2)-30, "Skip", const Color.fromARGB(255, 142, 30, 233)),
                         ),
                         GestureDetector(
                          onTap: () {
                            
                            
                            
                            showDialog(context: context, builder: (BuildContext context) {
                              return AlertDialog(
                              content: Container(
                                height: MediaQuery.of(context).size.height*(1/2),
                                child: CongratulationToUseApp()
                                ),
                            );
                            });
                          },
                           child: instance.shortButton(Color.fromARGB(255, 126, 14, 218), MediaQuery.of(context).size.width*(1/2)-30, "Continue", Colors.white),
                         ),
                       ],
                     ),
                   ) 
              ],
            ),
          )
          ),
      ),
    );
  }
}