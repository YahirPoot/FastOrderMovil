import 'package:fast_order/presentation/bloc/index.dart';
import 'package:fast_order/presentation/widgets/home/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
class HomeScreen extends StatelessWidget {
  final Widget child;
  const HomeScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.select(
      (HomeNavigationBloc bloc) => bloc.state.currentIndex,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: child, // Este es el contenido que cambia con GoRouter
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: currentIndex,
        onTap: (index) {
          context.read<HomeNavigationBloc>().add(BottomNavItemSelected(index));
          // Aquí se navega con GoRouter, no con pageController
          context.go(
            index == 0
                ? '/'
                : index == 1
                    ? '/orders'
                    : '/account',
          );
        },
      ),
    );
  }
}