import 'package:flutter/material.dart';
import 'package:well_pass/src/config/theme.dart';
import 'package:well_pass/src/features/authentication/presentation/authentication.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: const MainScreen(),
      home: const AuthScreen(),
      theme: lightTheme,
    );
  }
}
