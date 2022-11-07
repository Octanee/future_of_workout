import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/setup/setup.dart';
import 'package:future_of_workout/src/setup/view/widgets/widgets.dart';
import 'package:user_repository/user_repository.dart';

class GenderSetup extends StatelessWidget {
  const GenderSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return SetupContent(
      title: context.locale.setupGenderTitle,
      description: context.locale.setupGenderDescription,
      children: [
        BlocBuilder<SetupBloc, SetupState>(
          buildWhen: (previous, current) =>
              previous.user.gender != current.user.gender,
          builder: (context, state) {
            return GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              children: [
                _GenderCard(
                  // TODO(Icon): Change icon
                  icon: Icons.male_rounded,
                  text: context.locale.setupGenderMale,
                  isSelected: state.user.gender == Gender.male,
                  onTap: () {
                    context
                        .read<SetupBloc>()
                        .add(const SetupGenderChange(gender: Gender.male));
                  },
                ),
                _GenderCard(
                  // TODO(Icon): Change icon
                  icon: Icons.female_rounded,
                  text: context.locale.setupGenderFemale,
                  isSelected: state.user.gender == Gender.female,
                  onTap: () {
                    context
                        .read<SetupBloc>()
                        .add(const SetupGenderChange(gender: Gender.female));
                  },
                ),
                _GenderCard(
                  // TODO(Icon): Change icon
                  icon: Icons.person,
                  text: context.locale.setupGenderOther,
                  isSelected: state.user.gender == Gender.other,
                  onTap: () {
                    context
                        .read<SetupBloc>()
                        .add(const SetupGenderChange(gender: Gender.other));
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _GenderCard extends StatelessWidget {
  const _GenderCard({
    required this.icon,
    required this.text,
    required this.onTap,
    this.isSelected = false,
  });

  final IconData icon;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.all(8),
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TODO(Icon): Change icon type
          Icon(
            icon,
            size: 96,
            color: isSelected ? AppColors.yellow : AppColors.grey,
          ),
          Text(
            text,
            style: AppTextStyle.bold20,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
