import 'package:flutter/material.dart';

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
            children: [
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
