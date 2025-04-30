part of 'available_dishes_bloc.dart';

class AvailableDishesState extends Equatable {
  final List<Dish>? availableDishes;
  final bool isFetching;
  final String errorMessage;

  const AvailableDishesState({
    this.availableDishes,
    this.isFetching = false,
    this.errorMessage = '',
  });

  AvailableDishesState copyWith({
    List<Dish>? availableDishes,
    bool? isFetching,
    String? errorMessage,
  }) {
    return AvailableDishesState(
      availableDishes: availableDishes ?? this.availableDishes,
      isFetching: isFetching ?? this.isFetching,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
  
  @override
  List<Object> get props => [availableDishes ?? [], isFetching, errorMessage];
}