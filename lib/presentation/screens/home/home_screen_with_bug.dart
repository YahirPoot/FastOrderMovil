import 'package:fast_order/presentation/bloc/index.dart';
import 'package:fast_order/presentation/views/index.dart';
import 'package:fast_order/presentation/widgets/home/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreenBug extends StatelessWidget {
  final Widget child;
  const HomeScreenBug({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<HomeNavigationBloc, HomeNavigationState>(
        builder: (context, state) {
          return PageView(
            controller: pageController,
            onPageChanged: (index) {
              //este metodo se llama cuando se cambia de pagina
              context
                  .read<HomeNavigationBloc>()
                  .add(BottomNavItemSelected(index));
              context.go(index == 0
                  ? '/'
                  : index == 1
                      ? '/orders'
                      : index == 2
                          ? '/account'
                          : '/account');
            },
            children: [HomeView(), OrderView(), AccountView(),],
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<HomeNavigationBloc, HomeNavigationState>(
        builder: (context, state) {
          return CustomBottomNavigationBar(
            selectedIndex: state.currentIndex,
            onTap: (index) {
              context
                  .read<HomeNavigationBloc>()
                  .add(BottomNavItemSelected(index));
              pageController.jumpToPage(index);
            },
          );
        },
      ),
    );
  }
}
