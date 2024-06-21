import 'package:flutter/material.dart';
import 'package:well_pass/src/config/theme.dart';
import 'package:well_pass/src/data/database_repository.dart';
import 'package:well_pass/src/features/authentication/presentation/authentication.dart';

class App extends StatelessWidget {
  final DatabaseRepository databaseRepository;
  const App(this.databaseRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: const MainScreen(),
      home: AuthScreen(databaseRepository),
      theme: lightTheme,
    );
  }
}
