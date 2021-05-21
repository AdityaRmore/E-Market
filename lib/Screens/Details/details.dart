import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market/Screens/constants.dart';
import 'package:market/Widgets/pref_userdata.dart';

class DetailScreen extends StatefulWidget {

  List id_cat;
  DetailScreen({this.id_cat});
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  List category=[];
  List data=[];
  String docid_category;
  String info;
  DocumentSnapshot varible;
  bool isloading=false;



  @override
  void initState() {
    // TODO: implement initState
    category=[];
    category=widget.id_cat;
    loadData(category[0], category[1]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //
      body: isloading ? Center(child: CircularProgressIndicator()) : SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  color: details_screen,
                  height: 300,
                  width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Center(child: CircularProgressIndicator(),),
                    Image.network(data[9], fit: BoxFit.fill,),
                  ],
                ),
              ),
              // Container(
              //   color: details_screen,
              //   height: 300,
              //   width: double.infinity,
              //   child: Image.network(data[9], fit: BoxFit.fill,),
              // ),


              // grocery title and rating
              Container(
                height: 90,
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      width: (size.width /2) + (size.width/4),
                      // color: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text( data[7],style: TextStyle(fontSize: 30),),
                      ),
                    ),
                    Container(
                      width: size.width/4,
                      // color: Colors.greenAccent,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kPrimaryColor2,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(data[6], style: TextStyle(
                                    color: Colors.black
                                ),),
                                SizedBox(width: 2,),
                                Icon(Icons.star, size: 15,)
                              ],
                            ),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            // height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kPrimaryColor2,
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Center(child: Text(
                                "Open",
                                style: TextStyle(
                                    color: Colors.black
                                ),
                              )),
                            ),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
                child: Container(
                  height: 80,
                  // color: Colors.grey,
                  child: Text(
                      data[8],
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black
                      ),) ,
                ),
              ),
              // Text(category[0],style: TextStyle(fontSize: 30),),


              // information
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: 50,
                  // color: Colors.grey,
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        // color: Colors.grey,
                        child: Center(
                          child: Icon(Icons.stars, color: kPrimaryColor2,),
                        ),
                      ),
                      Container(
                        height: 50,
                        // width: 250,
                        // color: Colors.white70,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Center(
                            child: Text(
                              "Information",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20,),
              //  address info
              Row(
                children: [
                  Container(
                    height: 50,
                    width: (size.width /2) + (size.width/4) ,
                    color: Colors.white70,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          data[0],
                          style: TextStyle(
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: size.width /4,
                    color: Colors.white70,
                    child: Icon(Icons.location_city, color: kPrimaryColor2,size: 30,),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: (size.width /2) + (size.width/4) ,
                    color: Colors.white70,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          "+91 "+ data[2] ,
                          style: TextStyle(
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: size.width /4,
                    color: Colors.white70,
                    child: Icon(Icons.phone, color: kPrimaryColor2,size: 30,),
                  ),
                ],
              ),
              // email
              Row(
                children: [
                  Container(
                    height: 50,
                    width: (size.width /2) + (size.width/4) ,
                    color: Colors.white70,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          data[4] ,
                          style: TextStyle(
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: size.width /4,
                    color: Colors.white70,
                    child: FlatButton(
                      onPressed: (){
                        // Fluttertoast.showToast(msg: "Hello");
                      },
                        child: Icon(Icons.email, color: kPrimaryColor2,size: 30,)),
                  ),
                ],
              ),


              // fearured product
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: 50,
                  // color: Colors.grey,
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        // color: Colors.grey,
                        child: Center(
                          child: Icon(Icons.stars, color: kPrimaryColor2,),
                        ),
                      ),
                      Container(
                        height: 50,
                        // width: 250,
                        // color: Colors.white70,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Center(
                            child: Text(
                              "Featured Products",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(height: 50,)


            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        // padding: EdgeInsets.only(
        //   // top: kDefaultPadding,
        //   left: kDefaultPadding *2,
        //   right: kDefaultPadding * 2,
        //   bottom: kDefaultPadding ,
        // ),
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -10),
              blurRadius: 35,
              color: kPrimaryColor.withOpacity(0.38),
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                onPressed: () {
                  Fluttertoast.showToast(msg: "This Feature is not Ready");
                },
                child: Text("Contact Seller"),
              ),
            ),
            SizedBox(
              width: size.width / 2,
              height: 84,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                  ),
                ),
                color: kPrimaryColor,
                onPressed: () {
                  Fluttertoast.showToast(msg: "This Feature is not Ready");
                },
                child: Text(
                  "Shop Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String informtion() {
    info= "Firebase is a platform developed by Google for"
        " creating mobile and web applications. It was originally an "
        "independent company founded in 2011. In 2014";
    return info;
  }

  void loadData(category, docid) async{
    setState(()=> isloading=true);
    varible = await FirebaseFirestore.instance.collection("Shops").doc("AllShops").collection(category).doc(docid).get();
    data.add(varible['address']); //  0  adrress
    data.add(varible['category']); //  1 contact
    data.add(varible['contact']); // 2   docid
    data.add(varible['docid_cat']); //  3  email
    data.add(varible['email']); // 4   image
    data.add(varible['info']); // 5    name
    data.add(varible['rating']); // 6   name
    data.add(varible['title']); // 7    name
    data.add(varible['details']); // 8    details
    data.add(varible['imageurl']); // 9   image
    print(data);
    setState(() {
      isloading=false;
    });
  }
}
