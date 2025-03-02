import '../repositories/auth_repository.dart';
import '../entities/user.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<AppUser?> call(String name, String email, String password) {
    return repository.signUp(name, email, password);
  }
}
