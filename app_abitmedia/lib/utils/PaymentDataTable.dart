import 'package:flutter/material.dart';

class PaymentDataTable extends StatelessWidget {
  final List<Map<String, dynamic>> paymentDataList; // Lista de datos de pago

  const PaymentDataTable({super.key, required this.paymentDataList});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text('Estado'),
        ),
        DataColumn(
          label: Text('Descripción'),
        ),
        DataColumn(
          label: Text('Cantidad'),
        ),
      ],
      rows: paymentDataList.map((paymentData) {
        return DataRow(
          cells: <DataCell>[
            DataCell(
              Text(paymentData['status'] != null ? paymentData['status'].toString() : 'Sin estado'), // Campo 'status'
            ),
            DataCell(
              Text(paymentData['description'].toString()), // Campo 'description'
            ),
            DataCell(
              Text(paymentData['amount'].toString()), // Campo 'amount'
            ),
          ],
        );
      }).toList(),
    );
  }
}