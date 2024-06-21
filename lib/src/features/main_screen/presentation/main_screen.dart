import 'package:flutter/material.dart';
import 'package:well_pass/src/data/mock_database.dart';
import 'package:well_pass/src/features/wallet/presentation/wallet.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<Widget>? wallet;

  Future<Widget> getWallet() async {
    await Future.delayed(const Duration(seconds: 2));
    return const Wallet();
  }

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
                  IconButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll<Color>(Colors.white),
                    ),
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    tooltip: "Add new wallet",
                    onPressed: () {},
                  )
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Wallets"),
                  IconButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll<Color>(Colors.white),
                      ),
                      onPressed: () async {
                        await getWallet();
                      },
                      icon: const Icon(Icons.refresh)),
                ],
              ),
              const SizedBox(height: 16),
              RefreshIndicator(
                onRefresh: getWallet,
                child: FutureBuilder<Widget>(
                  future: getWallet(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return const Wallet();
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
