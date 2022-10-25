import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/setup/setup.dart';

import 'package:future_of_workout/src/setup/view/widgets/widgets.dart';
import 'package:future_of_workout/src/styles/app_colors.dart';
import 'package:future_of_workout/src/styles/app_text_style.dart';
import 'package:future_of_workout/src/widgets/cards/cards.dart';
import 'package:user_repository/user_repository.dart';

class GenderSetup extends StatelessWidget {
  const GenderSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return SetupContent(
      title: "What's your gender?",
      description: 'This will help us set your goals more efficency',
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
                  icon: Icons.male_rounded,
                  text: "I'm a male",
                  isSelected: state.user.gender == Gender.male,
                  onTap: () {
                    context
                        .read<SetupBloc>()
                        .add(const SetupGenderChange(gender: Gender.male));
                  },
                ),
                _GenderCard(
                  icon: Icons.female_rounded,
                  text: "I'm a female",
                  isSelected: state.user.gender == Gender.female,
                  onTap: () {
                    context
                        .read<SetupBloc>()
                        .add(const SetupGenderChange(gender: Gender.female));
                  },
                ),
                _GenderCard(
                  icon: Icons.person,
                  text: "I don't want to pass",
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
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
