import 'package:fast_order/config/index.dart';
import 'package:fast_order/presentation/bloc/index.dart';
import 'package:fast_order/presentation/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../utils/index.dart';

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
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: Colors.grey,
                    size: scaleFont(30, context),
                  ),
                  onPressed: () => context.push('/create_order'), // Navega a la pantalla de creación de orden
                ),
              ],
              title: ResponsiveText(
                textScaleFactor: 1.5,
                text: 'Hola, ${context.read<AuthBloc>().state.user?.fullName}',
                style: textOrangeApp.copyWith(
                  fontSize: scaleFont(16, context),
                  fontWeight: FontWeight.w800,
                ),
              ),
              floating: true, // Reaparece al hacer scroll hacia arriba
              snap: true,     // Hace el efecto de "snap" cuando se muestra
              backgroundColor: Colors.white, // Cambia esto por tu color primario
            ),
              
            SliverToBoxAdapter( //carousel with welcome box
              child: CarouselWithWelcomeBox(
                height: size.height * 0.24,
                carouselWidth: size.width * 0.5,
                welcomeBoxWidth: size.width * 0.5,
              ),
            ),

            SliverToBoxAdapter( // Divider
              child: Divider(
                height: 5,
                color: Colors.grey[200],
                endIndent: 16,
                indent: 16,
                
              ),
            ),

            DishesListView(size: size), // ListView of dishes

            
          ],
        )
        
      ),
    );

  }
}
