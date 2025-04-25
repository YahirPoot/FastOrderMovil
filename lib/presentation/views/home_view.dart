import 'package:fast_order/config/plugins/auto_size_text.adapter.dart';
import 'package:fast_order/config/plugins/carousel_slider.adapter.dart';
import 'package:fast_order/config/themes/index.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final carouselAndWelcomeBoxHeight = size.height * 0.23;
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
                  WelcomBox(
                    height: carouselAndWelcomeBoxHeight,
                    width: size.width * 0.45,
                    ),
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
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.fromLTRB(4, 4, 0, 0),
      child: Column( //este column tiene el constraint de la caja de bienvenida.
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* Título Guisos del día
          Expanded( //expanded para que tenga el constraint de la caja de bienvenida.
          flex: 5,
            child: Column( 
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Flexible(
                  flex: 2,
                  child: ResponsiveText(
                    text:'Guisos',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      height: 0.85,
                      letterSpacing: .5,
                    ),
                    // minFontSize: 8,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: ResponsiveText(
                    text:'del día',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w900,
                      color: Colors.black87,
                    ),
                    // minFontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          //* Fecha
          Expanded(
            flex: 2,
            child: CustomDate( width: width, )
            ),
    
          //* Num. Raciones disponibles + Platillos disponibles
          Expanded(//expanded para que tenga el constraint de la caja de bienvenida.
          flex: 4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: ResponsiveText(
                    text:'20',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: colorList[0],
                    ),
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 24,
                    maxLines: 1,
                  ),
                ),

                Flexible(
                  flex: 6,
                  child: ResponsiveText(
                    text:'Platillos\ndisponibles',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                      height: 0.95,
                    ),
                    maxFontSize: 12,
                    minFontSize: 10,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
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
        child: ResponsiveText(
          text:'Miercoles 20 Septiembre',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            ),
            maxFontSize: 12,
            minFontSize: 8,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
      ),
    );
  }
}
