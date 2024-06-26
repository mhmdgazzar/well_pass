import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:well_pass/firebase_options.dart';
import 'package:well_pass/src/app.dart';
import 'package:well_pass/src/data/database_repository.dart';
import 'package:well_pass/src/data/mock_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  DatabaseRepository mockDB = MockDatabase();
  runApp(App(mockDB));
}
