import 'package:flutter/cupertino.dart';

class PaymentRequestData {
  final TextEditingController documentController = TextEditingController();
  final TextEditingController documentTypeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phonesController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  void dispose() {
    // Dispose de todos los controladores y nodos de enfoque
    documentController.dispose();
    documentTypeController.dispose();
    nameController.dispose();
    emailController.dispose();
    phonesController.dispose();
    addressController.dispose();
    typeController.dispose();
    descriptionController.dispose();
    amountController.dispose();
  }
}