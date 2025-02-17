part of 'home_navigation_bloc.dart';

sealed class HomeNavigationEvent extends Equatable {
  const HomeNavigationEvent();

  @override
  List<Object> get props => [];
}

class BottomNavItemSelected extends HomeNavigationEvent {
  final int currentIndex;
  const BottomNavItemSelected(
    this.currentIndex
  );

  @override
  List<Object> get props => [currentIndex];
}