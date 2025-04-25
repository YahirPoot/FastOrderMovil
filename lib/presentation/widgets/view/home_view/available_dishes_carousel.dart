import 'package:fast_order/config/index.dart';
import 'package:flutter/material.dart';

class ImagesCarousel extends StatelessWidget {
  ImagesCarousel({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width; // Ancho del carrusel de imágenes
  final CarouselAdapter carousel = CarouselSliderAdapter(); // Instancia del adaptador de carrusel

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: carousel.buildCarousel(
        height: height,
        items:  [1, 2, 3, 4, 5].map((i) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: ResponsiveText(
                text: 'Platillo $i',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }).toList(),
        )
    );
  }
}