import 'package:fast_order/config/index.dart';
import 'package:flutter/material.dart';

class ShimmerDishCard extends StatelessWidget {
  final double height;
  final double width;
  final int itemCount;

  const ShimmerDishCard({
    super.key,
    required this.height,
    required this.width,
    this.itemCount = 3, // Número de elementos por defecto
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Shimmer para la imagen
                ShimmerAdapter.createShimmer(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: height * 0.8, // 80% del espacio para la imagen
                    width: width * 0.94,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 4), // Espaciado entre la imagen y el texto
                // Shimmer para el texto
                ShimmerAdapter.createShimmer(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: height * 0.14, // 10% del espacio para el texto
                    width: width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}