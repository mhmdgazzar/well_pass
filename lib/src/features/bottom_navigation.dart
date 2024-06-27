import 'package:flutter/material.dart';
import 'package:well_pass/src/data/auth_repository.dart';
import 'package:well_pass/src/data/database_repository.dart';
import 'package:well_pass/src/features/account/presentation/account.dart';
import 'package:well_pass/src/features/connections/presentation/connections.dart';
import 'package:well_pass/src/features/main_screen/presentation/main_screen.dart';

class BottomNavBar extends StatefulWidget {
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;

  const BottomNavBar(
      {required this.databaseRepository,
      super.key,
      required this.authRepository});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        MainScreen(
          databaseRepository: widget.databaseRepository,
          authRepository: widget.authRepository,
        ),
        Connections(
          databaseRepository: widget.databaseRepository,
          authRepository: widget.authRepository,
        ),
        Account(
          databaseRepository: widget.databaseRepository,
          authRepository: widget.authRepository,
        )
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.wallet),
            label: "Wallet",
          ),
          NavigationDestination(
            icon: Icon(Icons.link),
            label: "Connections",
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: "Account",
          ),
        ],
        selectedIndex: currentPageIndex,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        indicatorColor: const Color.fromARGB(255, 238, 238, 238),
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
    );
  }
}
