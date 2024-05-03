import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Hello userName"),
                    ButtonBar(
                      children: [Icon(Icons.add)],
                    )
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: [Text("Wallets")],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
