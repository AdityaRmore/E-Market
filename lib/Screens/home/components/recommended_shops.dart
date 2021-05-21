import 'package:flutter/material.dart';
import 'package:market/Screens/Details/details.dart';
import 'package:market/Screens/constants.dart';
import 'package:market/Screens/home/components/title_head.dart';
import 'package:market/Widgets/pref_userdata.dart';



class recommende_shops extends StatelessWidget {
  const recommende_shops({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RecomendPlantCard(
            image: "assets/images/manish.jpeg",
            title: "Manish",
            country: "Sweet Mart",
            price: 440,
            press: () {
              RecomendedShop1=[];
              RecomendedShop1.add("sweet mart");
              RecomendedShop1.add("dt4MEqnMfH9IzpsOgGjB");
              print(RecomendedShop1);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    id_cat: RecomendedShop1,
                  ),
                ),
              );

            },
          ),
          RecomendPlantCard(
            image: "assets/images/phone.jpeg",
            title: "Ashok",
            country: "Phone Shopy",
            price: 440,
            press: () {
              RecomendedShop2.add("phone");
              RecomendedShop2.add("udMhS2WKsub6Nc3Xq8LD");//  BwEWBcw2CaSWRbJkzHzF
              //udMhS2WKsub6Nc3Xq8LD
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    id_cat: RecomendedShop2,
                  ),
                ),
              );
            },
          ),
          RecomendPlantCard(
            image: "assets/images/shoe2.jpeg",
            title: "Omkar",
            country: "Shoe Park",
            price: 440,
            press: () {
              RecomendedShop3.add("shoe");
              RecomendedShop3.add("Dg16wi1rbFH7cFS0zShV");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    id_cat: RecomendedShop3,
                  ),
                ),
              );
            },
          ),
          RecomendPlantCard(
            image: "assets/images/medical1.jpeg",
            title: "Aditya",
            country: "Medical Shop",
            price: 440,
            press: () {
              RecomendedShop4.add("medicine");
              RecomendedShop4.add("r3SPHEPLvzmk7uA1GyM1");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    id_cat: RecomendedShop4,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}



class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
    Key key,
    this.image,
    this.title,
    this.country,
    this.price,
    this.press,
  }) : super(key: key);

  final String image, title, country;
  final int price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 1,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: press,
            child: Container(
                height: 150,
                width: double.infinity,
                child: Image.asset(image, fit: BoxFit.fill,)),
          ),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "$title\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                        TextSpan(
                          text: "$country".toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  // Text(
                  //   '\$$price',
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .button
                  //       .copyWith(color: kPrimaryColor),
                  // )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}







