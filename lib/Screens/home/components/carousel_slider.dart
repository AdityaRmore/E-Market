


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class carousel_slider extends StatelessWidget {
  const carousel_slider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: ListView( ///  under expanded
        children: [
          CarouselSlider(
            options: CarouselOptions(
                height: 180,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16/9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8
            ),
            items: [
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("assets/images/image1.jpg"),
                        fit: BoxFit.fill

                    )
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("assets/images/medical1.jpeg"),
                        fit: BoxFit.fill

                    )
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("assets/images/phone.jpeg"),
                        fit: BoxFit.fill

                    )
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
