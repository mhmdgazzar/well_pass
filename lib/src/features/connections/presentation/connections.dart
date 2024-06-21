import 'package:flutter/material.dart';
import 'package:well_pass/src/data/database_repository.dart';

class Connections extends StatelessWidget {
  final DatabaseRepository databaseRepository;

  const Connections(this.databaseRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Connections"),
    );
  }
}
