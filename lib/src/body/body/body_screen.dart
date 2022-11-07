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
                Tab(text: context.local.recoveryTab),
                Tab(text: context.local.weightTab),
                Tab(text: context.local.circuitTab),
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
