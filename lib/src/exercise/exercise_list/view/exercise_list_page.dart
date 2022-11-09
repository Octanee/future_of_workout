import 'package:exercise_repository/exercise_repository.dart';
import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:go_router/go_router.dart';

class ExerciseListPage extends StatelessWidget {
  const ExerciseListPage({required this.extra, super.key});

  final ExerciseListExtra extra;

  static String name = '/exercise-list';
  static String path = name;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExerciseListBloc(
        exerciseRepository: context.read<ExerciseRepository>(),
        extra: extra,
      )..add(const ExerciseListSubscriptionRequested()),
      child: const ExerciseListView(),
    );
  }
}

class ExerciseListView extends StatelessWidget {
  const ExerciseListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExerciseListBloc, ExerciseListState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == ExerciseListStatus.confirm) {
          context.pop();
        }
      },
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.isSearching != current.isSearching,
      builder: (context, state) {
        switch (state.status) {
          case ExerciseListStatus.failure:
            return const AppScaffold(body: AppError());
          case ExerciseListStatus.initial:
          case ExerciseListStatus.loading:
            return const AppScaffold(body: AppLoading());
          case ExerciseListStatus.confirm:
          case ExerciseListStatus.success:
            return AppScaffold(
              title: context.locale.exercises,
              customTitle: state.isSearching ? const _SearchBar() : null,
              floatingActionButton: const _ConfirmFab(),
              actions: const [_SearchButton()],
              body: const _ExerciseList(),
            );
        }
      },
    );
  }
}

class _ConfirmFab extends StatelessWidget {
  const _ConfirmFab();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseListBloc, ExerciseListState>(
      builder: (context, state) {
        final lenght = state.selected.values.where((element) => element).length;

        if (lenght < 1) {
          return Container();
        }

        switch (state.extra.selectionType) {
          case SelectionType.none:
            return Container();
          case SelectionType.single:
            return FloatingActionButton(
              child: state.extra.icon,
              onPressed: () {
                context
                    .read<ExerciseListBloc>()
                    .add(const ExerciseListConfirm());
              },
            );
          case SelectionType.multiple:
            return FloatingActionButton.extended(
              label: Text(
                // 'Add $lenght exercises',
                context.locale.addExercisesCount(lenght),
                style: AppTextStyle.semiBold16,
              ),
              onPressed: () {
                context
                    .read<ExerciseListBloc>()
                    .add(const ExerciseListConfirm());
              },
            );
        }
      },
    );
  }
}

class _ExerciseList extends StatelessWidget {
  const _ExerciseList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseListBloc, ExerciseListState>(
      builder: (context, state) {
        final list = state.data;
        // TODO(UI): Animated list
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          physics: const BouncingScrollPhysics(),
          children: list.map<Widget>((exercise) {
            final isSelected = state.selected[exercise] ?? false;
            return ExerciseItem(
              exercise: exercise,
              isSelected: isSelected,
              onTap: () {
                if (state.extra.selectionType == SelectionType.none) {
                  context.pushNamed(
                    ExerciseStatsPage.name,
                    params: {'exerciseId': exercise.id},
                  );
                } else {
                  context
                      .read<ExerciseListBloc>()
                      .add(ExerciseListSelect(exercise: exercise));
                }
              },
              onIconPressed: () {
                context.pushNamed(
                  ExerciseDetailsPage.name,
                  params: {'exerciseId': exercise.id},
                );
              },
            );
          }).toList(),
        );
      },
    );
  }
}

class _SearchButton extends StatelessWidget {
  const _SearchButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseListBloc, ExerciseListState>(
      buildWhen: (previous, current) =>
          previous.isSearching != current.isSearching,
      builder: (context, state) {
        return Visibility(
          visible: !state.isSearching,
          child: IconButton(
            onPressed: () {
              context
                  .read<ExerciseListBloc>()
                  .add(const ExerciseListFilter(filter: ''));
            },
            icon: const AppIcon(iconData: AppIcons.search),
          ),
        );
      },
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        floatingLabelStyle: AppTextStyle.semiBold16,
        // TODO(Intl): Translate
        labelText: 'Search',
        prefixIcon: const AppIcon(iconData: AppIcons.search),
        suffixIcon: IconButton(
          onPressed: () {
            context
                .read<ExerciseListBloc>()
                .add(const ExerciseListFilterCancel());
          },
          // TODO(Icon): Cancel searching icon
          icon: const AppIcon(iconData: AppIcons.stop),
        ),
      ),
      onChanged: (value) => context
          .read<ExerciseListBloc>()
          .add(ExerciseListFilter(filter: value)),
      onSubmitted: (value) {
        if (value.isEmpty) {
          context
              .read<ExerciseListBloc>()
              .add(const ExerciseListFilterCancel());
        }
      },
    );
  }
}
