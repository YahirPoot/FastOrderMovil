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
    final BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(8),
    );
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: boxDecoration,
      height: height,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //* Carrusel de imágenes
          AvailableDishesCarousel(
            height: height,
            width: carouselWidth,
            boxDecoration: boxDecoration,
          ),

          //* Caja de bienvenida
          WelcomBox(
            height: height,
            width: welcomeBoxWidth
          ),
        ],
      ),
    );
  }
}