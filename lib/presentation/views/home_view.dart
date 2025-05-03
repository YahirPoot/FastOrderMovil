import 'package:fast_order/presentation/bloc/index.dart';
import 'package:fast_order/presentation/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AvailableDishesBloc( authBloc: context.read<AuthBloc>() )..add(FetchAvailableDishesEvent()), //pasar el Blocque de los platillos disponbiles
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Hi, ${context.read<AuthBloc>().state.user?.fullName}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
        ),
      
        body: Column( //*column principal de la vista.
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              
            CarouselWithWelcomeBox(
              height: size.height * 0.24,
              carouselWidth: size.width * 0.5,
              welcomeBoxWidth: size.width * 0.5,
            ),
              
              
            //! rations available Text.
              
            //! carrusel de los platillos disponibles.
        
          ],
        )
        
      ),
    );

  }
}

