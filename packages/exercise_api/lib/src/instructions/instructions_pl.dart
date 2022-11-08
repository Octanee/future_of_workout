part of 'instructions.dart';

/// The translations for Polish (`pl`).
class InstructionsPl extends Instructions {
  @override
  List<String> get _benchPress => [
        'Połóż się na ławce płaskiej',
        'Chwyć sztangę obiema rękami',
        'Zdejmij sztangę ze stojaka i trzymaj ją bezpośrednio na barkami',
        'Powoli opuść sztangę do klatki piersiowej',
        'Wyciśnij sztangę z powrotem do punktu startowego',
      ];

  @override
  List<String> get _deadlift => [
        '_deadlift 1 PL',
        '_deadlift 2 PL',
        '_deadlift 3 PL',
        '_deadlift 4 PL',
        '_deadlift 5 PL',
      ];

  @override
  List<String> get _squat => [
        '_squat 1 PL',
        '_squat 2 PL',
        '_squat 3 PL',
        '_squat 4 PL',
        '_squat 5 PL',
      ];
}
