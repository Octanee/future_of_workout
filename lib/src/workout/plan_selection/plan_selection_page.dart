import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/workout/plan_selection/bloc/plan_selection_bloc.dart';
import 'package:future_of_workout/src/workout/workouts/workouts.dart';
import 'package:user_repository/user_repository.dart';
import 'package:workout_repository/workout_repository.dart';

class PlanSelectionPage extends StatelessWidget {
  const PlanSelectionPage({super.key});

  static String name = 'plan-selection';
  static String path = name;
  static Map<String, String> params = {'homePageTab': WorkoutsPage.name};

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return PlanSelectionBloc(
          userRepository: context.read<UserRepository>(),
          workoutRepository: context.read<WorkoutRepository>(),
        )
          ..add(const PlanSelectionLoading())
          ..add(const PlanSelectionLoadingUser());
      },
      child: const _PlanSelectionView(),
    );
  }
}

class _PlanSelectionView extends StatelessWidget {
  const _PlanSelectionView();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      // TODO(intl): Translate
      title: 'Select plan',
      floatingActionButton: const _AddFab(),
      body: BlocBuilder<PlanSelectionBloc, PlanSelectionState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          switch (state.status) {
            case PlanSelectionStatus.initial:
            case PlanSelectionStatus.loading:
              return const AppLoading();
            case PlanSelectionStatus.empty:
              return const AppEmptyList(
                // TODO(intl): Translate
                text: 'No plan has been created',
              );
            case PlanSelectionStatus.failure:
              return const AppError();
            case PlanSelectionStatus.success:
              return const _PlansList();
          }
        },
      ),
    );
  }
}

class _PlansList extends StatelessWidget {
  const _PlansList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlanSelectionBloc, PlanSelectionState>(
      buildWhen: (previous, current) => previous.plans != current.plans,
      builder: (context, state) {
        final list = state.plans;
        return ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: list.map<Widget>((plan) => _PlanItem(plan: plan)).toList(),
        );
      },
    );
  }
}

class _PlanItem extends StatelessWidget {
  const _PlanItem({required this.plan});

  final Plan plan;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CustomCard(
        onTap: () async {
          final bloc = context.read<PlanSelectionBloc>();

          await showDialog<void>(
            context: context,
            builder: (context) => _PlanDialog(
              name: plan.name,
              onConfirm: (name) => bloc.add(
                PlanSelectionRenamePlan(plan: plan, newName: name),
              ),
              onDelete: () {
                bloc.add(PlanSelectionDeletePlan(id: plan.id));
                Navigator.of(context).pop();
              },
            ),
          );
        },
        padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                plan.name,
                style: AppTextStyle.semiBold20,
              ),
            ),
            const SizedBox(width: 8),
            _getIcon(),
          ],
        ),
      ),
    );
  }

  Widget _getIcon() {
    return BlocBuilder<PlanSelectionBloc, PlanSelectionState>(
      buildWhen: (previous, current) =>
          previous.currentPlan != current.currentPlan,
      builder: (context, state) {
        final isCurrent = plan.id == state.currentPlan?.id;

        return GestureDetector(
          onTap: () => context
              .read<PlanSelectionBloc>()
              .add(PlanSelectionSetCurrentPlan(id: plan.id)),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: AppIcon(
              iconData: isCurrent ? AppIcons.heartFilled : AppIcons.heart,
              color: isCurrent ? AppColors.yellow : null,
              widht: 32,
              height: 32,
            ),
          ),
        );
      },
    );
  }
}

class _AddFab extends StatelessWidget {
  const _AddFab();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        final bloc = context.read<PlanSelectionBloc>();

        await showDialog<void>(
          context: context,
          builder: (context) => _PlanDialog(
            onConfirm: (name) {
              bloc.add(PlanSelectionAddPlan(name: name));
            },
          ),
        );
      },
      child: const AppIcon(iconData: AppIcons.plus),
    );
  }
}

class _PlanDialog extends StatelessWidget {
  const _PlanDialog({
    required this.onConfirm,
    this.onDelete,
    this.name,
  });

  final ValueChanged<String> onConfirm;
  final String? name;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: name);
    return CustomDialog(
      // TODO(intl): Translate
      title: name != null ? 'Edit plan' : 'New plan',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller,
            style: AppTextStyle.bold28,
            decoration: InputDecoration(
              hintText: context.locale.name,
            ),
          ),
          Visibility(
            visible: onDelete != null,
            child: GestureDetector(
              onTap: onDelete,
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(context.locale.delete),
                    const AppIcon(iconData: AppIcons.trash),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      confirmButtonText:
          name != null ? context.locale.save : context.locale.add,
      onConfirm: () {
        final name = controller.text;
        onConfirm(name);
      },
    );
  }
}
