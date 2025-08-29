import 'package:flutter/material.dart';
import 'package:hesapkitap/core/theme/app_theme.dart';
import 'package:hesapkitap/features/auth/forgot_password_page.dart';
import 'package:hesapkitap/features/auth/login_page.dart';
import 'package:hesapkitap/features/auth/signup_page.dart';
import 'package:hesapkitap/features/splash/splash_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HesapKitap',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Sisteme göre tema seçimi
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/forgot_password': (context) => const ForgotPasswordPage(),
      },
    );
  }
}
