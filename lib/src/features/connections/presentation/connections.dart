import 'package:flutter/material.dart';
import 'package:well_pass/src/data/auth_repository.dart';
import 'package:well_pass/src/data/database_repository.dart';

class Connections extends StatelessWidget {
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;

  const Connections(
      {required this.databaseRepository,
      super.key,
      required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Connections"),
    );
  }
}
