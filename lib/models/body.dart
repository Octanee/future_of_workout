import 'models.dart';

class Body {
  final List<MuscleFatigue> _muscleFatigues = [
    MuscleFatigue(muscle: Muscle.neck),
    MuscleFatigue(muscle: Muscle.chest),
    MuscleFatigue(muscle: Muscle.serratus),
    MuscleFatigue(muscle: Muscle.shoulders),
    MuscleFatigue(muscle: Muscle.biceps),
    MuscleFatigue(muscle: Muscle.triceps),
    MuscleFatigue(muscle: Muscle.forearm),
    MuscleFatigue(muscle: Muscle.obliques),
    MuscleFatigue(muscle: Muscle.trapezius),
    MuscleFatigue(muscle: Muscle.lattisimus),
    MuscleFatigue(muscle: Muscle.teresMajor),
    MuscleFatigue(muscle: Muscle.erectorSpinae),
    MuscleFatigue(muscle: Muscle.adductors),
    MuscleFatigue(muscle: Muscle.abductors),
    MuscleFatigue(muscle: Muscle.glutes),
    MuscleFatigue(muscle: Muscle.quadriceps),
    MuscleFatigue(muscle: Muscle.hamstering),
    MuscleFatigue(muscle: Muscle.calf),
  ];

  void updateMuscleFatiques({
    required MuscleFatigue muscleFatigue,
  }) {
    _muscleFatigues
        .firstWhere((element) => element.muscle == muscleFatigue.muscle)
        .fatigue = muscleFatigue.fatigue;
  }

  List<MuscleFatigue> getFront() {
    final front = List<MuscleFatigue>.of(_muscleFatigues)
      ..removeWhere((element) => element.muscle.pathFront == null);

    return front;
  }

  List<MuscleFatigue> getBack() {
    final back = List<MuscleFatigue>.of(_muscleFatigues)
      ..removeWhere((element) => element.muscle.pathBack == null);

    return back;
  }
}
