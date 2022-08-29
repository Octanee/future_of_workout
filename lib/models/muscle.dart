enum Muscle {
  neck(
    pathFront: 'assets/body/front/neck.svg',
    pathBack: 'assets/body/back/neck.svg',
  ),

  chest(pathFront: 'assets/body/front/chest.svg'),
  serratus(pathFront: 'assets/body/front/serratus.svg'),

  shoulders(
    pathFront: 'assets/body/front/shoulders.svg',
    pathBack: 'assets/body/back/shoulders.svg',
  ),
  biceps(pathFront: 'assets/body/front/biceps.svg'),
  triceps(pathBack: 'assets/body/back/triceps.svg'),
  forearm(
    pathFront: 'assets/body/front/forearm.svg',
    pathBack: 'assets/body/back/forearm.svg',
  ),

  abs(pathFront: 'assets/body/front/abs.svg'),
  obliques(
    pathFront: 'assets/body/front/obliques.svg',
    pathBack: 'assets/body/back/obliques.svg',
  ),

  trapezius(
    pathFront: 'assets/body/front/trapezius.svg',
    pathBack: 'assets/body/back/trapezius.svg',
  ),
  lattisimus(pathBack: 'assets/body/back/latisimus.svg'),
  teresMajor(pathBack: 'assets/body/back/teres_major.svg'),
  erectorSpinae(pathBack: 'assets/body/back/erector_spinae.svg'),

  adductors(
    pathFront: 'assets/body/front/adductors.svg',
    pathBack: 'assets/body/back/adductors.svg',
  ),
  abductors(
    pathFront: 'assets/body/front/abductors.svg',
    pathBack: 'assets/body/back/abductors.svg',
  ),
  glutes(pathBack: 'assets/body/back/glutes.svg'),
  quadriceps(pathFront: 'assets/body/front/quadriceps.svg'),
  hamstering(pathBack: 'assets/body/back/hamstering.svg'),
  calf(
    pathFront: 'assets/body/front/calf.svg',
    pathBack: 'assets/body/back/calf.svg',
  );

  const Muscle({this.pathFront, this.pathBack});

  final String? pathFront;
  final String? pathBack;
}
