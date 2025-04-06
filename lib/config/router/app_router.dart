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
  final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
  return GoRouter(
    navigatorKey: rootNavigatorKey, // Se asigna la clave del navegador raíz
    refreshListenable: goRouterNotifier, // Se pasa el notifier al router
    redirect: (context, state) {
      final authState = context.read<AuthBloc>().state;
      // print('GoRouter redirect: Current authStatus is ${authState.authStatus}');

      final isAuthenticated = authState.authStatus == AuthStatus.authenticated;
      final isChecking = authState.authStatus == AuthStatus.checking;
      final isOnAuthPages = _isOnAuthPages(state.matchedLocation);

      // Validaciones del redirect
      if (isChecking) return null; // No redirigir mientras se verifica el estado de autenticación
      if (!isAuthenticated && !isOnAuthPages) return '/login'; // Redirigir al login si no está autenticado
      if (isAuthenticated && isOnAuthPages) return '/'; // Redirigir al home si está autenticado y en páginas de login
      if (isAuthenticated && state.matchedLocation == '/loading') return '/'; // Redirigir al home desde la pantalla de carga

      return null; // Mantener la ruta actual si no se cumplen las condiciones
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

// Función auxiliar para verificar si la ubicación actual está en las páginas de autenticación
bool _isOnAuthPages(String? matchedLocation) {
  return matchedLocation == '/login' || matchedLocation == '/register';
}