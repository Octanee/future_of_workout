import 'dart:async';
import 'dart:developer';

import 'package:exercise_api/exercise_api.dart';
import 'package:exercise_repository/exercise_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/app/app.dart';
import 'package:future_of_workout/src/app/app_bloc_observer.dart';
import 'package:future_of_workout/src/shared/logger.dart';
import 'package:goal_api/goal_api.dart';
import 'package:goal_repository/goal_repository.dart';
import 'package:measurement_repository/measurement_repository.dart';
import 'package:user_repository/user_repository.dart';
import 'package:workout_api/workout_api.dart';
import 'package:workout_log_api/workout_log_api.dart';
import 'package:workout_log_repository/workout_log_repository.dart';
import 'package:workout_repository/workout_repository.dart';

void bootstrap({
  required WorkoutApi workoutApi,
  required ExerciseApi exerciseApi,
  required WorkoutLogApi workoutLogApi,
  required GoalApi goalApi,
  required MeasurementApi measurementApi,
  required UserApi userApi,
}) {
  FlutterError.onError =
      (details) => log(details.exceptionAsString(), stackTrace: details.stack);

  Bloc.observer = AppBlocObserver();

  final exerciseRepository = ExerciseRepository(exerciseApi: exerciseApi);
  final workoutRepository = WorkoutRepository(workoutApi: workoutApi);
  final workoutLogRepository =
      WorkoutLogRepository(workoutLogApi: workoutLogApi);
  final goalRepository = GoalRepository(goalApi: goalApi);
  final measurementRepository =
      MeasurementRepository(measurementApi: measurementApi);
  final userRepository = UserRepository(userApi: userApi);

  runZonedGuarded(
    () => runApp(
      FutureOfWorkoutApp(
        exerciseRepository: exerciseRepository,
        workoutRepository: workoutRepository,
        workoutLogRepository: workoutLogRepository,
        goalRepository: goalRepository,
        measurementRepository: measurementRepository,
        userRepository: userRepository,
      ),
    ),
    (error, stack) => logger.e(error.toString(), error, stack),
  );
}
