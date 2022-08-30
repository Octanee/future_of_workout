import 'package:future_of_workout/models/fatigue.dart';
import 'package:future_of_workout/models/muscle.dart';

class Body {
  final Map<Muscle, Fatigue> _bodyFatigue = {
    Muscle.neck: Fatigue.fatigue0,
    Muscle.chest: Fatigue.fatigue0,
    Muscle.serratus: Fatigue.fatigue0,
    Muscle.shoulders: Fatigue.fatigue0,
    Muscle.biceps: Fatigue.fatigue0,
    Muscle.triceps: Fatigue.fatigue0,
    Muscle.forearm: Fatigue.fatigue0,
    Muscle.abs: Fatigue.fatigue0,
    Muscle.obliques: Fatigue.fatigue0,
    Muscle.trapezius: Fatigue.fatigue0,
    Muscle.lattisimus: Fatigue.fatigue0,
    Muscle.teresMajor: Fatigue.fatigue0,
    Muscle.erectorSpinae: Fatigue.fatigue0,
    Muscle.adductors: Fatigue.fatigue0,
    Muscle.abductors: Fatigue.fatigue0,
    Muscle.glutes: Fatigue.fatigue0,
    Muscle.quadriceps: Fatigue.fatigue0,
    Muscle.hamstering: Fatigue.fatigue0,
    Muscle.calf: Fatigue.fatigue0,
  };

  void updateMuscleFatique({required Muscle muscle, required Fatigue fatigue}) {
    _bodyFatigue.update(muscle, (value) => fatigue);
  }

  void updateMusclesFatique({required Map<Muscle, Fatigue> updates}) {
    for (var element in updates.entries) {
      _bodyFatigue.update(element.key, (value) => element.value);
    }
  }

  Map<Muscle, Fatigue> getFront() {
    final front = Map<Muscle, Fatigue>.of(_bodyFatigue)
      ..removeWhere((key, value) => key.pathFront == null);

    return front;
  }

  Map<Muscle, Fatigue> getBack() {
    final back = Map<Muscle, Fatigue>.of(_bodyFatigue)
      ..removeWhere((key, value) => key.pathBack == null);

    return back;
  }
}
