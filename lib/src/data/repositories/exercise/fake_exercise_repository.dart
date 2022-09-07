import '../../../data/models/exercise.dart';
import '../../../data/providers/exercise_provider.dart';
import 'base_exercise_repository.dart';

class FakeExerciseRepository extends BaseExerciseRepository {
  List<Exercise> _exercises = [];

  @override
  Future<void> fetchAll() async {
    await Future.delayed(const Duration(seconds: 1), () {
      _exercises = ExerciseProvider.exercises;
    });

    addToStream(exerises: _exercises);
  }

  @override
  Future<Exercise> getById({required String id}) async {
    if (_exercises.isEmpty) {
      await fetchAll();
    }

    try {
      return _exercises.firstWhere((element) => element.id == id);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Exercise> getByName({required String name}) async {
    if (_exercises.isEmpty) {
      await fetchAll();
    }

    try {
      return _exercises.firstWhere((element) => element.name == name);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
