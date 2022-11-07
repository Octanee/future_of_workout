import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/home/home.dart';

class NavigationItem extends StatelessWidget {
  const NavigationItem({
    required this.item,
    super.key,
  });

  final HomeNavigationItem item;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      buildWhen: (previous, current) => previous.item != current.item,
      builder: (context, state) {
        final isSelected = state.item == item;

        return Flexible(
          fit: FlexFit.tight,
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppIcon(
                    iconData: item.icon,
                    color: isSelected ? AppColors.yellow : AppColors.grey,
                  ),
                  Text(
                    context.locale.navigationItem(item.label),
                    style: isSelected
                        ? AppTextStyle.regular16
                            .copyWith(color: AppColors.yellow)
                        : AppTextStyle.regular12,
                  )
                ],
              ),
              onPressed: () =>
                  context.read<NavigationCubit>().changeDestination(item: item),
            ),
          ),
        );
      },
    );
  }
}
