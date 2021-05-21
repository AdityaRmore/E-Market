import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:market/Classes/realdatabase.dart';
import 'package:market/Screens/Details/details.dart';
import 'package:market/Screens/constants.dart';

class SearchShop extends StatefulWidget {
  SearchShop({Key key, this.searchtext}): super (key: key);
  String searchtext;

  @override
  _SearchShopState createState() => _SearchShopState();
}

class _SearchShopState extends State<SearchShop> {
  String text;
  List<SearchData> search=[];
  List<AllData> alldata=[];
  String title= "Searched Shop";
  List SearchedData=[];
  bool isloading= false;

  @override
  void dispose() {
    // TODO: implement dispose
    SearchedData=[];
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    text=widget.searchtext;
    print(text);
    loadData(text);
  }


  Future<String> getdata() async {
    return new Future.delayed(const Duration(milliseconds: 500), () {});
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Container(
                height: size.height,
                width: size.width,
                // color: details_screen,
                child: Image.asset("assets/images/cat_bg5.png", fit: BoxFit.fill,),
              ),
            ),
            isloading ? Center(child: Lottie.asset("assets/lottie/loading.json", height: 100, width: 100)) : Container(
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Expanded(
                    child: FutureBuilder(
                      future: getdata(),
                      builder: (context , AsyncSnapshot snapshot){
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: Lottie.asset("assets/lottie/loading.json", height: 100, width: 100));
                        }
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (search.length != 0) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                                      child: Text(title, style: TextStyle(fontSize: 30, color: Colors.black)),
                                    ),
                                    SizedBox(height: 40,),
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: search.length,
                                        itemBuilder: (_, index) {
                                          if (search.length == 0) {
                                            return Center(child: Text("No Data"));
                                          }
                                          return GestureDetector (
                                            onTap: () async {
                                              // print(search.[index])
                                              SearchedData=[];
                                              SearchedData.add(search[index].category);
                                              SearchedData.add(search[index].docid_cat);
                                              print(SearchedData);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => DetailScreen(
                                                    id_cat: SearchedData,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 10),
                                              child: Container(
                                                  height: 130,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(13),
                                                    color: Colors.white,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        height : 130,
                                                        width: (size.width/2)+ (size.width/4) -20,
                                                        // color: Colors.greenAccent,
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.only(left: 20, top: 20),
                                                              child: SingleChildScrollView(
                                                                scrollDirection: Axis.horizontal,
                                                                  child: Text(search[index].title.toUpperCase(), style: TextStyle(fontSize: 30),)),
                                                            ),
                                                            SizedBox(height: 15,),
                                                            Padding(
                                                              padding: const EdgeInsets.only(left: 20, top: 20),
                                                              child: Text(search[index].info, style: TextStyle(fontSize: 15),),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        height: double.infinity,
                                                        width: size.width/4,
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
                                                                  Text(search[index].rating, style: TextStyle(
                                                                      color: Colors.black
                                                                  ),),
                                                                  SizedBox(width: 2,),
                                                                  Icon(Icons.star, size: 15,)
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(height: 15,),
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
                                                      ),
                                                    ],
                                                  )
                                              ),
                                            ) ,

                                          );
                                        },
                                      ),
                                    ),

                                  ],
                                ),

                              ),
                            );
                          }else{
                            return NoDataFound();
                          }
                        }


                        return Center(
                            child: Lottie.asset(
                                "assets/lottie/loading.json",
                                height: 100,
                                width: 100)
                        );

                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loadData(String text) {
    setState(() {
      isloading=true;
    });
    DatabaseReference reddata=  FirebaseDatabase
        .instance
        .reference()
        .child("SearchShop");
    reddata.once().then((DataSnapshot datasnapshot){
      search.clear();
      alldata.clear();
      var keys = datasnapshot.value.keys;
      var values = datasnapshot.value;
      for (var key in keys) {
        SearchData data = new SearchData(
          values[key]["title"],
          values[key]["docid_cat"],
          values[key]["rating"],
          values[key]["category"],
          values[key]["info"],
        );
        if(data.title.toLowerCase().contains(text.toLowerCase())){
          search.add(data);
        }
        print(search);
      }
      setState(() {
        isloading=false;
      });
      for (var key in keys) {
        AllData data2 = new AllData(
          values[key]["title"],
          values[key]["docid_cat"],
          values[key]["rating"],
          values[key]["category"],
          values[key]["info"],
        );
        alldata.add(data2);
      }
      setState(() {});
    });
  }

  Widget NoDataFound() {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          height: 1120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 80,),
              Container(
                height: 270,
                width: 270,
                child: Center(
                  child: Lottie.asset("assets/lottie/empty.json"),
                ),
              ),
              Text("No Data",style: TextStyle(fontSize: 30),),
              SizedBox(height: 10,),
              Text("Found",style: TextStyle(fontSize: 30),),
              SizedBox(height: 150,),
              Text("Recommend Search"),
              SizedBox(height: 15,),
              Container(
                height: 500,
                child: Expanded(
                  child: ListView.builder(
                    itemCount: alldata.length,
                    itemBuilder: (_, index) {
                      if (alldata.length == 0) {
                        return Center(child: Text("No Data"));
                      }
                      return GestureDetector (
                        onTap: () async {
                          SearchedData=[];
                          SearchedData.add(alldata[index].category);
                          SearchedData.add(alldata[index].docid_cat);
                          print(SearchedData);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                id_cat: SearchedData,
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
                              child: Text(alldata[index].rating),
                            ),
                            title: Text(alldata[index].title),
                            subtitle: Text(alldata[index].info),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );

  }

}


