import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackerrank/data/data_sources/auth_remote_data_source.dart';
import 'package:hackerrank/domain/entities/user.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';

// ✅ Create repository provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(AuthRemoteDataSource());
});

// ✅ Sign-up provider
final signUpProvider = FutureProvider.family<AppUser?, Map<String, String>>((ref, data) async {
  final authRepo = ref.read(authRepositoryProvider);
  return await authRepo.signUp(data['name']!, data['email']!, data['password']!);
});

// ✅ Login provider
final signInProvider = FutureProvider.family<AppUser?, Map<String, String>>((ref, data) async {
  final authRepo = ref.read(authRepositoryProvider);
  return await authRepo.signIn(data['email']!, data['password']!);
});

// ✅ Logout provider
final signOutProvider = FutureProvider<void>((ref) async {
  final authRepo = ref.read(authRepositoryProvider);
  await authRepo.signOut();
});

// ✅ User state provider
final userProvider = FutureProvider<AppUser?>((ref) async {
  final authRepo = ref.read(authRepositoryProvider);
  return await authRepo.getCurrentUser();
});
