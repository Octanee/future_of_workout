import 'package:goal_api/goal_api.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:local_storage_goal_api/src/adapters/goal_adapter.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

/// {@template local_storage_goal_api}
/// Implementation of the [GoalApi] that uses local storage.
///
/// Must be initialized `init()` before use.
/// {@endtemplate}
class LocalStorageGoalApi extends GoalApi {
  /// {@macro local_storage_goal_api}
  LocalStorageGoalApi();

  late Box<Goal> _goalBox;

  final _goalStreamController = BehaviorSubject<List<Goal>>.seeded(const []);

  /// The name used for storing the goal locally.
  ///
  /// This is only exposed for testing
  /// and shouldn't be used for consumers of this library.
  @visibleForTesting
  static const kGoalBoxName = 'goal_box_name';

  /// Initialization function registers adapters and opens exercise [Box]
  Future<void> init() async {
    _registerAdapters();

    _goalBox = await Hive.openBox<Goal>(kGoalBoxName);
  }

  void _registerAdapters() {
    Hive.registerAdapter<Goal>(GoalAdapter());
  }

  void _checkInit() {
    assert(_goalBox.isOpen, 'Local Storage has not been initialized.');
  }

  @override
  Goal get({required String id}) {
    _checkInit();

    final goal = _goalBox.get(id);
    if (goal == null) {
      throw GoalNotFoundException();
    }
    return goal;
  }

  @override
  Stream<List<Goal>> getGoals() {
    _checkInit();

    final goals = _goalBox.values.toList();
    _goalStreamController.add(goals);

    _goalBox.watch().listen((event) {
      final goals = _goalBox.values.toList();
      _goalStreamController.add(goals);
    });

    return _goalStreamController.asBroadcastStream();
  }

  @override
  Future<void> deleteGoal(String id) async {
    _checkInit();
    if (!_goalBox.containsKey(id)) {
      throw GoalNotFoundException();
    }
    await _goalBox.delete(id);
  }

  @override
  Future<void> saveGoal(Goal goal) async {
    _checkInit();
    await _goalBox.put(goal.id, goal);
  }
}
