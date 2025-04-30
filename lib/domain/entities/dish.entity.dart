class Dish {
  final int id;
  final String name;
  final int pricePerServing;
  final int pricePerHalfServing;
  final double availableServings;
  final List<int>? sidesId;
  final String? imageUrl;

  Dish({
    required this.id,
    required this.name,
    required this.pricePerServing,
    required this.pricePerHalfServing,
    required this.availableServings,

    this.sidesId,
    this.imageUrl,
  });

}
