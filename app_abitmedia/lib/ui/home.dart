import 'package:app_abitmedia/ui/login.dart';
import 'package:app_abitmedia/widgets/NavDrawer.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MyHomePage extends StatelessWidget {

  const MyHomePage({super.key});
  static Box _boxLogin = Hive.box("login");

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: const Text('Bienvenido'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.exit_to_app,
              size: 26.0,
            ),
            onPressed: () {
              _boxLogin.clear();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const Login();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}