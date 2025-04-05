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
    
    /* SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://www.cocinadelirante.com/sites/default/files/images/2024/05/como-hacer-pescado-empanizado-crujiente-al-horno.jpg',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Guisos del dia',
                      style: titleBlackF24,
                    ),
                    Text('Fecha', style: titleOrangeF20),
                    Text(
                      'Raciones Disponibles',
                      style: descriptionBlackF16,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.black26,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Guisos Disponibles', style: titleBlackF24),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.black26,
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder<List<Dish>>(
            future: dishRepository.getDishes(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Text('No hay guisos disponibles'),
                );
              } else {
                final dishes = snapshot.data!;
                return GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  children: dishes.map((dish) {
                    return CustomContainerFood(
                      text: dish.name,
                      imageUrl: dish.imageUrl ?? '',
                    );
                  }).toList(),
                );
              }
            },
          )
        ],
      ),
    ); */
  }
}
