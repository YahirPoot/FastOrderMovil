import 'package:fast_order/config/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/index.dart';
import 'index.dart';

class AvailableDishesCarousel extends StatelessWidget {
  final double height;
  final double width;
  final BoxDecoration? boxDecoration;

  const AvailableDishesCarousel({
    super.key,
    required this.height,
    required this.width,
    this.boxDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvailableDishesBloc, AvailableDishesState>(
      builder: (context, state) {

        if (state.isFetching) { // Si está cargando, muestra el shimmer
          return ShimmerDishCard(
            height: height,
            width: width,
            itemCount: 3, // Número de elementos a mostrar
          );
        }

        if (state.errorMessage.isNotEmpty) {
          return Expanded(
            child: Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        final dishes = state.availableDishes ?? [];

        return SizedBox(
          width: width,
          child: CarouselSliderAdapter().buildCarousel(
            height: height,
            items: dishes.map((dish) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), //Don't repeat your self.
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          dish.imageUrl ??
                              'https://blog.usecure.io/hs-fs/hubfs/error.png?width=450&name=error.png',
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: const Icon(
                                Icons.broken_image,
                                color: Colors.grey,
                                size: 50,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ResponsiveText(
                        text: '${dish.name[0].toUpperCase()}${dish.name.substring(1)}',
                        style: subtitleBlackF16.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}