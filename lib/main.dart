import 'package:fast_order/app.dart';
import 'package:fast_order/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:fast_order/presentation/bloc/home_navigation_bloc/home_navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeNavigationBloc(),
        ), 
        BlocProvider(
          create: (context) => AuthBloc(),
        )
      ],
      child: MainApp(),
    )
  );
}
