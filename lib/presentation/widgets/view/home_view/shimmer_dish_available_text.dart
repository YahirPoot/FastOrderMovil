import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../config/index.dart';

class ShimmerDishesAvailableText extends StatelessWidget {
  final double height;
  final double width;

  const ShimmerDishesAvailableText({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4, // Misma proporción que en el diseño original
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Shimmer para el número de platillos disponibles
          Expanded(
            flex: 3,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: height * 0.25, // Altura proporcional al diseño original
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),

          const SizedBox(width: 8), // Espaciado entre el número y el texto

          // Shimmer para el texto "Platillos disponibles"
          Expanded(
            flex: 6,
            child: ShimmerAdapter.createShimmer(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: height * 0.25, // Altura proporcional al diseño original
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}