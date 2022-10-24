import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_of_workout/bootstrap.dart';
import 'package:local_storage_exercise_api/local_storage_exercise_api.dart';
import 'package:local_storage_goal_api/local_storage_goal_api.dart';
import 'package:local_storage_measurement_api/local_storage_measurement_api.dart';
import 'package:local_storage_user_api/local_storage_user_api.dart';
import 'package:local_storage_workout_api/local_storage_workout_api.dart';
import 'package:local_storage_workout_log_api/local_storage_workout_log_api.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  await Hive.initFlutter();

  final exerciseApi = LocalStorageExerciseApi();
  await exerciseApi.init();

  final workoutApi = LocalStorageWorkoutApi();
  await workoutApi.init();

  final workoutLogApi = LocalStorageWorkoutLogApi();
  await workoutLogApi.init();

  final goalApi = LocalStorageGoalApi();
  await goalApi.init();

  final measurementApi = LocalStorageMeasurementApi();
  await measurementApi.init();

  final userApi = LocalStorageUserApi();
  await userApi.init();

  bootstrap(
    workoutApi: workoutApi,
    exerciseApi: exerciseApi,
    workoutLogApi: workoutLogApi,
    goalApi: goalApi,
    measurementApi: measurementApi,
    userApi: userApi,
  );
}
