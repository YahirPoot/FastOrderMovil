import 'package:fast_order/config/router/app_router.dart';
import 'package:fast_order/config/themes/theme_app.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = createAppRouter(context);
    return MaterialApp.router(
      routerConfig: router,
      theme: AppTheme(
        selectedColor: 0,
        isDarkMode: false,
      ).getTheme(),
      title: 'OrderFast',
      debugShowCheckedModeBanner: false,
    );
  }
}