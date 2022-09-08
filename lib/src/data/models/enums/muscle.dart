import 'package:future_of_workout/src/core/extensions/extensions.dart';

enum Muscle {
  neck(
    name: '',
    pathFront: 'assets/body/front/neck.svg',
    pathBack: 'assets/body/back/neck.svg',
  ),

  chest(
    name: '',
    pathFront: 'assets/body/front/chest.svg',
  ),
  serratus(
    name: '',
    pathFront: 'assets/body/front/serratus.svg',
  ),

  shoulders(
    name: '',
    pathFront: 'assets/body/front/shoulders.svg',
    pathBack: 'assets/body/back/shoulders.svg',
  ),
  biceps(
    name: '',
    pathFront: 'assets/body/front/biceps.svg',
  ),
  triceps(
    name: '',
    pathBack: 'assets/body/back/triceps.svg',
  ),
  forearm(
    name: '',
    pathFront: 'assets/body/front/forearm.svg',
    pathBack: 'assets/body/back/forearm.svg',
  ),

  abs(
    name: '',
    pathFront: 'assets/body/front/abs.svg',
  ),
  obliques(
    name: '',
    pathFront: 'assets/body/front/obliques.svg',
    pathBack: 'assets/body/back/obliques.svg',
  ),

  trapezius(
    name: '',
    pathFront: 'assets/body/front/trapezius.svg',
    pathBack: 'assets/body/back/trapezius.svg',
  ),
  lattisimus(
    name: '',
    pathBack: 'assets/body/back/latisimus.svg',
  ),
  teresMajor(
    name: '',
    pathBack: 'assets/body/back/teres_major.svg',
  ),
  erectorSpinae(
    name: '',
    pathBack: 'assets/body/back/erector_spinae.svg',
  ),

  adductors(
    name: '',
    pathFront: 'assets/body/front/adductors.svg',
    pathBack: 'assets/body/back/adductors.svg',
  ),
  abductors(
    name: '',
    pathFront: 'assets/body/front/abductors.svg',
    pathBack: 'assets/body/back/abductors.svg',
  ),
  glutes(
    name: '',
    pathBack: 'assets/body/back/glutes.svg',
  ),
  quadriceps(
    name: '',
    pathFront: 'assets/body/front/quadriceps.svg',
  ),
  hamstering(
    name: '',
    pathBack: 'assets/body/back/hamstering.svg',
  ),
  calf(
    name: '',
    pathFront: 'assets/body/front/calf.svg',
    pathBack: 'assets/body/back/calf.svg',
  );

  const Muscle({
    required this.name,
    this.pathFront,
    this.pathBack,
  });

  final String name;
  final String? pathFront;
  final String? pathBack;

  static Muscle random() {
    return Muscle.values.random();
  }
}
