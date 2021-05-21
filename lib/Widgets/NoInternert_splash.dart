import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:market/Screens/constants.dart';
import 'package:market/Screens/home/home_screen.dart';
import 'package:market/Widgets/bottom_nav.dart';
import 'package:market/Widgets/pref_userdata.dart';
import 'package:market/auth/splashscreen.dart';

class NoInternet extends StatefulWidget {
  @override
  _NoInternetState createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {

  bool isloading= false;
  DocumentSnapshot varible;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // dataupload();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: white,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 70,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset("assets/lottie/nointernet.json", height: 270, width: 270),
                    SizedBox(height: 150,),
                    Container(
                      child: isloading ? Center(child: CircularProgressIndicator()) :  ElevatedButton(
                        child: Text("Retry"),
                        onPressed: (){
                          check_connection();
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
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


  void check_connection() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    setState(() {
      isloading= true;
    });
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi ) {

      // I am connected to a mobile network.
      if(AllUserData.isEmpty){
        dataupload();
      }
      Future.delayed(const Duration(seconds: 4), () {
            setState(() {isloading=false;});
            Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNavigation()));
            print("mobile or wifi");
        });
    }
    else {
      Future.delayed(const Duration(seconds: 4), () {
        setState(() {isloading=false;});
        print("none");
      });

    }

  }
}
