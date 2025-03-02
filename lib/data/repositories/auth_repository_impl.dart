import 'package:hackerrank/data/data_sources/auth_remote_data_source.dart';
import 'package:hackerrank/domain/entities/user.dart';

import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<AppUser?> signUp(String name, String email, String password) {
    return remoteDataSource.signUp(name, email, password);
  }

  @override
  Future<AppUser?> signIn(String email, String password) {
    return remoteDataSource.signIn(email, password);
  }

  @override
  Future<AppUser?> getCurrentUser() {
    return remoteDataSource.getCurrentUser();
  }

  @override
  Future<void> signOut() {
    return remoteDataSource.signOut();
  }
}
