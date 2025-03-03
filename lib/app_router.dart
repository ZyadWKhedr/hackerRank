import 'package:go_router/go_router.dart';
import 'package:hackerrank/presentation/pages/auth/sign_up_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => SignUpPage()),
  ],
);
