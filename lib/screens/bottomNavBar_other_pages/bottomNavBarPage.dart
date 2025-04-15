import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vela/classes/colors.dart';
import 'package:vela/classes/textStyle.dart';
import 'package:vela/screens/bottomNavBar_other_pages/download_page.dart';
import 'package:vela/screens/bottomNavBar_other_pages/explore_page.dart';
import 'package:vela/screens/bottomNavBar_other_pages/myList_page.dart';
import 'package:vela/screens/bottomNavBar_other_pages/profile_page.dart';
import 'package:vela/screens/homepage.dart';

class BottomNavBarPage extends StatefulWidget {
const BottomNavBarPage({ Key? key }) : super(key: key);

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  
  final ColorsList colors = ColorsList();
  final TextStyleClass textColor = TextStyleClass();
  
  List<Widget> pages = [
    Homepage(),
    ExplorePage(),
    MyListPage(),
    DownloadPage(),
    ProfilePage(),

  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: pages[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: colors.golapi,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: colors.golapi),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        showSelectedLabels: true,


        onTap: (int index) {
          setState(() {
            selectedIndex = index;
            print(selectedIndex);
          });
        },

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Home' , icon: SvgPicture.asset("assets/images/icons_svg/home.svg", height: 20, color: Colors.pink,)),
          BottomNavigationBarItem(

            label: 'Explore', icon: SvgPicture.asset("assets/images/icons_svg/explore.svg", height: 20, color: Colors.pink,)),
          BottomNavigationBarItem(

            label: 'My List', icon: SvgPicture.asset("assets/images/icons_svg/my list.svg", height: 20, color: Colors.pink,)),
          BottomNavigationBarItem(

            label: 'Downloads', icon: SvgPicture.asset("assets/images/icons_svg/downloads.svg", height: 20, color: Colors.pink,)),
          BottomNavigationBarItem(

            label: 'Profile', icon: SvgPicture.asset("assets/images/icons_svg/user.svg", height: 20, color: Colors.pink,)),
        ]
        ),
    );
  }
}