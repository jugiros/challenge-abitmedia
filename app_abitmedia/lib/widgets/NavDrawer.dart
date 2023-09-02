import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  NavDrawer({super.key});

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
                  Navigator.of(context).pop(),
                },
              ),
              ListTile(
                title: const Text('Link de pago'),
                leading: const Icon(Icons.link),
                onTap: () => {
                  Navigator.of(context).pop(),
                },
              ),
              ListTile(
                title: const Text('Solicitudes'),
                leading: const Icon(Icons.list),
                onTap: () => {
                  Navigator.of(context).pop(),
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
