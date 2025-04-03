import 'package:fast_order/config/router/app_router_notifier.dart';
import 'package:fast_order/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:fast_order/presentation/screens/auth/check_auth_status_screen.dart';
import 'package:fast_order/presentation/screens/auth/login_screen.dart';
import 'package:fast_order/presentation/screens/home/home_screen.dart';
import 'package:fast_order/presentation/views/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

GoRouter createAppRouter(BuildContext context) {
  final goRouterNotifier = GoRouterNotifier(context.read<AuthBloc>()); // Instancia del notifier
  return GoRouter(
    refreshListenable: goRouterNotifier, // Se pasa el notifier al router
    redirect: (context, state) {
      // Controlar el redirect por medio del refreshListenable
      final authState = context.read<AuthBloc>().state;
      print('GoRouter redirect: Current authStatus is ${authState.authStatus}');

      final isAuthenticated = authState.authStatus == AuthStatus.authenticated;
      final isChecking = authState.authStatus == AuthStatus.checking;
      final isOnAuthPages =
          state.matchedLocation == '/login' || state.matchedLocation == '/register';

      // Si está verificando el estado de autenticación, no redirigir aún.
      if (isChecking) return null;

      // Si no está autenticado y no está en las páginas de autenticación, redirigir a la página de inicio de sesión.
      if (!isAuthenticated && !isOnAuthPages) return '/login';

      // Si está autenticado y está en las páginas de autenticación, redirigir a la página principal.
      if (isAuthenticated && isOnAuthPages) return '/';

      // null significa que no hay redireccionamiento - se mantiene la ruta actual
      return null;
    },
    initialLocation: '/loading',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/loading',
        builder: (context, state) => const CheckAuthStatusScreen(), // Pantalla de carga
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, child) {
          return HomeScreen(child: child);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => HomeView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/orders',
                builder: (context, state) => OrderView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/account',
                builder: (context, state) => AccountView(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}