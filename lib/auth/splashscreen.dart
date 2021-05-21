import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:market/Screens/home/home_screen.dart';
import 'package:market/Widgets/bottom_nav.dart';
import 'package:market/Widgets/pref_userdata.dart';
import 'package:market/auth/Login.dart';
import 'file:///C:/Users/adity/Downloads/market/lib/Widgets/NoInternert_splash.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  DocumentSnapshot varible;
  @override
  void initState() {
    super.initState();
    cnnection();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.redAccent,
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("assets/lottie/dream-catcher.json", height: 300, width: 300),
              SizedBox(height: 70,),
              Text(
                "E-Market",
                style: TextStyle(
                  fontSize: 30
                ),

              )
            ],
          ),
        ),
      ),
    );
  }

  void dataupload()async {
    String useruid = FirebaseAuth.instance.currentUser.uid.toString();
    varible = await FirebaseFirestore.instance.collection("Users").doc(useruid).get();
    AllUserData.add(varible['address']); //  0  adrress
    AllUserData.add(varible['contact']); //  1 contact
    AllUserData.add(varible['docid']); // 2   docid
    AllUserData.add(varible['email']); //  3  email
    AllUserData.add(varible['image']); // 4   image
    AllUserData.add(varible['name']); // 5    name
    print(AllUserData);
    print("---------------------------------------------");
  }

  void cnnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi ) {
      // I am connected to a mobile network.
      print("mobile");
      Timer(Duration(seconds: 4), () {
        if (FirebaseAuth.instance.currentUser == null ) {
          // user not logged ==> Login Screen
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (_) => LoginAuth()), (route) => false);
        } else {
          dataupload();
          Future.delayed(const Duration(seconds: 4), () {
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (_) => BottomNavigation()), (route) => false);
            print("mobile or wifi");
          });
          // user already logged in ==> Home Screen

        }
      });
    }
    else {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> NoInternet()));
      print("none");
    }
  }
}


