import 'package:app_abitmedia/models/PaymentLinkData.dart';
import 'package:app_abitmedia/utils/InputDecorationUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_btn/loading_btn.dart';

class PaymentLinkWidget extends StatefulWidget {
  const PaymentLinkWidget({super.key});

  @override
  _PaymentLinkWidgetState createState() => _PaymentLinkWidgetState();
}

class _PaymentLinkWidgetState extends State<PaymentLinkWidget> {
  final PaymentLinkData paymentData = PaymentLinkData();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    paymentData
        .dispose(); // Llama al método dispose cuando el widget se dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Aquí puedes construir tu interfaz de usuario utilizando los controladores de texto
    // Ejemplo:
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text(
                "Genera un link de pago",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: paymentData.amountController,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecorationUtils.buildInputDecoration('Cantidad', Icons.money),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Ingresa el teléfono celular.";
                  }
                  // Expresión regular para validar números decimales con dos decimales después del punto
                  final RegExp decimalRegExp = RegExp(r'^\d+(\.\d{1,2})?$');
                  if (!decimalRegExp.hasMatch(value)) {
                    return "Ingresa un número decimal válido con hasta dos decimales.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: paymentData.descriptionController,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecorationUtils.buildInputDecoration('Descripción', Icons.text_fields),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Ingresa la descripción.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
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
                          // await ApiService.login(loginData, context);
                          stopLoading();
                        }
                      }
                    }),
                    child: const Text("Generar Solicitud"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
