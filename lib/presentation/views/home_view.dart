import 'package:dio/dio.dart';
import 'package:fast_order/config/themes/index.dart';
import 'package:fast_order/domain/entities/index.dart';
import 'package:fast_order/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:fast_order/presentation/widgets/index.dart';
import 'package:fast_order/data/repositories/dish_repository_impl.dart';
import 'package:fast_order/domain/repositories/dish_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  final DishRepository dishRepository =
      DishRepositoryImpl(dioClient: Dio());
  HomeView({super.key});

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
