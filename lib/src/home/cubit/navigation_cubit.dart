import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:future_of_workout/src/home/home.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit({required HomeNavigationItem item})
      : super(NavigationState(item: item));

  void changeDestination({required HomeNavigationItem item}) =>
      emit(NavigationState(item: item));
}
