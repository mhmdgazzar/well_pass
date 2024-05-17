import 'package:flutter/material.dart';
import 'package:well_pass/src/data/mock_database.dart';
import 'package:well_pass/src/features/wallet/presentation/wallet.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
                  Text(
                    "Hello ${userWallet.firstName}",
                    style: const TextStyle(
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
      //bottomNavigationBar: const BottomNavBar(),
    );
  }
}
