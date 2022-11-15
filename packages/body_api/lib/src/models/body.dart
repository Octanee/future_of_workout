import 'package:body_api/body_api.dart';
import 'package:equatable/equatable.dart';

/// {@template body}
///
/// {@endtemplate}
class Body extends Equatable {
  ///{@macro body}
  Body({
    int neckInvolvement = 0,
    int chestInvolvement = 0,
    int serratusInvolvement = 0,
    int frontShouldersInvolvement = 0,
    int midShouldersInvolvement = 0,
    int backShouldersInvolvement = 0,
    int bicepsInvolvement = 0,
    int tricepsInvolvement = 0,
    int forearmInvolvement = 0,
    int absInvolvement = 0,
    int obliquesInvolvement = 0,
    int trapeziusInvolvement = 0,
    int lattisimusInvolvement = 0,
    int teresMajorInvolvement = 0,
    int erectorSpinaeInvolvement = 0,
    int adductorsInvolvement = 0,
    int abductorsInvolvement = 0,
    int glutesInvolvement = 0,
    int hamsteringInvolvement = 0,
    int quadricepsInvolvement = 0,
    int calfInvolvement = 0,
  }) : _muscles = {
          Muscle.neck: neckInvolvement,
          Muscle.chest: chestInvolvement,
          Muscle.serratus: serratusInvolvement,
          Muscle.frontShoulders: frontShouldersInvolvement,
          Muscle.midShoulders: midShouldersInvolvement,
          Muscle.backShoulders: backShouldersInvolvement,
          Muscle.biceps: bicepsInvolvement,
          Muscle.triceps: tricepsInvolvement,
          Muscle.forearm: forearmInvolvement,
          Muscle.abs: absInvolvement,
          Muscle.obliques: obliquesInvolvement,
          Muscle.trapezius: trapeziusInvolvement,
          Muscle.lattisimus: lattisimusInvolvement,
          Muscle.teresMajor: teresMajorInvolvement,
          Muscle.erectorSpinae: erectorSpinaeInvolvement,
          Muscle.adductors: adductorsInvolvement,
          Muscle.abductors: abductorsInvolvement,
          Muscle.glutes: glutesInvolvement,
          Muscle.hamstering: hamsteringInvolvement,
          Muscle.quadriceps: quadricepsInvolvement,
          Muscle.calf: calfInvolvement,
        } {
    position = BodyPositionCalculator.calculate(_muscles);
  }

  /// Map of Muscles and involvement value.
  ///
  /// The Value should be between `0` and `100`.
  final Map<Muscle, int> _muscles;

  /// Body position with most muscles involved.
  late final BodyPosition position;

  /// Return value of muscle involvemnt.
  int involvement({required Muscle muscle}) => _muscles[muscle] ?? 0;

