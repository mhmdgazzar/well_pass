import 'package:flutter/material.dart';
import 'package:well_pass/src/config/theme.dart';
import 'package:well_pass/src/data/auth_repository.dart';
import 'package:well_pass/src/data/database_repository.dart';
import 'package:well_pass/src/features/authentication/presentation/authentication.dart';
import 'package:well_pass/src/features/main_screen/presentation/main_screen.dart';

class App extends StatelessWidget {
  // attributes
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;

  // constructor
  const App({
    super.key,
    required this.databaseRepository,
    required this.authRepository,
  });

  // methods
  @override
  Widget build(BuildContext context) {
    // keys
    const loginKey = ValueKey('auth');
    const mainScreenKey = ValueKey('mainScreen');

    return StreamBuilder(
        stream: authRepository.authStateChanges(),
        builder: (context, snapshot) {
          final user = snapshot.data;
          return MaterialApp(
            key: user == null ? loginKey : mainScreenKey,
            home: user == null
                ? AuthScreen(
                    databaseRepository: databaseRepository,
                    authRepository: authRepository,
                  )
                : MainScreen(
                    databaseRepository: databaseRepository,
                    authRepository: authRepository,
                  ),
            theme: lightTheme,
          );
        });
  }
}
