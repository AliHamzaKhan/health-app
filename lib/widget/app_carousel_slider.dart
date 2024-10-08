import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:health_app/config/size_config.dart';

class AppCarouselSlider extends StatelessWidget {
  AppCarouselSlider(
      {super.key,
      required this.items,
      this.callbackFunction,
      this.height,
      this.aspectRatio,
      this.animationDurationInMilliseconds = 800
      });

  List<Widget> items;
  Function(int index, CarouselPageChangedReason reason)? callbackFunction;
  double? height;
  double? aspectRatio;
  int animationDurationInMilliseconds;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: items,
        options: CarouselOptions(
          height: setHeightValue(height ?? 150),
          aspectRatio: aspectRatio ?? (16 / 9),
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: items.length > 1,
          reverse: false,
          autoPlay: items.length > 1,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: animationDurationInMilliseconds),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.5,
          onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        ));
  }
}
