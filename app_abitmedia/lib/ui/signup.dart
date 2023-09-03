import 'package:app_abitmedia/entities/User.dart';
import 'package:app_abitmedia/models/RegisterData.dart';
import 'package:app_abitmedia/utils/ApiServices.dart';
import 'package:flutter/material.dart';
import 'package:loading_btn/loading_btn.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  RegisterData registerData = RegisterData();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const SizedBox(height: 100),
              Text(
                "Regístrate",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 35),
              TextFormField(
                controller: registerData.controllerName,
                keyboardType: TextInputType.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  labelText: "Nombres",
                  suffixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Ingresa tus dos nombres.";
                  }

                  return null;
                },
                onEditingComplete: () =>
                    registerData.focusNodeEmail.requestFocus(),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: registerData.controllerSurename,
                keyboardType: TextInputType.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  labelText: "Apellidos",
                  suffixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Ingresa tus dos apellidos.";
                  }

                  return null;
                },
                onEditingComplete: () =>
                    registerData.focusNodeEmail.requestFocus(),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: registerData.controllerEmail,
                focusNode: registerData.focusNodeEmail,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  labelText: "Correo electrónico",
                  suffixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Ingresa tu correo electrónico.";
                  } else if (!(value.contains('@') && value.contains('.'))) {
                    return "Ingresa un correo válido";
                  }
                  return null;
                },
                onEditingComplete: () =>
                    registerData.focusNodePassword.requestFocus(),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: registerData.controllerPassword,
                obscureText: _obscurePassword,
                focusNode: registerData.focusNodePassword,
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
                  } else if (value.length < 8) {
                    return "La contraseña debe tener al menos 8 caracteres.";
                  }
                  return null;
                },
                onEditingComplete: () =>
                    registerData.focusNodeConfirmPassword.requestFocus(),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: registerData.controllerConFirmPassword,
                obscureText: _obscurePassword,
                focusNode: registerData.focusNodeConfirmPassword,
                keyboardType: TextInputType.visiblePassword,
                style: const TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  labelText: "Confirmar Contraseña",
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
                    return "Ingresa la cofirmación de tu contraseña.";
                  } else if (value != registerData.controllerPassword.text) {
                    return "Las contraseñas no coinciden.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 50),
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
                          User user = User(
                              registerData.controllerName.text,
                              registerData.controllerSurename.text,
                              registerData.controllerEmail.text,
                              registerData.controllerPassword.text);
                          await ApiService.register(user, context);
                          _formKey.currentState?.reset();
                          stopLoading();
                        }
                      }
                    }),
                    child: const Text("Regístrate"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("¿Ya tienes una cuenta?"),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Iniciar sesión"),
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
    registerData.dispose();
    super.dispose();
  }
}
