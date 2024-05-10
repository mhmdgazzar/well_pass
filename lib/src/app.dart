import 'package:flutter/material.dart';
import 'package:well_pass/src/features/bottom_navigation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                    const Text("Hello userName"),
                    ButtonBar(
                      children: [
                        IconButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                          icon: const Icon(Icons.add),
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
                Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
