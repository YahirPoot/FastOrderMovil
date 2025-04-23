import 'package:fast_order/config/plugins/carousel_slider.adapter.dart';
import 'package:fast_order/config/themes/index.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final carouselAndWelcomeBoxHeight = size.height * 0.22;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Hi, Gustavo Mena!',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column( //column principal de la vista.
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //!Carrusel con presentación de la fecha y cantidad de platillos disponibles
            SizedBox(
              height: carouselAndWelcomeBoxHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //* Carrusel de imágenes
                  ImagesCarousel(
                    height: carouselAndWelcomeBoxHeight,
                    width: size.width * 0.5,
                    ),

                  //* Presentación del día
                  WelcomBox(width: size.width * 0.45,),
                ],
              ),
            ),


            //! rations available

            // carrusel de los platillos disponibles.
        
          ],
        ),
      )
      
    );

  }
}

class WelcomBox extends StatelessWidget {
  const WelcomBox({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.fromLTRB(4, 4, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* Título Guisos del día
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Guisos',
                style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  height: 0.85,
                  letterSpacing: .5,
                ),
              ),
              Text(
                'del día',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
    
          //* Fecha
          CustomDate( width: width, ),
    
          //* Num. Raciones disponibles + Platillos disponibles
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '20',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: colorList[0],
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              SizedBox(width: 4),
              Text(
                'Platillos\ndisponibles',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                  height: 0.95,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          )
        ],
      ),
    );
  }
}

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
              child: Text(
                'Platillo $i',
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

class CustomDate extends StatelessWidget {
  final double width;
  const CustomDate({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 3),
      width: width,
      decoration: BoxDecoration(
        color: colorList[0],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          'Miercoles 20 Septiembre',
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
      ),
    );
  }
}
