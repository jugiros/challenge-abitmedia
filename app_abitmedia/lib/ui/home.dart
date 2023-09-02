import 'package:app_abitmedia/ui/login.dart';
import 'package:app_abitmedia/widgets/NavDrawer.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: const Text('Bienvenido'),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Login();
                      },
                    ),
                  );
                },
                child: const Icon(
                  Icons.exit_to_app,
                  size: 26.0,
                ),
              )
          ),
        ],
      ),
    );
  }
}