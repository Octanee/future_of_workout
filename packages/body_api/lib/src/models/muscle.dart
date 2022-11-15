/// {@template muscle}
/// List of body muscles.
///
/// Contains a [name], [imagePathFront] and [imagePathBack].
/// {@endtemplate}
enum Muscle {
  /// Neck
  neck(
    imagePathFront: 'assets/body/front/neck.svg',
    imagePathBack: 'assets/body/back/neck.svg',
  ),

  /// Chest
  chest(
    imagePathFront: 'assets/body/front/chest.svg',
    maximumRecoverableVolume: 22,
  ),

  /// Serratus
  serratus(
    imagePathFront: 'assets/body/front/serratus.svg',
  ),

  /// Front Shoulders
  frontShoulders(
    imagePathFront: 'assets/body/front/front_shoulders.svg',
    maximumRecoverableVolume: 26,
  ),

  /// Mid Shoulders
  midShoulders(
    imagePathFront: 'assets/body/front/mid_shoulders.svg',
    imagePathBack: 'assets/body/back/mid_shoulders.svg',
    maximumRecoverableVolume: 22,
  ),

  /// Back Shoulders
  backShoulders(
    imagePathBack: 'assets/body/back/back_shoulders.svg',
    maximumRecoverableVolume: 16,
  ),

  /// Biceps
  biceps(
    imagePathFront: 'assets/body/front/biceps.svg',
    maximumRecoverableVolume: 26,
  ),

  /// Triceps
  triceps(
    imagePathFront: 'assets/body/front/triceps.svg',
    imagePathBack: 'assets/body/back/triceps.svg',
    maximumRecoverableVolume: 18,
  ),

  /// Forearm
  forearm(
    imagePathFront: 'assets/body/front/forearm.svg',
    imagePathBack: 'assets/body/back/forearm.svg',
  ),

  /// Abs
  abs(
    imagePathFront: 'assets/body/front/abs.svg',
    maximumRecoverableVolume: 25,
  ),

  /// Obliques
  obliques(
    imagePathFront: 'assets/body/front/obliques.svg',
    imagePathBack: 'assets/body/back/obliques.svg',
  ),

  /// Trapezius
  trapezius(
    imagePathFront: 'assets/body/front/trapezius.svg',
    imagePathBack: 'assets/body/back/trapezius.svg',
    maximumRecoverableVolume: 26,
  ),

  /// Lattisimus
  lattisimus(
    imagePathBack: 'assets/body/back/latisimus.svg',
    maximumRecoverableVolume: 22,
  ),

  /// Teres Major
  teresMajor(
    imagePathBack: 'assets/body/back/teres_major.svg',
  ),

  /// Erector spinae
  erectorSpinae(
    imagePathBack: 'assets/body/back/erector_spinae.svg',
  ),

  /// Adductors
  adductors(
    imagePathFront: 'assets/body/front/adductors.svg',
    imagePathBack: 'assets/body/back/adductors.svg',
  ),

  /// Abductors
  abductors(
    imagePathFront: 'assets/body/front/abductors.svg',
    imagePathBack: 'assets/body/back/abductors.svg',
  ),

  /// Glutes
  glutes(
    imagePathBack: 'assets/body/back/glutes.svg',
    maximumRecoverableVolume: 16,
  ),

  /// Quadriceps
  quadriceps(
    imagePathFront: 'assets/body/front/quadriceps.svg',
    maximumRecoverableVolume: 20,
  ),

  /// Hamstering
  hamstering(
    imagePathBack: 'assets/body/back/hamstering.svg',
    maximumRecoverableVolume: 20,
  ),

  /// Calf
  calf(
    imagePathFront: 'assets/body/front/calf.svg',
    imagePathBack: 'assets/body/back/calf.svg',
    maximumRecoverableVolume: 18,
  );

  /// {@macro muscle}
  const Muscle({
    //   required this.name,
    this.maximumRecoverableVolume = 10,
    this.imagePathFront,
    this.imagePathBack,
  });

  // /// The name of the Muscle
  // ///
  // /// Cannot be empty.
  // final String name;

  /// Path to SVG from assets,
  /// showing the muscle appearance from the
  /// `front` of the body.
  final String? imagePathFront;

  /// Path to SVG from assets,
  /// showing the muscle appearance from the
  /// `back` of the body.
  final String? imagePathBack;

  /// Value of Maximum Recoverable Volume.
  final int maximumRecoverableVolume;
}
