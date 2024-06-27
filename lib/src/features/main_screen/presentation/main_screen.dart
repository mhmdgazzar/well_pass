import 'package:flutter/material.dart';
import 'package:well_pass/src/data/auth_repository.dart';
import 'package:well_pass/src/data/database_repository.dart';
import 'package:well_pass/src/data/mock_database.dart';
import 'package:well_pass/src/features/wallet/domain/wallet.dart';
import 'package:well_pass/src/features/wallet/presentation/wallet.dart';

class MainScreen extends StatefulWidget {
  // attributes
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;

  const MainScreen({
    super.key,
    required this.databaseRepository,
    required this.authRepository,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
                        // await getWallet();
                      },
                      icon: const Icon(Icons.refresh)),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: FutureBuilder(
                  future: widget.databaseRepository.getUserWallets(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Wallet> wallets = snapshot.data!;
                      return ListView.builder(
                        itemCount: wallets.length,
                        itemBuilder: (context, index) {
                          // jedes Wallett
                          Wallet currentWallet = wallets[index];
                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: WalletCard(currentWallet),
                          );
                        },
                      );
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
