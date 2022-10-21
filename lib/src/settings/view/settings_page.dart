import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/home/home.dart';
import 'package:future_of_workout/src/settings/settings.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:measurement_repository/measurement_repository.dart';
import 'package:user_repository/user_repository.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static String name = HomeNavigationItem.settings.name;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc(
        userRepository: context.read<UserRepository>(),
        measurementRepository: context.read<MeasurementRepository>(),
      )..add(const SettingsLoading()),
      child: const SettingsView(),
    );
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Settings',
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        physics: const BouncingScrollPhysics(),
        children: const [
          AgeCard(),
          HeightCard(),
          WeightCard(),
          GenderCard(),
          Header(text: 'Preferences'),
          LengthUnitCard(),
          WeightUnitCard(),
        ],
      ),
    );
  }
}
