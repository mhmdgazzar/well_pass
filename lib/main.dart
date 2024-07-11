import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:well_pass/firebase_options.dart';
import 'package:well_pass/src/app.dart';
import 'package:well_pass/src/data/auth_repository.dart';
import 'package:well_pass/src/data/database_repository.dart';
import 'package:well_pass/src/data/mock_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // database
  DatabaseRepository databaseRepository = MockDatabase();

  // authentication
  AuthRepository authRepository = AuthRepository(FirebaseAuth.instance);

  // run App
  runApp(
    MultiProvider(
      providers: [
        Provider<DatabaseRepository>(
          create: (_) => databaseRepository,
        ),
        Provider<AuthRepository>(
          create: (_) => authRepository,
        ),
      ],
      child: const App(),
    ),
  );
}
