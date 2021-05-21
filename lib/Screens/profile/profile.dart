import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:market/Screens/constants.dart';
import 'package:market/Widgets/pref_userdata.dart';
import 'package:market/auth/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileMain extends StatefulWidget {

  ProfileMain({Key key, this.currentPage}): super (key: key);
  final String currentPage;
  @override
  _ProfileMainState createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {

  var _scafoldkey= new GlobalKey<ScaffoldState>();
  DocumentSnapshot varible;
  bool isloading = false;
  List userdata=[];

  String savedtext="";

  Future<SharedPreferences> _prefs= SharedPreferences.getInstance();
  SharedPreferences prefs;

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: _scafoldkey,
        body: isloading ? Center(child: CircularProgressIndicator()) :Stack(
          children: [
            Center(
              child: Container(
                height: size.height,
                width: size.width,
                color: details_screen,
                child: Image.asset("assets/images/cat_bg5.png", fit: BoxFit.fill,),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    height: (size.height/2)+ (size.height/4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // edit
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     Padding(
                        //       padding: const EdgeInsets.only(top: 20, right: 20),
                        //       child: GestureDetector(
                        //         onTap: (){
                        //           Navigator.push(context, MaterialPageRoute(builder: (context)=> Editprofile()));
                        //         },
                        //         child: Text("Edit")
                        //       ),
                        //     )
                        //
                        //   ],
                        // ),
                        Container(
                          height: 300,
                          width: double.infinity,
                          // color: details_screen,
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                // color: Colors.greenAccent,
                              ),
                              height: 140,
                              width: 140,
                              child: Stack(
                                children: [
                                  Center(child: CircularProgressIndicator()),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(70),
                                    child: Image.asset(
                                      "assets/images/user.jpg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Center(
                            child: Text(
                              AllUserData[5],
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Center(
                            child: Text(
                              AllUserData[3],
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: (size.height/4- 102)/2),
                    height: size.height/4- 106,
                    child: GestureDetector(
                        child: Text("Sign Out"),
                      onTap: (){
                        FirebaseAuth.instance.signOut().then((onValue) {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginAuth()));
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ),

    );
  }

  void load() {
    if(AllUserData.isEmpty){
      setState(() {
        isloading=true;
      });
    }
    Future.delayed(const Duration(seconds: 2), () {
      if(AllUserData.isNotEmpty){
        setState(() {
          isloading=false;
        });
      }
    });

  }



}




