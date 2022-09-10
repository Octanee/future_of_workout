import 'dart:async';
import 'dart:developer';

import 'package:exercise_api/exercise_api.dart';
import 'package:exercise_repository/exercise_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/app/app.dart';
import 'package:future_of_workout/src/app/app_bloc_observer.dart';
import 'package:workout_api/workout_api.dart';
import 'package:workout_repository/workout_repository.dart';

void bootstrap({
  required WorkoutApi workoutApi,
  required ExerciseApi exerciseApi,
}) {
  FlutterError.onError =
      (details) => log(details.exceptionAsString(), stackTrace: details.stack);

  Bloc.observer = AppBlocObserver();

  final exerciseRepository = ExerciseRepository(exerciseApi: exerciseApi);
  final workoutRepository = WorkoutRepository(workoutApi: workoutApi);

  runZonedGuarded(
    () => runApp(
      FutureOfWorkoutApp(
        exerciseRepository: exerciseRepository,
        workoutRepository: workoutRepository,
      ),
    ),
    (error, stack) => log(error.toString(), stackTrace: stack),
  );
}
