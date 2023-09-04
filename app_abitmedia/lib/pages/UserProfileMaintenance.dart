import 'package:app_abitmedia/entities/User.dart';
import 'package:app_abitmedia/ui/login.dart';
import 'package:app_abitmedia/utils/ApiServices.dart';
import 'package:app_abitmedia/utils/Endpoints.dart';
import 'package:app_abitmedia/utils/InputDecorationUtils.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:loading_btn/loading_btn.dart';

class UserProfileMaintenance extends StatefulWidget {

  const UserProfileMaintenance({super.key});

  @override
  _UserProfileMaintenanceState createState() => _UserProfileMaintenanceState();
}

class _UserProfileMaintenanceState extends State<UserProfileMaintenance> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final Box _boxLogin = Hive.box("login");
  User user = User('', '', '', '');

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    // Carga los datos del usuario al inicializar el widget.
    _loadUserData();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _loadUserData() async {
    try {
      final data = await ApiService.getUserData(Endpoints.updateUser, context);
      setState(() {
        user = User.fromJson(data);
        // Establece los valores de los controladores con los datos del usuario.
        _nameController.text = user.name;
        _lastNameController.text = user.lastName;
        _emailController.text = user.email;
      });
    } catch (error) {
      // Manejar el error, mostrar un mensaje, etc.
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Text(
                "Perfil de usuario",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: InputDecorationUtils.buildInputDecoration(
                    'Nombre', Icons.person),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa tu nombre';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecorationUtils.buildInputDecoration(
                    'Apellido', Icons.person),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa tu apellido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecorationUtils.buildInputDecoration(
                    'Correo electrónico', Icons.email),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa tu correo electrónico';
                  } else if (!(value.contains('@') && value.contains('.'))) {
                    return "Ingresa un correo válido";
                  }
                  // Puedes agregar más validaciones de correo electrónico si es necesario.
                  return null;
                },
              ),
              const SizedBox(height: 20),
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
                      final updatedUser = User(
                        _nameController.text,
                        _lastNameController.text,
                        _emailController.text,
                        _passwordController.text,
                      );
                      stopLoading();
                      _boxLogin.clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const Login();
                          },
                        ),
                      );
                    }
                  }
                }),
                child: const Text("Guardar cambios"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}