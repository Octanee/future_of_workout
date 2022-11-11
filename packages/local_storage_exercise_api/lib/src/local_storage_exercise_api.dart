import 'package:exercise_api/exercise_api.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:local_storage_exercise_api/local_storage_exercise_api.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

/// {@template local_storage_exercise_api}
/// Implementation of the [ExerciseApi] that uses local storage.
///
/// Must be initialized `init()` before use.
/// {@endtemplate}
class LocalStorageExerciseApi extends ExerciseApi {
  /// {@macro local_storage_exercise_api}
  LocalStorageExerciseApi();

  late Box<Exercise> _exerciseBox;

  final _exercisesStreamController =
      BehaviorSubject<List<Exercise>>.seeded(const []);

  /// The name used for storing the exercises locally.
  ///
  /// This is only exposed for testing
  /// and shouldn't be used for consumers of this library.
  @visibleForTesting
  static const kExercisesBoxName = 'exercises_box_name';

  /// Initialization function registers adapters and opens exercise [Box]
  Future<void> init() async {
    _registerAdapters();

    _exerciseBox = await Hive.openBox<Exercise>(kExercisesBoxName);

    final exercises = _exerciseBox.values.toList();
    _exercisesStreamController.add(exercises);

    _exerciseBox.watch().listen((event) {
      final exercises = _exerciseBox.values.toList();
      _exercisesStreamController.add(exercises);
    });
  }

  void _registerAdapters() {
    Hive
      ..registerAdapter<Muscle>(MuscleAdapter())
      ..registerAdapter<MuscleInvolvement>(MuscleInvolvementAdapter())
      ..registerAdapter<Equipment>(EquipmentAdapter())
      ..registerAdapter<Exercise>(ExerciseAdapter());
  }

  void _checkInit() {
    assert(_exerciseBox.isOpen, 'Local Storage has not been initialized.');
  }

  @override
  Stream<List<Exercise>> getExercises() {
    _checkInit();
    return _exercisesStreamController.asBroadcastStream();
  }

  @override
  Exercise get({required String id}) {
    _checkInit();
    final exercise = _exerciseBox.get(id);
    if (exercise == null) {
      throw ExerciseNotFoundException();
    }
    return exercise;
  }
}
