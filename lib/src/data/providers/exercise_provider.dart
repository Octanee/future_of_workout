// ignore_for_file: lines_longer_than_80_chars

import '../models/models.dart';

class ExerciseProvider {
  static final List<Exercise> exercises = [
    _barbellBenchPress(),
    _squat(),
    _deadlift()
  ];

  static Exercise _barbellBenchPress() {
    const String id = '1';
    return Exercise(
      id: id,
      base: ExerciseBase(
        id: id,
        name: 'Barbell bench press',
        primaryMuscle: Muscle.chest,
        body: const Body()
          ..updateMusclesFatiques(
            musclesFatigue: [
              const MuscleFatigue(
                muscle: Muscle.chest,
                fatigue: Fatigue.fatigue85,
              ),
              const MuscleFatigue(
                muscle: Muscle.shoulders,
                fatigue: Fatigue.fatigue55,
              ),
              const MuscleFatigue(
                muscle: Muscle.triceps,
                fatigue: Fatigue.fatigue55,
              ),
            ],
          ),
        imagePathStart:
            'assets/exercises/barbel_bench_press/barbel_bench_press_start.svg',
        imagePathEnd:
            'assets/exercises/barbel_bench_press/barbel_bench_press_end.svg',
      ),
      details: const ExerciseDetails(
        id: id,
        equipment: [Equipment.barbel, Equipment.flatBench, Equipment.rack],
        instructions: [
          'Lie on a flat bench',
          'Grip the barbell with both hands',
          'Unrack the barbell and hold the bar directly above your shoulders',
          'Lower the barbell to your chest',
          'Press the barbell back to the starting point',
        ],
      ),
    );
  }

  static Exercise _squat() {
    const String id = '2';
    return Exercise(
      id: id,
      base: ExerciseBase(
        id: id,
        name: 'Squat',
        primaryMuscle: Muscle.quadriceps,
        body: const Body()
          ..updateMusclesFatiques(
            musclesFatigue: [
              const MuscleFatigue(
                muscle: Muscle.quadriceps,
                fatigue: Fatigue.fatigue85,
              ),
              const MuscleFatigue(
                muscle: Muscle.glutes,
                fatigue: Fatigue.fatigue55,
              ),
              const MuscleFatigue(
                muscle: Muscle.hamstering,
                fatigue: Fatigue.fatigue20,
              ),
              const MuscleFatigue(
                muscle: Muscle.calf,
                fatigue: Fatigue.fatigue20,
              ),
            ],
          ),
        imagePathEnd: 'assets/exercises/squat/squat_end.svg',
        imagePathStart: 'assets/exercises/squat/squat_start.svg',
      ),
      details: const ExerciseDetails(
        id: id,
        equipment: [Equipment.barbel, Equipment.rack],
        instructions: [
          'Grip the barbell and stand up to lift it off the rack',
          'Step back with each leg until you are clear of the rack, setting up your footing for the lift',
          'Lower yourself until your thighs are at most parallel to the floor',
          'Raise yourself back up to standing',
          'Step forward to rerack the barbell',
        ],
      ),
    );
  }

  static Exercise _deadlift() {
    const String id = '3';
    return Exercise(
      id: id,
      base: ExerciseBase(
        id: id,
        name: 'Deadlift',
        primaryMuscle: Muscle.quadriceps,
        body: const Body()
          ..updateMusclesFatiques(
            musclesFatigue: [
              const MuscleFatigue(
                muscle: Muscle.quadriceps,
                fatigue: Fatigue.fatigue85,
              ),
              const MuscleFatigue(
                muscle: Muscle.hamstering,
                fatigue: Fatigue.fatigue70,
              ),
              const MuscleFatigue(
                muscle: Muscle.glutes,
                fatigue: Fatigue.fatigue55,
              ),
              const MuscleFatigue(
                muscle: Muscle.calf,
                fatigue: Fatigue.fatigue20,
              ),
              const MuscleFatigue(
                muscle: Muscle.erectorSpinae,
                fatigue: Fatigue.fatigue20,
              ),
            ],
          ),
        imagePathStart: 'assets/exercises/deadlift/deadlift_start.svg',
        imagePathEnd: 'assets/exercises/deadlift/deadlift_end.svg',
      ),
      details: const ExerciseDetails(
        id: id,
        equipment: [Equipment.barbel],
        instructions: [
          'Begin with the barbell on the floor',
          'Grip the barbell with a hook or overhand grip',
          'Look straight ahead and take the slack out of the bar',
          'Lift the bar off the floor in a controlled manner',
          'Stand up and lockout',
          'Lower the bar down in a controlled manner',
        ],
      ),
    );
  }
}
