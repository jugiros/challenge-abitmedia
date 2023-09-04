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
                title: const Text('Perfil de usuario'),
                leading: const Icon(Icons.person),
                onTap: () => {
                  if (navigatorKey.currentState!.canPop())
                    {
                      navigatorKey.currentState
                          ?.pushReplacementNamed('/profile')
                    }
                  else
                    {navigatorKey.currentState?.pushNamed('/profile')},
                  Navigator.of(context).pop()
                },
              ),
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
              ListTile(
                title: const Text('Lista de solicitudes de pago'),
                leading: const Icon(Icons.list),
                onTap: () => {
                  if (navigatorKey.currentState!.canPop())
                    {
                      navigatorKey.currentState
                          ?.pushReplacementNamed('/payment-request-list')
                    }
                  else
                    {navigatorKey.currentState?.pushNamed('/payment-request-list')},
                  Navigator.of(context).pop()
                },
              ),
              ListTile(
                title: const Text('Lista de enlaces de pago'),
                leading: const Icon(Icons.list_alt),
                onTap: () => {
                  if (navigatorKey.currentState!.canPop())
                    {
                      navigatorKey.currentState
                          ?.pushReplacementNamed('/payment-link-list')
                    }
                  else
                    {navigatorKey.currentState?.pushNamed('/payment-link-list')},
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
