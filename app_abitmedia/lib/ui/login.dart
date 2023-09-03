import 'package:app_abitmedia/models/LoginData.dart';
import 'package:app_abitmedia/utils/ApiServices.dart';
import 'package:loading_btn/loading_btn.dart';
import 'package:flutter/material.dart';

import 'signup.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  LoginData loginData = LoginData();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/logo.png',
                width: 248,
              ),
              const SizedBox(height: 50),
              TextFormField(
                controller: loginData.emailController,
                keyboardType: TextInputType.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  labelText: "Usuario",
                  suffixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onEditingComplete: () => loginData.passwordFocusNode,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Ingresa tu usuario.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: loginData.passwordController,
                focusNode: loginData.passwordFocusNode,
                obscureText: _obscurePassword,
                keyboardType: TextInputType.visiblePassword,
                style: const TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  labelText: "Contraseña",
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: _obscurePassword
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_outlined)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Ingresa tu contraseña.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 60),
              Column(
                children: [
                  LoadingBtn(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    borderRadius: 10,
                    loader: Container(
                      padding: const EdgeInsets.all(10.0),
                      width: 40,
                      height: 40,
                      child: const CircularProgressIndicator(
                        valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                    onTap: ((startLoading, stopLoading, btnState) async {
                      if (btnState == ButtonState.idle) {
                        if (_formKey.currentState?.validate() ?? false) {
                          startLoading();
                          await ApiService.login(loginData, context);
                          stopLoading();
                        }
                      }
                    }),
                    child: const Text("Iniciar sesión"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("¿No tienes una cuenta?"),
                      TextButton(
                        onPressed: () {
                          _formKey.currentState?.reset();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const Signup();
                              },
                            ),
                          );
                        },
                        child: const Text("Regístrate"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    loginData.dispose();
    super.dispose();
  }
}
