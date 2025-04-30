import 'package:fast_order/domain/index.dart';

abstract class DishDatasource {

  Future<List<Dish>> getAvailableDishes();

}