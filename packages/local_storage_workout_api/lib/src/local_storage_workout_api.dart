import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_storage_workout_api/local_storage_workout_api.dart';
import 'package:rxdart/rxdart.dart';
import 'package:workout_api/workout_api.dart';

/// {@template local_storage_workout_api}
/// Implementation of the [WorkoutApi] that uses local storage.
///
/// Must be initialized `init()` before use.
/// {@endtemplate}
class LocalStorageWorkoutApi extends WorkoutApi {
  /// {@macro local_storage_workout_api}
  LocalStorageWorkoutApi();

  // late Box<Workout> _workoutBox;
  late Box<Plan> _planBox;

  final _plansStreamController = BehaviorSubject<List<Plan>>.seeded(const []);

  final _planStreamController = BehaviorSubject<Plan?>();

  /// The name used for storing the plan locally.
  ///
  /// This is only exposed for testing
  /// and shouldn't be used for consumers of this library.
  static const kPlanBoxName = 'plan_box_name';

  /// Initialization function registers adapters and opens workout [Box]
  Future<void> init() async {
    _registerAdapters();

    _planBox = await Hive.openBox<Plan>(kPlanBoxName);
    // _workoutBox = await Hive.openBox<Workout>(kWorkoutBoxName);
  }

  void _registerAdapters() {
    Hive
      ..registerAdapter(PlanAdapter())
      ..registerAdapter(WorkoutAdapter())
      ..registerAdapter(WorkoutExerciseAdapter())
      ..registerAdapter(SeriesIntensityAdapter())
      ..registerAdapter(ExerciseSeriesAdapter());
  }

  void _checkInit() {
    // assert(
    //   _workoutBox.isOpen,
    //   'Local Storage of workouts has not been initialized.',
    // );
    assert(_planBox.isOpen, 'Local Storage of plans has not been initialized.');
  }

  @override
  Future<void> deletePlan(String id) async {
    _checkInit();

    if (!_planBox.containsKey(id)) {
      throw PlanNotFoundException();
    }

    await _planBox.delete(id);
  }

  @override
  Plan getPlan({required String id}) {
    _checkInit();

    final plan = _planBox.get(id);
    if (plan == null) {
      throw PlanNotFoundException();
    }
    return plan;
  }

  @override
  Stream<List<Plan>> getPlans() {
    _checkInit();

    final plans = _planBox.values.toList();
    _plansStreamController.add(plans);

    _planBox.watch().listen((_) {
      final plans = _planBox.values.toList();
      _plansStreamController.add(plans);
    });

    return _plansStreamController.asBroadcastStream();
  }

  @override
  Future<void> savePlan(Plan plan) async {
    _checkInit();

    await _planBox.put(plan.id, plan);
  }

  @override
  Stream<Plan?> getPlanStream({required String id}) {
    _checkInit();
    final plan = _planBox.get(id);
    _planStreamController.add(plan);

    _planBox.watch().listen((_) {
      final plan = _planBox.get(id);
      _planStreamController.add(plan);
    });

    return _planStreamController.asBroadcastStream();
  }
}
