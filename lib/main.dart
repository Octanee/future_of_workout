import 'package:flutter/material.dart';
import 'package:local_storage_exercise_api/local_storage_exercise_api.dart';
import 'package:local_storage_workout_api/local_storage_workout_api.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  final exerciseApi = LocalStorageExerciseApi();
  await exerciseApi.init();

  final workoutApi = LocalStorageWorkoutApi();
  await workoutApi.init();
}
