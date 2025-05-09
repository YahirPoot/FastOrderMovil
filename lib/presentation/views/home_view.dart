import 'package:fast_order/config/index.dart';
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
        body: CustomScrollView( //*column principal de la vista.
          slivers: [

            // Este es el AppBar que desaparece al hacer scroll
            SliverAppBar(
              title: Text(
                'Hi, ${context.read<AuthBloc>().state.user?.fullName}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: colorList[1],
                ),
              ),
              floating: true, // Reaparece al hacer scroll hacia arriba
              snap: true,     // Hace el efecto de "snap" cuando se muestra
              backgroundColor: Colors.white, // Cambia esto por tu color primario
            ),
              
            SliverToBoxAdapter(
              child: CarouselWithWelcomeBox(
                height: size.height * 0.24,
                carouselWidth: size.width * 0.5,
                welcomeBoxWidth: size.width * 0.5,
              ),
            ),

            SliverToBoxAdapter(
              child: Divider(
                height: 5,
                color: Colors.grey[200],
                endIndent: 16,
                indent: 16,
                
              ),
            ),

            DishesListView(size: size),

            
          ],
        )
        
      ),
    );

  }
}
