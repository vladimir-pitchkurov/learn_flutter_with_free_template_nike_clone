import 'package:flutter/material.dart';
import 'package:nike_clone/core/theme/app_theme.dart';
import 'package:nike_clone/features/auth/presentation/screens/signup_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nike Clone',
      theme: AppTheme.darkTheme,
      home: const SignUpScreen(),
    );
  }
}