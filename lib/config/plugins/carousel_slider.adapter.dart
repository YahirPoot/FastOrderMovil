import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

abstract class CarouselAdapter {
  Widget buildCarousel({
    required double height,
    double viewportFraction = 1.0,
    bool autoPlay = true,
    bool enableInfiniteScroll = true,
    required List<Widget> items,
  });
}

class CarouselSliderAdapter implements CarouselAdapter {
  @override
  Widget buildCarousel({
    required double height,
    double viewportFraction = 1.0,
    bool autoPlay = true,
    bool enableInfiniteScroll = true,
    required List<Widget> items,
    }){
    return CarouselSlider(
      options: CarouselOptions(
        height: height,
        viewportFraction: viewportFraction,
        autoPlay: autoPlay,
        enableInfiniteScroll: enableInfiniteScroll,
      ),
      items: items.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return item;
          },
        );
      }).toList(),
    );
  }
}