import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:market/Classes/realdatabase.dart';
import 'package:market/Screens/Details/details.dart';
import 'package:market/Screens/constants.dart';

class AllShops extends StatefulWidget {
  List data1;
  AllShops({this.data1});
  @override
  _AllShopsState createState() => _AllShopsState();
}

class _AllShopsState extends State<AllShops> {
  List list = [];
  String category;
  List<RealData> datalist = [];
  List<String> docid_category = [];
  DocumentSnapshot snapshot123;
  int _counter=0 ;
  bool isloading=false;

  @override
  void initState() {
    // TODO: implement initState
    list=[];
    docid_category=[];
    list = widget.data1;
    category = list[0];
    print(list);
    list=[];
    print(list);
    print(category);

    DatabaseReference referenceData = FirebaseDatabase.instance.reference().child("AllShops").child(category);
    referenceData.once().then((DataSnapshot dataSnapshot) {
      datalist.clear();
      var keys = dataSnapshot.value.keys;
      var values = dataSnapshot.value;
      for (var key in keys) {
        RealData data = new RealData(
          values[key]["title"],
          values[key]["docid_cat"],
          values[key]["rating"],
          values[key]["category"],
          values[key]["info"],

        );
        datalist.add(data);
        print(datalist);
      }
      setState(() {});
    });


    super.initState();
  }
  Future<String> getdata() async {
    return new Future.delayed(const Duration(milliseconds: 500), () {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: details_screen,
        title:Text("Details",style: TextStyle(
          color: Colors.black87
        ),),
      ),
      //    isloading ? Center(child: CircularProgressIndicator()) :
      body: Stack(
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
                SizedBox(height: 20,),
                // Search Bar And Heading
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text("Search Shop", style: TextStyle(fontSize: 25, color: Colors.black)),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0),
                  child: TextField(
                    onChanged: (text) {
                      searchMethod(text, category);
                    },
                    decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
                  ),
                ),


                //  Actual Data
                Expanded(
                  child: FutureBuilder(
                    future: getdata(),
                    builder: (context , AsyncSnapshot snapshot){
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.connectionState == ConnectionState.active) {
                        return Center(child: CircularProgressIndicator(),);
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (datalist.length != 0) {
                          return ListView.builder(
                            itemCount: datalist.length,
                            itemBuilder: (_, index) {
                              if (datalist.length == 0) {
                                return Center(child: Text("No Data"));
                              }
                              return GestureDetector (
                                onTap: () async {
                                  docid_category=[];
                                  String docid_cate = datalist[index].docid_cat;
                                  docid_category.add(category);
                                  docid_category.add(docid_cate);
                                  print(docid_category);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                        id_cat: docid_category,
                                      ),
                                    ),
                                  );
                                },
                                child: Card(
                                  child: ListTile(
                                    contentPadding: EdgeInsets.all(10),
                                    focusColor: Colors.redAccent,
                                    trailing: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text(datalist[index].rating),
                                    ),
                                    title: Text(datalist[index].title),
                                    subtitle: Text(datalist[index].info),
                                  ),
                                ),
                              );
                            },
                          );
                        }else{
                          if(_counter ==0){
                            return Center(child: CircularProgressIndicator(),);
                          }else{
                            return Center(child: Text("No Data"),);

                          }
                        }
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );

                    },
                  ),
                )
              ],
            ),
          ),
        ],

      ),
    );
  }

  void searchMethod(String text, String category) {
    _counter= text.length;
    // _couter++;
    String emailUser = FirebaseAuth.instance.currentUser.uid.toString();
    DatabaseReference searchref =
    FirebaseDatabase.instance.reference().child("AllShops").child(category);
    searchref.once().then((DataSnapshot snapshot) {
      datalist.clear();
      var keys = snapshot.value.keys;
      print(keys.toString());
      var values = snapshot.value;
      for (var key in keys) {
        RealData data = new RealData(
          values[key]['title'],
          values[key]['docid_cat'],
          values[key]["rating"],
          values[key]["category"],
          values[key]["info"],

        );
        if (data.title.toLowerCase().contains(text.toLowerCase())) {
          datalist.add(data);
        }
      }
      Timer(Duration(seconds: 1), () {
        setState(() {});
      });
    });

  }


}
