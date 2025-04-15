import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:vela/screens/login/login_page.dart';

signupUser(String email, String pass) async {

  User? currentUser = FirebaseAuth.instance.currentUser;

  try {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser!.uid)
        .set({
      // "username": username,
      // "phnnum": phnnum,
      "email": email,
      "password": pass,
      "createdAt": DateTime.now(),
      "userId": currentUser.uid,
    }).then((value) {
      FirebaseAuth.instance.signOut();
      Get.to(() => LoginPage());
    });
  } on FirebaseAuthException catch (e) {
    print("Error $e");
  }
}
