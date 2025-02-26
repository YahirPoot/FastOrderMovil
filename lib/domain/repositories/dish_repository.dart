import '../entities/index.dart';

abstract class DishRepository {
  Future<List<Dish>> getDishes();
}