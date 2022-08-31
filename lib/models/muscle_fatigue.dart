import 'models.dart';

class MuscleFatigue {
  final Muscle muscle;
   Fatigue fatigue;

  MuscleFatigue({
    required this.muscle,
    this.fatigue = Fatigue.fatigue0,
  });

  void calculateMuscleFatigue({required List<Fatigue> fatigues}) {
    // TODO Calculate Muscle Fatigue
  }
}
