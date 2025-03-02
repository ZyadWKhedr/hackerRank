import 'package:flutter/material.dart';
import 'package:hackerrank/app_router.dart';
import 'package:hackerrank/core/theme/app_themes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://your-supabase-url.supabase.co",
    anonKey: "your-anon-key",
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
       theme: AppTheme.lightTheme, // Default: Light Theme
      darkTheme: AppTheme.darkTheme, // Dark Theme
      themeMode: ThemeMode.system, // Auto switch based on system setting
    );
  }
}
