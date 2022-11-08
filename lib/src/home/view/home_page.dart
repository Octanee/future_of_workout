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
          title: const _AppBarTitle(),
          elevation: 1,
          actions: const [_WorkoutTime()],
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

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      buildWhen: (previous, current) => previous.item != current.item,
      builder: (context, state) {
        return Text(
          context.locale.navigationItem(state.item.label),
          style: AppTextStyle.bold28,
        );
      },
    );
  }
}

class _WorkoutTime extends StatelessWidget {
  const _WorkoutTime();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      buildWhen: (previous, current) => previous.item != current.item,
      builder: (context, state) {
        return Visibility(
          visible: state.item == HomeNavigationItem.currentWorkout,
          child: BlocBuilder<CurrentWorkoutBloc, CurrentWorkoutState>(
            buildWhen: (previous, current) => previous.time != current.time,
            builder: (context, state) {
              final time = Duration(seconds: state.time);

              String twoDigits(int n) => n.toString().padLeft(2, '0');

              final hours = twoDigits(time.inHours.remainder(24));
              final minutes = twoDigits(time.inMinutes.remainder(60));
              final seconds = twoDigits(time.inSeconds.remainder(60));

              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Center(
                  child: Text(
                    '${hours != '00' ? '$hours:' : ''}$minutes:$seconds',
                    style: AppTextStyle.semiBold20,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
