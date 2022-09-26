import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/home/home.dart';
import 'package:future_of_workout/src/styles/styles.dart';
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
    context.read<NavigationCubit>().changeDestination(index: item.itemIndex);
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
      listener: (context, state) {
        final name = state.item.name;
        context.goNamed(HomePage.name, params: {'homePageTab': name});
      },
      child: Scaffold(
        bottomNavigationBar: _getNavigationBar(context),
        body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) => state.item.view,
        ),
      ),
    );
  }

  NavigationBarTheme _getNavigationBar(BuildContext context) {
    return NavigationBarTheme(
      data: const NavigationBarThemeData(
        elevation: 2,
        indicatorColor: AppColors.yellow,
        backgroundColor: AppColors.white,
      ),
      child: NavigationBar(
        selectedIndex:
            context.select<NavigationCubit, int>((value) => value.state.index),
        onDestinationSelected: (index) =>
            context.read<NavigationCubit>().changeDestination(index: index),
        destinations: _getDestinations,
      ),
    );
  }

  List<Widget> get _getDestinations {
    return List.generate(
      HomeNavigationItem.values.length,
      (index) => HomeNavigationItem.values[index].getNavigationDestination(),
    );
  }
}
