import 'dart:developer';

import 'package:future_of_workout/models/fatigue.dart';
import 'package:future_of_workout/models/muscle.dart';

class Body {
  final Map<Muscle, Fatigue> _bodyFatigue = {
    Muscle.neck: Fatigue.fatigue0,
    Muscle.chest: Fatigue.fatigue55,
    Muscle.serratus: Fatigue.fatigue20,
    Muscle.shoulders: Fatigue.fatigue100,
    Muscle.biceps: Fatigue.fatigue55,
    Muscle.triceps: Fatigue.fatigue85,
    Muscle.forearm: Fatigue.fatigue40,
    Muscle.abs: Fatigue.fatigue20,
    Muscle.obliques: Fatigue.fatigue0,
    Muscle.trapezius: Fatigue.fatigue55,
    Muscle.lattisimus: Fatigue.fatigue55,
    Muscle.teresMajor: Fatigue.fatigue20,
    Muscle.erectorSpinae: Fatigue.fatigue20,
    Muscle.adductors: Fatigue.fatigue0,
    Muscle.abductors: Fatigue.fatigue0,
    Muscle.glutes: Fatigue.fatigue20,
    Muscle.quadriceps: Fatigue.fatigue85,
    Muscle.hamstering: Fatigue.fatigue55,
    Muscle.calf: Fatigue.fatigue20,
  };

  void updateMuscleFatique({required Muscle muscle, required Fatigue fatigue}) {
    _bodyFatigue.update(muscle, (value) => fatigue);
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
