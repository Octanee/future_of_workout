import 'enums/enum.dart';

class MuscleFatigue {
  const MuscleFatigue({
    required this.muscle,
    this.fatigue = Fatigue.fatigue0,
  });

  final Muscle muscle;
  final Fatigue fatigue;

  MuscleFatigue copyWith({
    Muscle? muscle,
    Fatigue? fatigue,
  }) {
    return MuscleFatigue(
      muscle: muscle ?? this.muscle,
      fatigue: fatigue ?? this.fatigue,
    );
  }
}
