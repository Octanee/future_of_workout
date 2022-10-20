import 'package:user_api/user_api.dart';

/// {@template user_api}
/// The interface and models for an API providing user data.
/// {@endtemplate}
abstract class UserApi {
  /// {@macro user_api}
  const UserApi();

  /// Get the user.
  ///
  /// If user are not found,
  /// a [UserNotFoundException] error is thrown.
  User get();

  /// Save a [User]
  Future<void> saveUser(User user);
}
