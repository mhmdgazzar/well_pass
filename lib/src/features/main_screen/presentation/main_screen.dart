import 'package:flutter/material.dart';
import 'package:well_pass/src/features/wallet/presentation/wallet.dart';

import '../../bottom_navigation.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 238, 238),
      bottomNavigationBar: const BottomNavBar(),
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
                    "Hello {Wallet.firstName}",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  ButtonBar(
                    children: [
                      IconButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.white),
                        ),
                        icon: const Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                        tooltip: "Add new wallet",
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 24),
              const Row(
                children: [Text("Wallets")],
              ),
              const SizedBox(
                height: 16,
              ),
              const Wallet(),
            ],
          ),
        ),
      ),
    );
  }
}
