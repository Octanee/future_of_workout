import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_storage_workout_api/local_storage_workout_api.dart';
import 'package:rxdart/rxdart.dart';
import 'package:workout_api/workout_api.dart';

/// {@template local_storage_workout_api}
/// Implementation of the [WorkoutApi] that uses local storage.
/// {@endtemplate}
class LocalStorageWorkoutApi extends WorkoutApi {
  /// {@macro local_storage_workout_api}
  LocalStorageWorkoutApi() {
    _init();
  }

  late Box<Workout> _workoutBox;

  final _workoutStreamController =
      BehaviorSubject<List<Workout>>.seeded(const []);

  /// The name used for storing the workout locally.
  ///
  /// This is only exposed for testing
  /// and shouldn't be used for consumers of this library.
  static const kWorkoutBoxName = 'workout_box_name';

  Future<void> _init() async {
    _registerAdapters();

    _workoutBox = await Hive.openBox<Workout>(kWorkoutBoxName);

    _workoutBox.watch().listen((event) {
      _addWorkoutsToStreamController();
    });
  }

  void _addWorkoutsToStreamController() {
    final workouts = _workoutBox.values.toList();
    _workoutStreamController.add(workouts);
  }

  void _registerAdapters() {
    Hive
      ..registerAdapter(WorkoutAdapter())
      ..registerAdapter(WorkoutExerciseAdapter())
      ..registerAdapter(ExerciseSeriesAdapter());
  }

  @override
  Stream<List<Workout>> getWorkouts() =>
      _workoutStreamController.asBroadcastStream();

  @override
  Workout get({required String id}) {
    final workout = _workoutBox.get(id);
    if (workout == null) {
      throw WorkoutNotFoundException();
    }
    return workout;
  }

  @override
  Future<void> deleteWorkout(String id) async {
    _workoutBox;

    //await _workoutBox.delete(id);
  }

  @override
  Future<void> saveWorkout(Workout workout) async =>
      _workoutBox.put(workout.id, workout);
}
