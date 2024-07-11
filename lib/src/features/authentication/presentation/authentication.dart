import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:well_pass/src/data/auth_repository.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({
    super.key,
  });

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  bool clickable = false;
  bool _pwdVisibility = true;
  late TextEditingController _emailController;
  late TextEditingController _pwController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _pwController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: DefaultTabController(
        length: 2,
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
                      'assets/images/Wellpass_logo.png',
                    ),
                  ),
                  const SizedBox(height: 32),
                  const TabBar(
                    tabs: [
                      Tab(
                        text: 'Login',
                      ),
                      Tab(
                        text: 'Signup',
                      ),
                    ],
                  ),
                  Expanded(
                      child: TabBarView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Form(
                          key: _loginFormKey,
                          onChanged: () {
                            setState(() {
                              clickable =
                                  _loginFormKey.currentState?.validate() ??
                                      false;
                            });
                          },
                          child: Column(
                            children: [
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: validateEmail,
                                controller: _emailController,
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
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: validatePwd,
                                controller: _pwController,
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
                                  onPressed: () async {
                                    await context
                                        .read<AuthRepository>()
                                        .loginWithEmailAndPassword(
                                          _emailController.text,
                                          _pwController.text,
                                        );
                                  },
                                  child: const Text("Login"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Form(
                          key: _signUpFormKey,
                          onChanged: () {
                            setState(() {
                              clickable =
                                  _signUpFormKey.currentState?.validate() ??
                                      false;
                            });
                          },
                          child: Column(
                            children: [
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: validateEmail,
                                controller: _emailController,
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
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: validatePwd,
                                controller: _pwController,
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
                                  onPressed: () async {
                                    const SnackBar(
                                      content: Text("Account erstellt"),
                                    );
                                    await context
                                        .read<AuthRepository>()
                                        .signUpWithEmailAndPassword(
                                          _emailController.text,
                                          _pwController.text,
                                        );
                                    const SnackBar(
                                      content: Text("Account erstellt"),
                                    );
                                  },
                                  child: const Text("Sign Up"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
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
}
