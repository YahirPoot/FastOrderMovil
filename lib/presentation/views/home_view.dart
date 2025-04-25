import 'package:fast_order/presentation/widgets/index.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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

            CarouselWithWelcomeBox(
              height: size.height * 0.23,
              carouselWidth: size.width * 0.5,
              welcomeBoxWidth: size.width * 0.45,
            ),


            //! rations available Text.

            //! carrusel de los platillos disponibles.
        
          ],
        ),
      )
      
    );

  }
}

