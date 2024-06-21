import 'package:flutter/material.dart';
import 'package:well_pass/src/app.dart';
import 'package:well_pass/src/data/database_repository.dart';
import 'package:well_pass/src/data/mock_database.dart';

void main() {
  DatabaseRepository mockDB = MockDatabase();
  runApp(App(mockDB));
}
