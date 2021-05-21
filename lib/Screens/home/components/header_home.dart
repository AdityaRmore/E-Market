import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market/Screens/All%20Shops/search_shop.dart';
import 'package:market/Screens/constants.dart';


class header_home extends StatelessWidget {
  const header_home({
    Key key,
    @required this.size,
    @required TextEditingController search,
  }) : _search = search, super(key: key);

  final Size size;
  final TextEditingController _search;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding),
      height: size.height * 0.2,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 36 + kDefaultPadding,
            ),
            height: size.height * 0.2 - 27,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36)),
            ),
            child: Row(
              children: [
                Text(
                  'E-Market',
                  style: Theme.of(context).textTheme.headline5.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Spacer(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _search,
                      decoration: InputDecoration(
                          hintText: 'Search a Shop',
                          hintStyle:
                          TextStyle(color: kPrimaryColor.withOpacity(0.5)),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            color: kPrimaryColor,
                            onPressed: (){
                              print(_search.text);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)=> SearchShop(searchtext: _search.text,)));
                            },
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

