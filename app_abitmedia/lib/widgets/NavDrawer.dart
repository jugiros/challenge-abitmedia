import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey; // Declara navigatorKey
  NavDrawer({required this.navigatorKey}); // Elimina const del constructor

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
          child: Image.asset(
            'assets/images/banner.png',
            width: 358,
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                title: const Text('Solicitud de pago'),
                leading: const Icon(Icons.monetization_on),
                onTap: () => {
                  if (navigatorKey.currentState!.canPop())
                    {
                      navigatorKey.currentState
                          ?.pushReplacementNamed('/payment-request')
                    }
                  else
                    {navigatorKey.currentState?.pushNamed('/payment-request')},
                  Navigator.of(context).pop()
                },
              ),
              ListTile(
                title: const Text('Link de pago'),
                leading: const Icon(Icons.link),
                onTap: () => {
                  if (navigatorKey.currentState!.canPop())
                    {
                      navigatorKey.currentState
                          ?.pushReplacementNamed('/payment-link')
                    }
                  else
                    {navigatorKey.currentState?.pushNamed('/payment-link')},
                  Navigator.of(context).pop()
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
