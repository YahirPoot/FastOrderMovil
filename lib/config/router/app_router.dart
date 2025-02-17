import 'package:fast_order/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:fast_order/presentation/screens/auth/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(redirect: (context, state) {
    // que tengo que hacer para enviar el redirect? r: cambiar el estado de isLoggedIn
    //por que se activa el redirect cada vez que utilizo el go_router?
    final authState = context.read<AuthBloc>().state;
    final isLoggedIn = authState.isLoggedIn;
    final isLogginIn =
        state.matchedLocation == '/login' || state.matchedLocation == '/register';
    if (!isLoggedIn && !isLogginIn) {
      return '/login';
    }

    if (isLoggedIn && isLogginIn) {
      return '/';
    }

    return null;
  }, 

  initialLocation: '/', 
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
  ]
);
