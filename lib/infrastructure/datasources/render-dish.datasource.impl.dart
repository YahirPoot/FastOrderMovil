import 'package:dio/dio.dart';
import 'package:fast_order/config/index.dart';
import 'package:fast_order/domain/index.dart';
import 'package:fast_order/infrastructure/index.dart';

class RenderDishDatasourceImpl implements DishDatasource {

  final Dio dio;

  RenderDishDatasourceImpl()
      : dio = Dio(
        BaseOptions(
          baseUrl: Environment.apiUrl,
        ),
      ) {
        dio.interceptors.add(
          AuthInterceptor(
            dio: dio,
            keyValueStorageService: KeyValueStorageServiceImpl(),
            authRepository: AuthRepositoryImpl(),
          ),
        );
      }
  
  @override
  Future<List<Dish>> getAvailableDishes() async{
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      final response = await dio.get('/sched-dish/available-dishes');

      final List<Dish> dishes = (response.data as List).map((dish) => DishMapper.dishToEntity(dish)).toList();

      return dishes;

    } on DioException catch (e) { //si es un error que no sea de dio, no pasa por aquí. 

      if( e.error is InvalidRefreshToken) throw InvalidRefreshToken(message: 'Invalid refresh token');
      if( e.type == DioExceptionType.connectionTimeout ) throw ConnectionTimeout();
      if( e.response?.statusCode == 404 ) throw CustomError('${e.response?.data['error']}', e.response?.statusCode ?? 404);
      throw CustomError('Unexpected DioException', 500);
    }
    
  }



}