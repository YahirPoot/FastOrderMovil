import 'package:fast_order/presentation/bloc/index.dart';
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
    final BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(8),
    );
    return Container(
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

          //* Presentación del día
          BlocSelector<AvailableDishesBloc, AvailableDishesState, int?>( //Me gustaría hacer que si no hay platillos dispoinbles, en este caso caería que ya no esta haciendo fetching pero state.availableDishes?.length puede ser null. 
            selector: (state) {
              if(state.isFetching) return null;
              if(state.availableDishes == null || state.availableDishes!.isEmpty) return 0;
              return state.availableDishes!.length;
            },
            builder: (context, dishesAvailable) {
              return WelcomBox(
                height: height,
                width: welcomeBoxWidth,
                dishesAvailable: dishesAvailable,
              );
            },
          ),
        ],
      ),
    );
  }
}