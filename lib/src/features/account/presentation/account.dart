import 'package:flutter/material.dart';
import 'package:well_pass/src/features/authentication/presentation/authentication.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 238, 238),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Account",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll<Color>(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AuthScreen()),
                      );
                    },
                    tooltip: "Logout",
                    icon: const Icon(
                      Icons.logout,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
