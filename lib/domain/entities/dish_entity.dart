class Dish {
  final int id;
  final String name;
  final double pricePerServing;
  final double pricePerHalfServing;
  final double availableServings;
  final int kitchenId;
  final List<int>? sidesId;
  final String? imageUrl;

  Dish({
    required this.id,
    required this.name,
    required this.pricePerServing,
    required this.pricePerHalfServing,
    required this.availableServings,
    required this.kitchenId,
    this.sidesId,
    this.imageUrl,
  });

  static Dish fromJson(Map<String, dynamic> json) {
    // Validaciones
    if (json['id'] == null) throw Exception('id is required');
    if (json['nombre'] == null) throw Exception('nombre is required');
    if (json['precioEntera'] == null) throw Exception('precioEntera is required');
    if (json['precioMedia'] == null) throw Exception('precioMedia is required');
    if (json['cocinaId'] == null) throw Exception('cocinaId is required');
    if (json['rutaImagen'] != null && json['rutaImagen'] is! String) {
      throw Exception('Image Path must be a string or null');
    }

    // Parseo de complementos (sidesId)
    final List<int> sidesId = [];
    if (json['complementos'] != null) {
      for (var complemento in json['complementos']) {
        if (complemento['complementoId'] != null) {
          sidesId.add(complemento['complementoId'] as int);
        }
      }
    }

    return Dish(
      id: json['id'] as int,
      name: json['nombre'] as String,
      pricePerServing: json['precioEntera'].toDouble(),
      pricePerHalfServing: json['precioMedia'].toDouble(),
      availableServings: json['racionesDisponibles'] ?? 0, // Valor por defecto si es null
      kitchenId: json['cocinaId'] as int,
      sidesId: sidesId.isNotEmpty ? sidesId : null,
      imageUrl: json['rutaImagen'] as String?,
    );
  }
}
