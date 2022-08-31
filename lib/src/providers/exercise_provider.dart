// ignore_for_file: lines_longer_than_80_chars

import '../models/models.dart';

class ExerciseProvider {
  static final List<Exercise> exercises = [
    _barbellBenchPress(),
    _squat(),
    _deadlift()
  ];

  static Exercise _barbellBenchPress() {
    return Exercise(
      id: '1',
      name: 'Barbell bench press',
      primaryMuscle: Muscle.chest,
      body: Body()
        ..updateMusclesFatiques(
          musclesFatigue: [
            MuscleFatigue(muscle: Muscle.chest, fatigue: Fatigue.fatigue85),
            MuscleFatigue(muscle: Muscle.shoulders, fatigue: Fatigue.fatigue55),
            MuscleFatigue(muscle: Muscle.triceps, fatigue: Fatigue.fatigue55),
          ],
        ),
      equipment: [Equipment.barbel, Equipment.flatBench, Equipment.rack],
      imagePathStart:
          'assets/exercises/barbel_bench_press/barbel_bench_press_start.svg',
      imagePathEnd:
          'assets/exercises/barbel_bench_press/barbel_bench_press_end.svg',
      instructions: [
        'Lie on a flat bench',
        'Grip the barbell with both hands',
        'Unrack the barbell and hold the bar directly above your shoulders',
        'Lower the barbell to your chest',
        'Press the barbell back to the starting point',
      ],
    );
  }

  static Exercise _squat() {
    return Exercise(
      id: '2',
      name: 'Squat',
      primaryMuscle: Muscle.quadriceps,
      body: Body()
        ..updateMusclesFatiques(
          musclesFatigue: [
            MuscleFatigue(
                muscle: Muscle.quadriceps, fatigue: Fatigue.fatigue85),
            MuscleFatigue(muscle: Muscle.glutes, fatigue: Fatigue.fatigue55),
            MuscleFatigue(
                muscle: Muscle.hamstering, fatigue: Fatigue.fatigue20),
            MuscleFatigue(muscle: Muscle.calf, fatigue: Fatigue.fatigue20),
          ],
        ),
      equipment: [Equipment.barbel, Equipment.rack],
      imagePathStart: 'assets/exercises/squat/squat_start.svg',
      imagePathEnd: 'assets/exercises/squat/squat_end.svg',
      instructions: [
        'Grip the barbell and stand up to lift it off the rack',
        'Step back with each leg until you are clear of the rack, setting up your footing for the lift',
        'Lower yourself until your thighs are at most parallel to the floor',
        'Raise yourself back up to standing',
        'Step forward to rerack the barbell',
      ],
    );
  }

  static Exercise _deadlift() {
    return Exercise(
      id: '3',
      name: 'Deadlift',
      primaryMuscle: Muscle.quadriceps,
      body: Body()
        ..updateMusclesFatiques(
          musclesFatigue: [
            MuscleFatigue(
                muscle: Muscle.quadriceps, fatigue: Fatigue.fatigue85),
            MuscleFatigue(
                muscle: Muscle.hamstering, fatigue: Fatigue.fatigue70),
            MuscleFatigue(muscle: Muscle.glutes, fatigue: Fatigue.fatigue55),
            MuscleFatigue(muscle: Muscle.calf, fatigue: Fatigue.fatigue20),
            MuscleFatigue(
                muscle: Muscle.erectorSpinae, fatigue: Fatigue.fatigue20),
          ],
        ),
      equipment: [Equipment.barbel],
      imagePathStart: 'assets/exercises/deadlift/deadlift_start.svg',
      imagePathEnd: 'assets/exercises/deadlift/deadlift_end.svg',
      instructions: [
        'Begin with the barbell on the floor',
        'Grip the barbell with a hook or overhand grip',
        'Look straight ahead and take the slack out of the bar',
        'Lift the bar off the floor in a controlled manner',
        'Stand up and lockout',
        'Lower the bar down in a controlled manner',
      ],
    );
  }
}