  /// Copy instance with given values.
  ///
  /// {@macro body}
  Body copyWith({
    int Function()? neckInvolvement,
    int Function()? chestInvolvement,
    int Function()? serratusInvolvement,
    int Function()? frontShouldersInvolvement,
    int Function()? midShouldersInvolvement,
    int Function()? backShouldersInvolvement,
    int Function()? bicepsInvolvement,
    int Function()? tricepsInvolvement,
    int Function()? forearmInvolvement,
    int Function()? absInvolvement,
    int Function()? obliquesInvolvement,
    int Function()? trapeziusInvolvement,
    int Function()? lattisimusInvolvement,
    int Function()? teresMajorInvolvement,
    int Function()? erectorSpinaeInvolvement,
    int Function()? adductorsInvolvement,
    int Function()? abductorsInvolvement,
    int Function()? glutesInvolvement,
    int Function()? hamsteringInvolvement,
    int Function()? quadricepsInvolvement,
    int Function()? calfInvolvement,
  }) {
    return Body(
      neckInvolvement: neckInvolvement != null
          ? neckInvolvement()
          : involvement(muscle: Muscle.neck),
      chestInvolvement: chestInvolvement != null
          ? chestInvolvement()
          : involvement(muscle: Muscle.chest),
      serratusInvolvement: serratusInvolvement != null
          ? serratusInvolvement()
          : involvement(muscle: Muscle.serratus),
      frontShouldersInvolvement: frontShouldersInvolvement != null
          ? frontShouldersInvolvement()
          : involvement(muscle: Muscle.frontShoulders),
      midShouldersInvolvement: midShouldersInvolvement != null
          ? midShouldersInvolvement()
          : involvement(muscle: Muscle.midShoulders),
      backShouldersInvolvement: backShouldersInvolvement != null
          ? backShouldersInvolvement()
          : involvement(muscle: Muscle.backShoulders),
      bicepsInvolvement: bicepsInvolvement != null
          ? bicepsInvolvement()
          : involvement(muscle: Muscle.biceps),
      tricepsInvolvement: tricepsInvolvement != null
          ? tricepsInvolvement()
          : involvement(muscle: Muscle.triceps),
      forearmInvolvement: forearmInvolvement != null
          ? forearmInvolvement()
          : involvement(muscle: Muscle.forearm),
      absInvolvement: absInvolvement != null
          ? absInvolvement()
          : involvement(muscle: Muscle.abs),
      obliquesInvolvement: obliquesInvolvement != null
          ? obliquesInvolvement()
          : involvement(muscle: Muscle.obliques),
      trapeziusInvolvement: trapeziusInvolvement != null
          ? trapeziusInvolvement()
          : involvement(muscle: Muscle.trapezius),
      lattisimusInvolvement: lattisimusInvolvement != null
          ? lattisimusInvolvement()
          : involvement(muscle: Muscle.lattisimus),
      teresMajorInvolvement: teresMajorInvolvement != null
          ? teresMajorInvolvement()
          : involvement(muscle: Muscle.teresMajor),
      erectorSpinaeInvolvement: erectorSpinaeInvolvement != null
          ? erectorSpinaeInvolvement()
          : involvement(muscle: Muscle.erectorSpinae),
      adductorsInvolvement: adductorsInvolvement != null
          ? adductorsInvolvement()
          : involvement(muscle: Muscle.adductors),
      abductorsInvolvement: abductorsInvolvement != null
          ? abductorsInvolvement()
          : involvement(muscle: Muscle.abductors),
      glutesInvolvement: glutesInvolvement != null
          ? glutesInvolvement()
          : involvement(muscle: Muscle.glutes),
      hamsteringInvolvement: hamsteringInvolvement != null
          ? hamsteringInvolvement()
          : involvement(muscle: Muscle.hamstering),
      quadricepsInvolvement: quadricepsInvolvement != null
          ? quadricepsInvolvement()
          : involvement(muscle: Muscle.quadriceps),
      calfInvolvement: calfInvolvement != null
          ? calfInvolvement()
          : involvement(muscle: Muscle.calf),
    );
  }

  /// Create body from `data`.
  ///
  /// Muscle -> MuscleInvolvement -> SeriesIntensity -> Number of series
  factory Body.fromData({
    required Map<Muscle, Map<double, Map<double, int>>> data,
  }) {
    int calculate({required Muscle muscle}) {
      final muscleData = data[muscle]!;
      if (muscleData.isEmpty) {
        return 0;
      }

      return InvolvementCalculator.calculate(
        muscle: muscle,
        data: muscleData,
      );
    }

    return Body(
      neckInvolvement: calculate(muscle: Muscle.neck),
      chestInvolvement: calculate(muscle: Muscle.chest),
      serratusInvolvement: calculate(muscle: Muscle.serratus),
      frontShouldersInvolvement: calculate(muscle: Muscle.frontShoulders),
      midShouldersInvolvement: calculate(muscle: Muscle.midShoulders),
      backShouldersInvolvement: calculate(muscle: Muscle.backShoulders),
      bicepsInvolvement: calculate(muscle: Muscle.biceps),
      tricepsInvolvement: calculate(muscle: Muscle.triceps),
      forearmInvolvement: calculate(muscle: Muscle.forearm),
      absInvolvement: calculate(muscle: Muscle.abs),
      obliquesInvolvement: calculate(muscle: Muscle.obliques),
      trapeziusInvolvement: calculate(muscle: Muscle.trapezius),
      lattisimusInvolvement: calculate(muscle: Muscle.lattisimus),
      teresMajorInvolvement: calculate(muscle: Muscle.teresMajor),
      erectorSpinaeInvolvement: calculate(muscle: Muscle.erectorSpinae),
      adductorsInvolvement: calculate(muscle: Muscle.adductors),
      abductorsInvolvement: calculate(muscle: Muscle.abductors),
      glutesInvolvement: calculate(muscle: Muscle.glutes),
      hamsteringInvolvement: calculate(muscle: Muscle.hamstering),
      quadricepsInvolvement: calculate(muscle: Muscle.quadriceps),
      calfInvolvement: calculate(muscle: Muscle.calf),
    );
  }

  @override
  List<Object?> get props => [_muscles];
}
