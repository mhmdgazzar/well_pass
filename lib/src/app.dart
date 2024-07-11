import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:well_pass/src/config/theme.dart';
import 'package:well_pass/src/data/auth_repository.dart';
import 'package:well_pass/src/features/authentication/presentation/authentication.dart';
import 'package:well_pass/src/features/bottom_navigation.dart';

class App extends StatelessWidget {
  // attributes

  // constructor
  const App({
    super.key,
  });

  // methods
  @override
  Widget build(BuildContext context) {
    // keys
    const loginKey = ValueKey('auth');
    const mainScreenKey = ValueKey('mainScreen');

    return StreamBuilder(
        stream: context.read<AuthRepository>().authStateChanges(),
        builder: (context, snapshot) {
          final user = snapshot.data;
          return MaterialApp(
            key: user == null ? loginKey : mainScreenKey,
            home: user == null ? const AuthScreen() : const BottomNavBar(),
            theme: lightTheme,
          );
        });
  }
}
