import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market/Screens/All%20Shops/search_shop.dart';
import 'package:market/Screens/home/components/body_home.dart';
import 'package:market/Screens/home/components/carousel_slider.dart';
import 'package:market/Screens/home/components/drawer.dart';
import 'package:market/Screens/home/components/recommended_shops.dart';
import 'package:market/Screens/home/components/title_head.dart';
import 'package:market/Widgets/pref_userdata.dart';
import 'package:market/auth/Login.dart';
import '../constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final String title= "Recomended";
  String email="";
  final _advancedDrawerController = AdvancedDrawerController();
  TextEditingController _search= new TextEditingController();
  DocumentSnapshot varible;
  String username="", name=" ";



  @override
  void initState() {
    // TODO: implement initState
    getData233().then(updatename);
    if(AllUserData.isEmpty){
      dataupload();
    }
    print("]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]");
    print(AllUserData);
    // name=FirebaseAuth.instance.currentUser.displayName.toString();
    email=FirebaseAuth.instance.currentUser.email.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AdvancedDrawer(
      backdropColor: nav_baground,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 500),
      childDecoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
          appBar: AppBar(
            // backgroundColor: Colors.blueGrey,
            title: const Text(''),
            elevation: 0,
            leading: IconButton(
              onPressed: _handleMenuButtonPressed,
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _advancedDrawerController,
                builder: (context, value, child) {
                  return Icon(
                    value.visible ? Icons.clear : Icons.menu,
                  );
                },
              ),
            ),
            actions: [
              FlatButton(
                onPressed: (){
                  FirebaseAuth.instance.signOut().then((onValue) {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginAuth()));
                  });

                },
                child: Icon(Icons.exit_to_app, color: Colors.white,),)
            ],
          ),









        body: body_home(size: size, search: _search, title: title)

      ),
      drawer: Drawer_home(email: email),

    );
  }



  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
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
    print("============================");
  }


  void updatename(String name){
    setState(() {
      this.username= name;
    });

  }

}
