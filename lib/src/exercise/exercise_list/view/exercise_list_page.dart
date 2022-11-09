import 'package:body_api/body_api.dart';
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
              body: Column(
                children: const [
                  _SettingsRow(),
                  _ExerciseList(),
                ],
              ),
            );
        }
      },
    );
  }
}

class _SettingsRow extends StatelessWidget {
  const _SettingsRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: const [
          _MuscleButton(),
          SizedBox(width: 8),
          _CategoryButton(),
        ],
      ),
    );
  }
}

class _MuscleButton extends StatelessWidget {
  const _MuscleButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseListBloc, ExerciseListState>(
      buildWhen: (previous, current) => previous.muscle != current.muscle,
      builder: (context, state) {
        final muscle = state.muscle;
        final text = muscle?.name ?? 'Any muscles';
        return Flexible(
          fit: FlexFit.tight,
          child: CustomBar(
            onTap: () async {
              final bloc = context.read<ExerciseListBloc>();

              await showDialog<String>(
                context: context,
                builder: (context) => _MuscleDialog(
                  muscle: muscle,
                  onConfirm: (muscle) =>
                      bloc.add(ExerciseListMuscle(muscle: muscle)),
                ),
              );
            },
            child: Center(
              child: Text(
                text.capitalize(),
                style: AppTextStyle.semiBold20,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _MuscleDialog extends StatefulWidget {
  const _MuscleDialog({
    required this.onConfirm,
    this.muscle,
  });

  final Muscle? muscle;
  final ValueChanged<Muscle?> onConfirm;

  @override
  State<_MuscleDialog> createState() => _MuscleDialogState();
}

class _MuscleDialogState extends State<_MuscleDialog> {
  Muscle? muscle;

  @override
  void initState() {
    muscle = widget.muscle;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.5,
      widthFactor: 1,
      child: CustomDialog(
        title: 'Pick muscle',
        content: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTile(text: 'All', value: null),
              ...Muscle.values.map<Widget>(
                (m) => _buildTile(
                  text: context.locale.muscle(m.name),
                  value: m,
                ),
              )
            ],
          ),
        ),
        onConfirm: () => widget.onConfirm(muscle),
      ),
    );
  }

  Widget _buildTile({required String text, required Muscle? value}) {
    return RadioListTile<Muscle?>(
      title: Text(text),
      value: value,
      groupValue: muscle,
      onChanged: (value) => setState(() {
        muscle = value;
      }),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseListBloc, ExerciseListState>(
      buildWhen: (previous, current) => previous.category != current.category,
      builder: (context, state) {
        final category = state.category;
        final text = category?.name ?? 'Any category';
        return Flexible(
          fit: FlexFit.tight,
          child: CustomBar(
            onTap: () async {
              final bloc = context.read<ExerciseListBloc>();

              await showDialog<String>(
                context: context,
                builder: (context) => _CategoryDialog(
                  category: category,
                  onConfirm: (category) =>
                      bloc.add(ExerciseListCategory(category: category)),
                ),
              );
            },
            child: Center(
              child: Text(
                text.capitalize(),
                style: AppTextStyle.semiBold20,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CategoryDialog extends StatefulWidget {
  const _CategoryDialog({
    required this.onConfirm,
    this.category,
  });

  final ExerciseCategory? category;
  final ValueChanged<ExerciseCategory?> onConfirm;

  @override
  State<_CategoryDialog> createState() => _CategoryDialogState();
}

class _CategoryDialogState extends State<_CategoryDialog> {
  ExerciseCategory? category;

  @override
  void initState() {
    category = widget.category;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.5,
      widthFactor: 1,
      child: CustomDialog(
        title: 'Pick category',
        content: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTile(text: 'All', value: null),
              ...ExerciseCategory.values.map<Widget>(
                (c) => _buildTile(
                  // TODO(intl): Translate category
                  text: c.name,
                  value: c,
                ),
              )
            ],
          ),
        ),
        onConfirm: () => widget.onConfirm(category),
      ),
    );
  }

  Widget _buildTile({required String text, required ExerciseCategory? value}) {
    return RadioListTile<ExerciseCategory?>(
      title: Text(text),
      value: value,
      groupValue: category,
      onChanged: (value) => setState(() {
        category = value;
      }),
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
        return Expanded(
          child: ListView(
            shrinkWrap: true,
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
          ),
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
        floatingLabelBehavior: FloatingLabelBehavior.never,
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
