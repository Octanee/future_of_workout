import 'package:future_of_workout/src/body/body_circuit/body_circuit/body_circuit.dart';
import 'package:future_of_workout/src/body/body_recovery/body_recovery.dart';
import 'package:future_of_workout/src/body/body_weight/body_weight.dart';
import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/home/home.dart';

class BodyPage extends StatelessWidget {
  const BodyPage({super.key});

  static String name = HomeNavigationItem.body.name;

  @override
  Widget build(BuildContext context) {
    return HomeWrapper(
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            CustomTabBar(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              tabs: [
                Tab(text: context.locale.recoveryTab),
                Tab(text: context.locale.weightTab),
                Tab(text: context.locale.circuitTab),
              ],
            ),
            const CustomTabBarView(
              children: [
                BodyRecoveryTab(),
                BodyWeightTab(),
                BodyCircuitTab(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
