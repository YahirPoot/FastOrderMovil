import 'package:fast_order/domain/index.dart';
import 'package:fast_order/infrastructure/index.dart';

class DishRepositoryImpl implements DishRepository {
  
  final DishDatasource dishDatasource;
  
  DishRepositoryImpl({
    DishDatasource? datasource,
  }) : dishDatasource = datasource ?? RenderDishDatasourceImpl();
  
  @override
  Future<List<Dish>> getAvailableDishes() {
    return dishDatasource.getAvailableDishes();
  }
}