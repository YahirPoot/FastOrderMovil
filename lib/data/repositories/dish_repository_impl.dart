import 'package:dio/dio.dart';
import 'package:fast_order/domain/repositories/dish_repository.dart';

import '../../domain/entities/index.dart';

class DishRepositoryImpl implements DishRepository {
  final Dio dioClient;

  DishRepositoryImpl({required this.dioClient});

  @override
  Future<List<Dish>> getDishes() async {
    try {
      final response =
          await dioClient.get('http://localhost:3000/api/dish/get-all');
      final jsonData = response.data as List;
      return jsonData.map((dish) => Dish.fromJson(dish)).toList();
    } catch (e) {
      throw Exception('Error fetching dishes: $e');
    }
  }
}
