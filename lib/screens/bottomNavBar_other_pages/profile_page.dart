import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vela/classes/appbar.dart';
import 'package:vela/classes/colors.dart';
import 'package:vela/classes/download_listTile.dart';
import 'package:vela/screens/login/login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final CustomAppBar customAppBar = CustomAppBar();
    final ColorsList colors = ColorsList();
    final Download_ListTile download_listTile = Download_ListTile();

    List<String> titles = ["Edit Profile", "Notification", "Download", "Security", "Dark Mode", "Help Center"]; 
    bool color_of_listTile = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Stack(
                children: [
              
                   Container(
                      height: 80,
                      child: customAppBar.customAppBar("Profile", MediaQuery.of(context).size.width),
                    ),
                
                    SizedBox(height: 15,),
              
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 70),
                    // color: Colors.amber,
                    child: Stack(
                      children: [
                       GestureDetector(
                        onTap: () {
                          // Navigator.pop(context, ImageSource.camera);
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height*(1/6),
                              width: MediaQuery.of(context).size.width*(1/4),
                              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*(2/5) - 10,),
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
                      Stack(
                        children: [
                          Positioned(
                            top: MediaQuery.of(context).size.height*(1/6) ,
                            left: MediaQuery.of(context).size.width*(1.5/5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Wasima Akhter", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                            Text("wasimaesty@gmail.com", style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),),
                              ],
                            ),
                          ),
                      
                      SizedBox(height: 15,),
                      Container(
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*(1/6) + 100, left: 25, right: 20),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  // color_of_listTile = !color_of_listTile;
                                });
                              },
                              child: Container( 
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration( 
                                  borderRadius: BorderRadius.circular(50),
                                  color: (!color_of_listTile) ? Colors.transparent : Color.fromARGB(255, 216, 205, 249)
                                )
                                , 
                              child: download_listTile.download_ListTile("Edit Profile", Icon(Icons.edit,)))),
              
                              GestureDetector(
                              onTap: () {
                                setState(() {
                                  // color_of_listTile = !color_of_listTile;
                                });
                              },
                              child: Container( 
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration( 
                                  borderRadius: BorderRadius.circular(50),
                                  color: (!color_of_listTile) ? Colors.transparent : Color.fromARGB(255, 216, 205, 249)
                                )
                                , 
                              child: download_listTile.download_ListTile("Notification", Icon(Icons.notifications,)))),
              
                              GestureDetector(
                              onTap: () {
                                setState(() {
                                  // color_of_listTile = !color_of_listTile;
                                });
                              },
                              child: Container( 
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration( 
                                  borderRadius: BorderRadius.circular(50),
                                  color: (!color_of_listTile) ? Colors.transparent : Color.fromARGB(255, 216, 205, 249)
                                )
                                , 
                              child: download_listTile.download_ListTile("Download", Icon(Icons.download,)))),
                              GestureDetector(
                              onTap: () {
                                setState(() {
                                  // color_of_listTile = !color_of_listTile;
                                });
                              },
                              child: Container( 
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration( 
                                  borderRadius: BorderRadius.circular(50),
                                  color: (!color_of_listTile) ? Colors.transparent : Color.fromARGB(255, 216, 205, 249)
                                )
                                , 
                              child: download_listTile.download_ListTile("Security", Icon(Icons.security,)))),
                              
                              GestureDetector(
                              onTap: () {
                                setState(() {
                                  // color_of_listTile = !color_of_listTile;
                                });
                              },
                              child: Container( 
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration( 
                                  borderRadius: BorderRadius.circular(50),
                                  color: (!color_of_listTile) ? Colors.transparent : Color.fromARGB(255, 216, 205, 249)
                                )
                                , 
                              child: download_listTile.download_ListTile("Dark Mode", Icon(Icons.dark_mode,)))),
                              GestureDetector(
                              onTap: () {
                                setState(() {
                                  // color_of_listTile = !color_of_listTile;
                                });
                              },
                              child: Container( 
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration( 
                                  borderRadius: BorderRadius.circular(50),
                                  color: (!color_of_listTile) ? Colors.transparent : Color.fromARGB(255, 216, 205, 249)
                                )
                                , 
                              child: download_listTile.download_ListTile("Help Center", Icon(Icons.help_center,)))),
                              GestureDetector(
                              onTap: () {
                                setState(() {
                                  FirebaseAuth.instance.signOut();
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
                                });
                              },
                              child: Container( 
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration( 
                                  borderRadius: BorderRadius.circular(50),
                                  color: (!color_of_listTile) ? Colors.transparent : Color.fromARGB(255, 216, 205, 249)
                                )
                                , 
                              child: download_listTile.download_ListTile("Sign out", Icon(Icons.help_center,)))),
                 
                          ],
                        )
                          
                      )
                        ],
                      )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}