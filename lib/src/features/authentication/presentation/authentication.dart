import 'package:flutter/material.dart';
import 'package:well_pass/src/features/bottom_navigation.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  bool clickable = false;
  bool _pwdVisibility = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 239, 238, 238),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 64),
                const Image(
                  image: AssetImage(
                    '/Users/gazzar/Downloads/dart/well_pass/assets/Wellpass_logo.png',
                  ),
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: _loginFormKey,
                    onChanged: () {
                      setState(() {
                        clickable =
                            _loginFormKey.currentState?.validate() ?? false;
                      });
                    },
                    child: Column(
                      children: [
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: validateEmail,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            labelText: "Email",
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: validatePwd,
                          obscureText: _pwdVisibility,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: "Password",
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _pwdVisibility = !_pwdVisibility;
                                  });
                                },
                                icon: const Icon(Icons.visibility)),
                          ),
                        ),
                        const SizedBox(height: 32),
                        SizedBox(
                          width: 250,
                          child: OutlinedButton(
                            onPressed: () {
                              clickable
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const BottomNavBar()),
                                    )
                                  : () {};
                            },
                            child: const Text("Login"),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

String? validatePwd(String? input) {
  if (input == null || input.isEmpty) {
    return "Passwort kann nicht leer sein";
  } else if (input.length < 8) {
    return "Passwort muss minimum 8 Zeichen lang sein";
  } else {
    return null;
  }
}

bool validateEmailFn(String email) {
  final emailRegex = RegExp(
      r"[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.[a-zA-Z]{2,}");
  return emailRegex.hasMatch(email);
}

String? validateEmail(String? input) {
  if (validateEmailFn(input!) || input.isEmpty) {
    return null;
  } else {
    return "Bitte eine valide E-Mail-Adresse eingeben";
  }
}
