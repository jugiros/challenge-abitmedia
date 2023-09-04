import 'package:flutter/cupertino.dart';

class PaymentRequestData {
  final TextEditingController documentController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phonesController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  void dispose() {
    // Dispose de todos los controladores y nodos de enfoque
    documentController.dispose();
    nameController.dispose();
    emailController.dispose();
    phonesController.dispose();
    addressController.dispose();
    descriptionController.dispose();
    amountController.dispose();
  }
}