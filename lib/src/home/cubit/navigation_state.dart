part of 'navigation_cubit.dart';

class NavigationState extends Equatable {
  const NavigationState({
    required this.item,
  });

  final HomeNavigationItem item;

  @override
  List<Object> get props => [item];
}
