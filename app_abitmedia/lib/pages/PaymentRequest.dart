import 'package:app_abitmedia/entities/PaymentRequestEntity.dart';
import 'package:app_abitmedia/models/PaymentRequestData.dart';
import 'package:app_abitmedia/utils/ApiServices.dart';
import 'package:app_abitmedia/utils/InputDecorationUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_btn/loading_btn.dart';

class PaymentRequestWidget extends StatefulWidget {
  const PaymentRequestWidget({super.key});

  @override
  _PaymentRequestWidgetState createState() => _PaymentRequestWidgetState();
}

class _PaymentRequestWidgetState extends State<PaymentRequestWidget> {
  final PaymentRequestData paymentData = PaymentRequestData();
  final GlobalKey<FormState> _formKey = GlobalKey();

  String _selectedUserTypeOption = 'Individual';
  String _selectedDocumentTypeOption = '05';

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
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .primaryContainer,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text(
                "Genera una solicitud de pago",
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: paymentData.nameController,
                keyboardType: TextInputType.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecorationUtils.buildInputDecoration(
                    'Nombre del beneficiario', Icons.person),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Ingresa el nombre.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: paymentData.emailController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecorationUtils.buildInputDecoration(
                    'Correo electrónico', Icons.email),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Ingresa el correo electrónico.";
                  } else if (!(value.contains('@') && value.contains('.'))) {
                    return "Ingresa un correo válido";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: paymentData.phonesController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecorationUtils.buildInputDecoration(
                    'Celular', Icons.phone),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Ingresa el teléfono celular.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: paymentData.addressController,
                keyboardType: TextInputType.streetAddress,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecorationUtils.buildInputDecoration(
                    'Dirección', Icons.directions),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Ingresa la dirección.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87
                ),
                decoration: const InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(
                      20.0, 10.0, 20.0, 10.0),
                  labelText: 'Tipo de usuario',
                  border: OutlineInputBorder(
                    borderSide: BorderSide( // Configura el borde inferior
                      color: Colors
                          .transparent, // Color transparente para eliminar el borde inferior
                    ),
                  ),
                ),
                value: _selectedUserTypeOption,
                items: [
                  {'value': 'Individual', 'text': 'Persona natural'},
                  {'value': 'Company', 'text': 'Empresa'},
                ].map<DropdownMenuItem<String>>((dynamic option) {
                  return DropdownMenuItem<String>(
                    value: option['value'],
                    child: Text(option['text']),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedUserTypeOption = newValue!;
                  });
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87
                ),
                decoration: const InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(
                      20.0, 10.0, 20.0, 10.0),
                  labelText: 'Tipo de documento',
                  border: OutlineInputBorder(
                    borderSide: BorderSide( // Configura el borde inferior
                      color: Colors
                          .transparent, // Color transparente para eliminar el borde inferior
                    ),
                  ),
                ),
                value: _selectedDocumentTypeOption,
                items: [
                  {'value': '04', 'text': 'RUC'},
                  {'value': '05', 'text': 'Cédula ecuatoriana'},
                  {'value': '06', 'text': 'Pasaporte'},
                  {'value': '08', 'text': 'Identificación del exterior'},
                ].map<DropdownMenuItem<String>>((dynamic option) {
                  return DropdownMenuItem<String>(
                    value: option['value'],
                    child: Text(option['text']),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedDocumentTypeOption = newValue!;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: paymentData.documentController,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecorationUtils.buildInputDecoration(
                    'Documento de identidad', Icons.numbers),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Ingresa el teléfono celular.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: paymentData.amountController,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecorationUtils.buildInputDecoration(
                    'Cantidad', Icons.money),
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
                decoration: InputDecorationUtils.buildInputDecoration(
                    'Descripción', Icons.text_fields),
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
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
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
                          Third third = Third(
                              paymentData.documentController.text,
                              _selectedDocumentTypeOption,
                              paymentData.nameController.text,
                              paymentData.emailController.text,
                              paymentData.phonesController.text,
                              paymentData.addressController.text,
                              _selectedUserTypeOption);
                          double amountWithTax = double.parse(
                              paymentData.amountController.text) / 2;
                          double taxValue = (double.parse(
                              paymentData.amountController.text) / 2) * 0.12;
                          PaymentRequestEntity paymentReques = PaymentRequestEntity(
                              true,
                              third,
                              0,
                              paymentData.descriptionController.text,
                              (amountWithTax * 2) + taxValue,
                              amountWithTax,
                              amountWithTax,
                              taxValue,
                              null,
                              null,
                              0,
                              1);
                          await ApiService.paymentRequest(paymentReques,
                              context);
                          _formKey.currentState?.reset();
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
