import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_navigation_event.dart';
part 'home_navigation_state.dart';

class HomeNavigationBloc extends Bloc<HomeNavigationEvent, HomeNavigationState> {
  HomeNavigationBloc() : super(HomeNavigationState(0)) {

    on<BottomNavItemSelected>((event, emit) {
      emit(state.copyWith(currentIndex: event.currentIndex));
    });

  }
}
