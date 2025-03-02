import 'package:hackerrank/domain/entities/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRemoteDataSource {
  final SupabaseClient supabase = Supabase.instance.client;

  // ✅ Sign up
  Future<AppUser?> signUp(String name, String email, String password) async {
    final response = await supabase.auth.signUp(
      email: email,
      password: password,
      data: {'name': name}, // Store name in metadata
    );

    if (response.user != null) {
      return AppUser(
        id: response.user!.id,
        name: name,
        email: email,
      );
    }
    return null;
  }

  // ✅ Login
  Future<AppUser?> signIn(String email, String password) async {
    final response = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user != null) {
      final user = response.user!;
      final name = user.userMetadata?['name'] ?? 'Unknown';
      return AppUser(id: user.id, name: name, email: user.email!);
    }
    return null;
  }

  // ✅ Get current user
  Future<AppUser?> getCurrentUser() async {
    final user = supabase.auth.currentUser;
    if (user != null) {
      final name = user.userMetadata?['name'] ?? 'Unknown';
      return AppUser(id: user.id, name: name, email: user.email!);
    }
    return null;
  }

  // ✅ Logout
  Future<void> signOut() async {
    await supabase.auth.signOut();
  }
}
