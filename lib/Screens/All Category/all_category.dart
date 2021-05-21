import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:market/Screens/All%20Shops/all_shops.dart';
import 'package:market/Screens/Details/details.dart';
import 'package:market/Screens/constants.dart';
import 'package:market/Widgets/connection.dart';

class AllCategory extends StatefulWidget {
  @override
  _AllCategoryState createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {
   List data=[];
   @override
  void initState() {
     connect(context);
     data=[];
     data.clear();
     print(data);
     super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ColorfulSafeArea(
      color: details_screen,
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Container(
                height: size.height,
                width: size.width,
                color: details_screen,
                child: Image.asset("assets/images/cat_bg.png", fit: BoxFit.fill,),
              ),
            ),
            Container(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(height: 30,),

                      Center(child: Text("All Category", style: TextStyle(
                          fontSize: 40
                      ),)),
                      SizedBox(height: 70,),
                      //   grocery shop
                      GestureDetector(
                        onTap: (){
                          data=[];
                          data.add("grocery");
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> AllShops(data1: data,)));
                        },
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          // color: Colors.grey,
                          child: Row(
                            children: [
                              Container(
                                height: double.infinity,
                                width: 80,
                                child: Center(
                                  child: Container(
                                      height: 40,
                                      width: 40,
                                      child: Image.asset("assets/category/store.png")),
                                ),
                              ),
                              Container(
                                height: double.infinity,
                                width: 300,
                                child: Center(
                                  child: Text("Grocery Store", style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black

                                  ),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),

                      // Medicine Shop
                      GestureDetector(
                        onTap: (){
                          data=[];
                          data.add("medicine");
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AllShops(data1: data,) ));
                        },
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          // color: Colors.grey,
                          child: Row(
                            children: [
                              Container(
                                height: double.infinity,
                                width: 80,
                                child: Center(
                                  child: Container(
                                      height: 40,
                                      width: 40,
                                      child: Image.asset("assets/category/drugs.png")),
                                ),
                              ),
                              Container(
                                height: double.infinity,
                                width: 300,
                                child: Center(
                                  child: Text("Medicine Store", style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black

                                  ),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),

                      // Clothing Shop
                      GestureDetector(
                        onTap: (){
                          data=[];
                          data.add("clothing");
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> AllShops(data1: data,)));
                        },
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          // color: Colors.grey,
                          child: Row(
                            children: [
                              Container(
                                height: double.infinity,
                                width: 80,
                                child: Center(
                                  child: Container(
                                      height: 40,
                                      width: 40,
                                      child: Image.asset("assets/category/clothing.png")),
                                ),
                              ),
                              Container(
                                height: double.infinity,
                                width: 300,
                                child: Center(
                                  child: Text("Clothing", style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black

                                  ),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),

                      // CupCake
                      GestureDetector(
                        onTap: (){
                          data=[];
                          data.add("sweet mart");
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> AllShops(data1: data,)));
                        },
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          // color: Colors.grey,
                          child: Row(
                            children: [
                              Container(
                                height: double.infinity,
                                width: 80,
                                child: Center(
                                  child: Container(
                                      height: 40,
                                      width: 40,
                                      child: Image.asset("assets/category/cupcake.png")),
                                ),
                              ),
                              Container(
                                height: double.infinity,
                                width: 300,
                                child: Center(
                                  child: Text("CupCake", style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black

                                  ),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),

                      // power
                      GestureDetector(
                        onTap: (){
                          data=[];
                          data.add("electronics");
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> AllShops(data1: data,)));
                        },
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          // color: Colors.grey,
                          child: Row(
                            children: [
                              Container(
                                height: double.infinity,
                                width: 80,
                                child: Center(
                                  child: Container(
                                      height: 40,
                                      width: 40,
                                      child: Image.asset("assets/category/power.png")),
                                ),
                              ),
                              Container(
                                height: double.infinity,
                                width: 300,
                                child: Center(
                                  child: Text("Electronics", style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black

                                  ),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),

                      // Shoe
                      GestureDetector(
                        onTap: (){
                          data=[];
                          data.add("shoe");
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> AllShops(data1: data,)));
                        },
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          // color: Colors.grey,
                          child: Row(
                            children: [
                              Container(
                                height: double.infinity,
                                width: 80,
                                child: Center(
                                  child: Container(
                                      height: 40,
                                      width: 40,
                                      child: Image.asset("assets/category/shoe.png")),
                                ),
                              ),
                              Container(
                                height: double.infinity,
                                width: 300,
                                child: Center(
                                  child: Text("Shoe", style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black

                                  ),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),

                      // Agriculture
                      GestureDetector(
                        onTap: (){
                          data=[];
                          data.add("agri");
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> AllShops(data1: data,)));
                        },
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          // color: Colors.grey,
                          child: Row(
                            children: [
                              Container(
                                height: double.infinity,
                                width: 80,
                                child: Center(
                                  child: Container(
                                      height: 40,
                                      width: 40,
                                      child: Image.asset("assets/category/shovel.png")),
                                ),
                              ),
                              Container(
                                height: double.infinity,
                                width: 300,
                                child: Center(
                                  child: Text("Agriculture", style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black

                                  ),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),

                      // SmartPhone
                      GestureDetector(
                        onTap: (){
                          data=[];
                          data.add("phone");
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> AllShops(data1: data,)));
                        },
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          // color: Colors.grey,
                          child: Row(
                            children: [
                              Container(
                                height: double.infinity,
                                width: 80,
                                child: Center(
                                  child: Container(
                                      height: 40,
                                      width: 40,
                                      child: Image.asset("assets/category/smartphone.png")),
                                ),
                              ),
                              Container(
                                height: double.infinity,
                                width: 300,
                                child: Center(
                                  child: Text("Phone Shopy", style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black

                                  ),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),

                      // Tap
                      GestureDetector(
                        onTap: (){
                          data=[];
                          data.add("plumbing");
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> AllShops(data1: data,)));
                        },
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          // color: Colors.grey,
                          child: Row(
                            children: [
                              Container(
                                height: double.infinity,
                                width: 80,
                                child: Center(
                                  child: Container(
                                      height: 40,
                                      width: 40,
                                      child: Image.asset("assets/category/tap.png")),
                                ),
                              ),
                              Container(
                                height: double.infinity,
                                width: 300,
                                child: Center(
                                  child: Text("Plumbing", style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black

                                  ),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // SizedBox(height: 20,),


                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


