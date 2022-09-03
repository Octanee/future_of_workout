import '../../core/extensions/extensions.dart';
import 'models.dart';

class Body {
  const Body({
    this.muscleFatigues = const [
      MuscleFatigue(muscle: Muscle.neck),
      MuscleFatigue(muscle: Muscle.chest),
      MuscleFatigue(muscle: Muscle.serratus),
      MuscleFatigue(muscle: Muscle.shoulders),
      MuscleFatigue(muscle: Muscle.biceps),
      MuscleFatigue(muscle: Muscle.triceps),
      MuscleFatigue(muscle: Muscle.forearm),
      MuscleFatigue(muscle: Muscle.abs),
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
    ],
  });

  final List<MuscleFatigue> muscleFatigues;

  final BodyPosition bodyPosition = BodyPosition.frontUp;

  // void updateMuscleFatiques({
  //   required MuscleFatigue muscleFatigue,
  // }) {
  //   final index = muscleFatigues
  //       .indexWhere((element) => element.muscle == muscleFatigue.muscle);

  //   muscleFatigues[index] = muscleFatigue;
  // }

  // void updateMusclesFatiques({
  //   required List<MuscleFatigue> musclesFatigue,
  // }) {
  //   for (final element in musclesFatigue) {
  //     updateMuscleFatiques(muscleFatigue: element);
  //   }
  // }
}
