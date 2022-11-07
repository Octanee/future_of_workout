import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/home/home.dart';
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
    final currentWorkout = context.watch<CurrentWorkoutBloc>().state.workoutLog;

    return BlocListener<NavigationCubit, NavigationState>(
      listenWhen: (previous, current) => previous.item != current.item,
      listener: (context, state) {
        final name = state.item.name;
        context.goNamed(HomePage.name, params: {'homePageTab': name});
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: BlocBuilder<NavigationCubit, NavigationState>(
            buildWhen: (previous, current) => previous.item != current.item,
            builder: (context, state) {
              return Text(
                context.locale.navigationItem(state.item.label),
                style: AppTextStyle.bold28,
              );
            },
          ),
          elevation: 1,
        ),
        resizeToAvoidBottomInset: false,
        floatingActionButton: const CurrentWorkoutFab(),
        floatingActionButtonLocation: currentWorkout != null
            ? FloatingActionButtonLocation.miniStartDocked
            : null,
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
