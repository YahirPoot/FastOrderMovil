import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_order/domain/index.dart';
import 'package:fast_order/infrastructure/index.dart';
import 'package:fast_order/presentation/bloc/index.dart';

part 'available_dishes_event.dart';
part 'available_dishes_state.dart';

class AvailableDishesBloc extends Bloc<AvailableDishesEvent, AvailableDishesState> {
  final DishRepository _dishRepository;
  final AuthBloc authBloc;

  AvailableDishesBloc({
    KeyValueStorageService? keyValueStorageService,
    DishRepository? dishRepository,
    required this.authBloc,
  })  
  : _dishRepository = dishRepository ?? DishRepositoryImpl(),
    super(AvailableDishesState()) {

    settAvailableDishesState({ List<Dish>? availableDishes, required Emitter<AvailableDishesState> emit}) {
      emit(state.copyWith(
        availableDishes: availableDishes,
        isFetching: false,
        errorMessage: '',
      ));
      // print('State after fetch: ${ state}');
    }

    on<FetchAvailableDishesEvent>((event, emit) async {
      try {
        if(state.isFetching) return;

        emit(state.copyWith(
          isFetching: true,
        ));

        // print('state before fetch: ${ state}');

        final List<Dish> availableDishes = await _dishRepository.getAvailableDishes();
        settAvailableDishesState(availableDishes: availableDishes, emit: emit);

      } on InvalidRefreshToken catch (e){
        emit(state.copyWith(
          errorMessage: e.message,
          isFetching: false,
        ));
        // Disparar el evento de Logout
        authBloc.add(LogoutEvent());
      
      } on ConnectionTimeout {
        emit(state.copyWith(
          errorMessage: 'Connection timeout',
          isFetching: false,
        ));
      } on CustomError catch (e) {
        emit(state.copyWith(
          errorMessage: e.message,
          isFetching: false,
        ));
      } on MappingError catch (e) {
        emit(state.copyWith(
          errorMessage: e.message,
          isFetching: false,
        ));
      }
      catch (e) {
        emit(state.copyWith(
          errorMessage: 'Error not controlled',
          isFetching: false,
        ));
      }
    });

  }
}
