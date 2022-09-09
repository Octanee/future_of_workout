import 'package:exercise_api/exercise_api.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:local_storage_exercise_api/local_storage_exercise_api.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

/// {@template local_storage_exercise_api}
/// Implementation of the [ExerciseApi] that uses local storage.
/// {@endtemplate}
class LocalStorageExerciseApi extends ExerciseApi {
  /// {@macro local_storage_exercise_api}
  LocalStorageExerciseApi() {
    _init();
  }

  late Box<Exercise> _exerciseBox;

  final _exercisesStreamController =
      BehaviorSubject<List<Exercise>>.seeded(const []);

  /// The name used for storing the exercises locally.
  ///
  /// This is only exposed for testing
  /// and shouldn't be used for consumers of this library.
  @visibleForTesting
  static const kExercisesBoxName = 'exercises_box_name';

  Future<void> _init() async {
    _registerAdapters();

    _exerciseBox = await Hive.openBox<Exercise>(kExercisesBoxName);

    _exerciseBox.watch().listen((event) {
      _addExercisesToStreamController();
    });
  }

  void _registerAdapters() {
    Hive
      ..registerAdapter<Muscle>(MuscleAdapter())
      ..registerAdapter<Exercise>(ExerciseAdapter());
  }

  void _addExercisesToStreamController() {
    var exercises = _exerciseBox.values.toList();
    if (exercises.isEmpty) {
      _populateBox();
      exercises = DefaultExerciseProvider.defaultExercises;
    }

    _exercisesStreamController.add(exercises);
  }

  void _populateBox() {
    final defaultExercises = DefaultExerciseProvider.defaultExercises;
    final entries = <String, Exercise>{
      for (final exercise in defaultExercises) exercise.id: exercise,
    };
    _exerciseBox.putAll(entries);
  }

  @override
  Stream<List<Exercise>> getExercises() =>
      _exercisesStreamController.asBroadcastStream();

  @override
  Exercise get({required String id}) {
    final exercise = _exerciseBox.get(id);
    if (exercise == null) {
      throw ExerciseNotFoundException();
    }
    return exercise;
  }
}
