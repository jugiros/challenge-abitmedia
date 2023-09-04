import 'package:flutter/material.dart';

class ServiceInfoModal extends StatelessWidget {
  final String serviceInfo; // Información del servicio que se mostrará en el modal

  const ServiceInfoModal({super.key, required this.serviceInfo});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Enlace del proceso'),
      content: SingleChildScrollView(
        child: Text(
          serviceInfo,
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Cierra el modal al presionar el botón
          },
          child: const Text('Cerrar'),
        ),
      ],
    );
  }

  // Método estático para mostrar el modal
  static void show(BuildContext context, String serviceInfo) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ServiceInfoModal(serviceInfo: serviceInfo);
      },
    );
  }
}