import 'package:fast_order/presentation/widgets/index.dart';
import 'package:flutter/material.dart';

class CarouselWithWelcomeBox extends StatelessWidget {
  final double height;
  final double carouselWidth;
  final double welcomeBoxWidth;

  const CarouselWithWelcomeBox({
    super.key,
    required this.height,
    required this.carouselWidth,
    required this.welcomeBoxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //* Carrusel de imágenes
          ImagesCarousel(
            height: height,
            width: carouselWidth,
          ),

          //* Presentación del día
          WelcomBox(
            height: height,
            width: welcomeBoxWidth,
          ),
        ],
      ),
    );
  }
}