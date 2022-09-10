part of 'navigation_cubit.dart';

class NavigationState extends Equatable {
  const NavigationState({
    required this.item,
    required this.index,
  });

  final HomeNavigationItem item;
  final int index;

  @override
  List<Object> get props => [item, index];
}
