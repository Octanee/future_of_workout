import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:future_of_workout/src/logic/home/navigation/navigation.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super(const NavigationState(item: NavbarItem.workouts, index: 0));

  void changeDestination({required int index}) {
    switch (index) {
      case 0:
        emit(const NavigationState(item: NavbarItem.workouts, index: 0));
        break;
      case 1:
        emit(const NavigationState(item: NavbarItem.body, index: 1));
        break;
      case 2:
        emit(const NavigationState(item: NavbarItem.discover, index: 2));
        break;
      case 3:
        emit(const NavigationState(item: NavbarItem.settings, index: 3));
        break;
    }
  }
}
