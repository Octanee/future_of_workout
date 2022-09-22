import 'package:flutter/material.dart';
import 'package:future_of_workout/bootstrap.dart';
import 'package:local_storage_exercise_api/local_storage_exercise_api.dart';
import 'package:local_storage_workout_api/local_storage_workout_api.dart';
import 'package:local_storage_workout_log_api/local_storage_workout_log_api.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  final exerciseApi = LocalStorageExerciseApi();
  await exerciseApi.init();

  final workoutApi = LocalStorageWorkoutApi();
  await workoutApi.init();

  final workoutLogApi = LocalStorageWorkoutLogApi();
  await workoutLogApi.init();

  bootstrap(
    workoutApi: workoutApi,
    exerciseApi: exerciseApi,
    workoutLogApi: workoutLogApi,
  );
}
