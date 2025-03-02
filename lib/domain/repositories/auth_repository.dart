import 'package:hackerrank/domain/entities/user.dart';

abstract class AuthRepository {
  Future<AppUser?> signUp(String name, String email, String password);
  Future<AppUser?> signIn(String email, String password);
  Future<AppUser?> getCurrentUser();
  Future<void> signOut();
}
