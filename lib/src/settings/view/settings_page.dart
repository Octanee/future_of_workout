import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/home/home.dart';
import 'package:future_of_workout/src/settings/settings.dart';
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
    return HomeWrapper(
      body: BlocBuilder<SettingsBloc, SettingsState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          switch (state.status) {
            case SettingsStatus.initial:
            case SettingsStatus.loading:
              return const AppLoading();
            case SettingsStatus.failure:
              return const AppError();
            case SettingsStatus.success:
              return ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                physics: const BouncingScrollPhysics(),
                children: [
                  const AgeCard(),
                  const HeightCard(),
                  const WeightCard(),
                  const GenderCard(),
                  Header(text: context.locale.preferences),
                  const LengthUnitCard(),
                  const WeightUnitCard(),
                ],
              );
          }
        },
      ),
    );
  }
}
