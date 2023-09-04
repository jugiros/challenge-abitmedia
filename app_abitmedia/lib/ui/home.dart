import 'package:app_abitmedia/pages/PaymentLink.dart';
import 'package:app_abitmedia/pages/PaymentRequest.dart';
import 'package:app_abitmedia/ui/login.dart';
import 'package:app_abitmedia/widgets/NavDrawer.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  static final Box _boxLogin = Hive.box("login");
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(navigatorKey: _navigatorKey),
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
      // Utiliza un Navigator dentro del body
      body: Navigator(
        key: _navigatorKey,
        onGenerateRoute: (settings) {
          // Define las rutas y cómo se deben construir las vistas aquí
          if (settings.name == '/payment-request') {
            return MaterialPageRoute(
                builder: (context) => const PaymentRequestWidget());
          }
          if (settings.name == '/payment-link') {
            return MaterialPageRoute(
                builder: (context) => const PaymentLinkWidget());
          }
          // Agrega más rutas según sea necesario
          return MaterialPageRoute(
              builder: (context) =>
                  const PaymentRequestWidget()); // Cambia Placeholder() por tu vista predeterminada
        },
      ),
    );
  }
}
