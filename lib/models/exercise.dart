import 'models.dart';

class Exercise {
  final int id;

  final String name;

  final String imagePathStart;
  final String imagePathEnd;

  final List<String> instructions;

  final Muscle primaryMuscle;
  final Body body;

  final List<Equipment> equipment;

  Exercise({
    required this.id,
    required this.name,
    required this.primaryMuscle,
    required this.body,
    this.imagePathStart = 'assets/exercises/default.svg',
    this.imagePathEnd = 'assets/exercises/default.svg',
    this.instructions = const [],
    this.equipment = const [],
  });
}
