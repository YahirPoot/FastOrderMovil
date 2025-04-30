import 'package:fast_order/domain/index.dart';
import 'package:fast_order/infrastructure/index.dart';

class DishMapper {
  static Dish dishToEntity(Map<String, dynamic> json) { //TODO: Change to inglish upto backend change this to inglish.
    final id = json['id'];
    final name = json['nombre'];
    final imageUrl = json['rutaImagen'];
    final pricePerServing = json['precioMedia'];
    final pricePerHalfServing = json['precioEntera'];
    final availableServings = json['racionesDisponibles'].toDouble();
    // final sidesId = json['sidesId']?.cast<int>(); //TODO: Add SidesId

    if (id is! int) throw MappingError('Invalid or missing "dishId"');
    if (name is! String) throw MappingError('Invalid or missing "name"');
    if (pricePerServing is! int) throw MappingError('Invalid or missing "pricePerServing"');
    if (pricePerHalfServing is! int) throw MappingError('Invalid or missing "pricePerHalfServing"');
    if (availableServings is! double) throw MappingError('Invalid or missing "availableServings"');

    return Dish(
      id: id,
      name: name,
      pricePerServing: pricePerServing,
      pricePerHalfServing: pricePerHalfServing,
      availableServings: availableServings,
      // sidesId: sidesId,
      imageUrl: imageUrl,
    );
  }
}