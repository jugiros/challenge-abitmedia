import 'package:app_abitmedia/utils/ApiServices.dart';
import 'package:app_abitmedia/utils/Endpoints.dart';
import 'package:app_abitmedia/utils/PaymentDataTable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentRequestList extends StatefulWidget {
  const PaymentRequestList({super.key});

  @override
  _PaymentRequestListState createState() => _PaymentRequestListState();
}

class _PaymentRequestListState extends State<PaymentRequestList> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  List<Map<String, dynamic>> paymentDataList = [];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _loadPaymentDataList();
  }

  Future<void> _loadPaymentDataList() async {
    try {
      final data = await ApiService.getList(Endpoints.paymentRequest, context);
      setState(() {
        paymentDataList = data;
      });
    } catch (error) {
      // Manejar el error, mostrar un mensaje, etc.
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text(
                "Lista de las solicitudes de pago",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              PaymentDataTable(paymentDataList: paymentDataList)
            ],
          ),
        ),
      ),
    );
  }
}
