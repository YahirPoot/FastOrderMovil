import 'package:fast_order/presentation/bloc/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final registerBloc = context.watch<AuthBloc>();
    return Center(
      child: FilledButton(
        onPressed: () {
          registerBloc.add(LogoutEvent());
        }, 
        child: const Text('Logout')
        ),
    );

  }
}
