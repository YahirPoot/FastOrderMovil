import 'package:fast_order/config/index.dart';
import 'package:flutter/material.dart';
import '../../../../domain/index.dart';

class AvailableDishesCarousel extends StatelessWidget {
  AvailableDishesCarousel({
    super.key,
    required this.height,
    required this.width,
    required this.dishes,
  });

  final double height;
  final double width; // Ancho del carrusel de imágenes
  final List<Dish> dishes; // Lista de platillos
  final CarouselAdapter carousel = CarouselSliderAdapter(); // Instancia del adaptador de carrusel

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: carousel.buildCarousel(
        height: height,
        items: dishes.map((dish) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              // color: Colors.amber,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      dish.imageUrl ?? 'https://blog.usecure.io/hs-fs/hubfs/error.png?width=450&name=error.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ResponsiveText(
                    text: '${dish.name[0].toUpperCase()}${dish.name.substring(1)}', // Convierte la primera letra a mayúscula
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                  ),
                )
              ],
            ),
          );
        }).toList(),
        )
    );
  }
}