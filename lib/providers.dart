import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fast_order/presentation/bloc/index.dart';

class AppBlocProviders extends StatelessWidget {
  final Widget main;
  const AppBlocProviders({super.key, required this.main});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeNavigationBloc()),
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: main,
    );
  }
}
