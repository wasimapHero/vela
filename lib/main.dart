import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vela/firebase_options.dart';
import 'package:vela/screens/bottomNavBar_other_pages/bottomNavBarPage.dart';
import 'package:vela/screens/congratulation_toUse_app.dart';
import 'package:vela/screens/homepage.dart';
import 'package:vela/screens/login/create_acc_page.dart';
import 'package:vela/screens/login/login_acc_suggest.dart';
import 'package:vela/screens/login/login_page.dart';
import 'package:vela/screens/movie_page/movie_page.dart';
import 'package:vela/screens/profile/fill_ur_profile.dart';
import 'package:vela/screens/splashScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp( 
  options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  User? user;
    @override
  void initState() {
    // TODO: implement initState
    user = FirebaseAuth.instance.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  user!= null ? BottomNavBarPage() : SplashScreenPage(),
      // home: LoginAccSuggest(),
      // home: CreateAccPage(),
      // home: LoginPage(),
      // home: FillUrProfile(),
      // home: Homepage(),
      // home: BottomNavBarPage(),
      // home: MoviePage(),
    );
  }
}