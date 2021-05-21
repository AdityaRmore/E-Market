import 'package:flutter/material.dart';
import 'package:market/Screens/constants.dart';
import 'package:market/Screens/home/components/carousel_slider.dart';
import 'package:market/Screens/home/components/featured_shops.dart';
import 'package:market/Screens/home/components/header_home.dart';
import 'package:market/Screens/home/components/title_head.dart';
import 'file:///C:/Users/adity/Downloads/market/lib/Screens/home/components/recommended_shops.dart';




class body_home extends StatelessWidget {
  const body_home({
    Key key,
    @required this.size,
    @required TextEditingController search,
    @required this.title,
  }) : _search = search, super(key: key);

  final Size size;
  final TextEditingController _search;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // title and search bar
          header_home(size: size, search: _search),
          // Carousel Slider
          carousel_slider(),
          // Recommended Text    =>>>   Title Head
          recomended_text(),
          // Recomended Shop    =>>>   Recommended Shops
          recommende_shops(),
          SizedBox(height: 10,),
          Title2(),
          SizedBox(height: 10,),
          Featured_Shop(size: size),
        ],
      ),
    );
  }
}
