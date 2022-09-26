import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_storage_workout_log_api/local_storage_workout_log_api.dart';
import 'package:rxdart/rxdart.dart';
import 'package:workout_log_api/workout_log_api.dart';

/// {@template local_storage_workout_log_api}
/// Implementation of the [WorkoutLogApi] that uses local storage.
///
/// Must be initialized `init()` before use.
/// {@endtemplate}
class LocalStorageWorkoutLogApi extends WorkoutLogApi {
  /// {@macro local_storage_workout_log_api}
  LocalStorageWorkoutLogApi();

  /// The nmame used for storing the workout logs locally.
  ///
  /// This is onlu exposed for testing
  /// adn should'n be used for consumers of this library.
  static const kWorkoutLogBoxName = 'workout_log_box_name';

  late Box<WorkoutLog> _workoutLogBox;

  final _workoutLogsStreamController =
      BehaviorSubject<List<WorkoutLog>>.seeded(const []);

  final _workoutLogStreamController = BehaviorSubject<WorkoutLog?>();

  final _currentWorkoutLogStreamController = BehaviorSubject<WorkoutLog?>();

  /// Initialization function registers adapters and opens workout log [Box]
  Future<void> init() async {
    _registerAdapters();

    _workoutLogBox = await Hive.openBox<WorkoutLog>(kWorkoutLogBoxName);
  }

  void _registerAdapters() {
    Hive
      ..registerAdapter(WorkoutLogAdapter())
      ..registerAdapter(WorkoutExerciseLogAdapter())
      ..registerAdapter(ExerciseSeriesLogAdapter());
  }

  void _checkInit() {
    assert(
      _workoutLogBox.isOpen,
      'Local Storage for [WorkoutLog] has not been initialized.',
    );
  }

  @override
  WorkoutLog get({required String id}) {
    _checkInit();

    final log = _workoutLogBox.get(id);
    if (log == null) {
      throw WorkoutLogNotFoundException();
    }
    return log;
  }

  @override
  Stream<WorkoutLog?> getCurrentWorkout() {
    _checkInit();

    try {
      final logs = _workoutLogBox.values.toList();

      final test = logs.any((log) => log.endDate == null);

      if (test) {
        final log = logs.firstWhere((log) => log.endDate == null);
        _currentWorkoutLogStreamController.add(log);

        _workoutLogBox.watch(key: log.id).listen((event) {
          final logs = _workoutLogBox.values.toList();

          final test = logs.any((log) => log.endDate == null);

          if (test) {
            final log = logs.firstWhere((log) => log.endDate == null);
            _currentWorkoutLogStreamController.add(log);
          } else {
            _currentWorkoutLogStreamController.add(null);
          }
        });
      } else {
        _currentWorkoutLogStreamController.add(null);
      }

      return _currentWorkoutLogStreamController.asBroadcastStream();
    } catch (_) {
      throw WorkoutLogNotFoundException();
    }
  }

  @override
  Stream<WorkoutLog?> getWorkout({required String id}) {
    _checkInit();
    final log = _workoutLogBox.get(id);
    _workoutLogStreamController.add(log);

    _workoutLogBox.watch(key: id).listen((event) {
      final log = _workoutLogBox.get(id);
      _workoutLogStreamController.add(log);
    });

    return _workoutLogStreamController.asBroadcastStream();
  }

  @override
  Stream<List<WorkoutLog>> getWorkoutLogs() {
    _checkInit();

    final logs = _workoutLogBox.values.toList();
    _workoutLogsStreamController.add(logs);

    _workoutLogBox.watch().listen((event) {
      final logs = _workoutLogBox.values.toList();
      _workoutLogsStreamController.add(logs);
    });

    return _workoutLogsStreamController.asBroadcastStream();
  }

  @override
  Future<void> saveWorkoutLog({required WorkoutLog workoutLog}) async {
    _checkInit();
    await _workoutLogBox.put(workoutLog.id, workoutLog);
  }

  @override
  Future<void> deleteWorkoutLog({required String id}) async {
    _checkInit();
    if (!_workoutLogBox.containsKey(id)) {
      throw WorkoutLogNotFoundException();
    }
    await _workoutLogBox.delete(id);
  }
}
