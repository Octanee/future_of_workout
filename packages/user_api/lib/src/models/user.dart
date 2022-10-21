import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:user_api/user_api.dart';

part 'user.g.dart';

/// {@template user}
/// Object of user.
///
/// Contains user [age], [height], [weight] and [gender].
/// [height] should be saved in centimeters.
/// [weight] should be saved in kilograms.
///
/// Also includes prefered unit types of length and weight.
///
/// [User] are immutable and can be copied using [copyWith],
/// in addition to being serialized and desarialized using [toJson]
/// and [User.fromJson] respectively.
/// {@endtemplate}
@immutable
@JsonSerializable()
class User extends Equatable {
  /// {@macro user}
  const User({
    this.age = 18,
    this.height = 180,
    this.weight = 75,
    this.gender = Gender.male,
    this.lengthUnit = LengthUnit.centimeter,
    this.weightUnit = WeightUnit.kilogram,
  });

  /// Height of user.
  ///
  /// Saved in centimeters.
  final double height;

  /// Current weight of user.
  ///
  /// Saved in kilograms.
  final double weight;

  /// Age of user.
  final int age;

  /// User gender.
  final Gender gender;

  /// The preferred unit of length.
  final LengthUnit lengthUnit;

  /// The preferred unit of weight
  final WeightUnit weightUnit;

  /// Copy instance of object with given values.
  ///
  /// {@macro user}
  User copyWith({
    double? height,
    double? weight,
    int? age,
    Gender? gender,
    LengthUnit? lengthUnit,
    WeightUnit? weightUnit,
  }) {
    return User(
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      lengthUnit: lengthUnit ?? this.lengthUnit,
      weightUnit: weightUnit ?? this.weightUnit,
    );
  }

  /// Deserializes the given [JsonMap] into a [User].
  factory User.fromJson(JsonMap json) => _$UserFromJson(json);

  /// Converts this [User] into a [JsonMap].
  JsonMap toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [
        height,
        weight,
        age,
        gender,
        lengthUnit,
        weightUnit,
      ];
}
