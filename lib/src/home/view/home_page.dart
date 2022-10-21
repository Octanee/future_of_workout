import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/home/home.dart';
import 'package:future_of_workout/src/styles/app_colors.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.item, super.key});

  static String get name => 'home';
  static String get path {
    final buffer = StringBuffer('/:homePageTab(');
    final length = HomeNavigationItem.values.length;
    for (var i = 0; i < length; i++) {
      final item = HomeNavigationItem.values[i];
      buffer.write(item.name);
      if (i != length - 1) {
        buffer.write('|');
      }
    }
    buffer.write(')');
    return buffer.toString();
  }

  final HomeNavigationItem item;

  @override
  Widget build(BuildContext context) {
    context.read<NavigationCubit>().changeDestination(item: item);
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavigationCubit, NavigationState>(
      listenWhen: (previous, current) => previous.item != current.item,
      listener: (context, state) {
        final name = state.item.name;
        context.goNamed(HomePage.name, params: {'homePageTab': name});
      },
      child: Scaffold(
        floatingActionButton: const CurrentWorkoutFab(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniStartDocked,
        backgroundColor: AppColors.background,
        bottomNavigationBar: const BottomNavigation(),
        body: BlocBuilder<NavigationCubit, NavigationState>(
          buildWhen: (previous, current) => previous.item != current.item,
          builder: (context, state) => state.item.view,
        ),
      ),
    );
  }
}
