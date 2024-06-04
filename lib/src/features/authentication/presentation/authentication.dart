import 'package:flutter/material.dart';
import 'package:well_pass/src/features/bottom_navigation.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 238, 238),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 64),
              const Image(image: AssetImage('assets/images/WellPass-Logo.png')),
              const SizedBox(height: 64),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Email",
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Password",
                        suffixIcon: Icon(Icons.visibility),
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: 250,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BottomNavBar()),
                          );
                        },
                        child: const Text("Login"),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
