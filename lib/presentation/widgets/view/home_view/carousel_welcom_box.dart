import 'package:fast_order/config/index.dart';
import 'package:fast_order/presentation/bloc/available_dishes_bloc/available_dishes_bloc.dart';
import 'package:fast_order/presentation/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          BlocBuilder<AvailableDishesBloc, AvailableDishesState>(
            builder: (context, state) {
              if (state.isFetching) {
                return Expanded(child: const Center(child: CircularProgressIndicator()));
              }

              if (state.errorMessage.isNotEmpty) {
                return Expanded(child: Center(child: ResponsiveText(text: state.errorMessage,)));
              }

              return AvailableDishesCarousel(
                height: height,
                width: carouselWidth,
                dishes: state.availableDishes ?? [],
              );
            },
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