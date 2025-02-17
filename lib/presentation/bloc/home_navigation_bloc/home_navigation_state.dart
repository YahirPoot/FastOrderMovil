part of 'home_navigation_bloc.dart';

class HomeNavigationState extends Equatable { //el estado inicial nunca cambia 

  final int currentIndex; //el index de la pantalla actual

  const HomeNavigationState(
    this.currentIndex
  ); 

  copyWith({int? currentIndex}) {
    return HomeNavigationState(
      currentIndex ?? this.currentIndex
    );
  }
  
  @override
  List<Object> get props => [currentIndex]; //se usa para comparar si dos estados son iguales, si no son iguales se actualiza el estado.
}

//se puden agregar otros estados