import 'package:flutter/cupertino.dart';

class PaymentLinkData {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  void dispose() {
    // Dispose de todos los controladores y nodos de enfoque
    descriptionController.dispose();
    amountController.dispose();
  }
}