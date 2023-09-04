import 'package:app_abitmedia/pages/paymentRequest.dart';
import 'package:flutter/material.dart';

import 'ui/login.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(30, 40, 171, 1.0),
        ),
      ),
      routes: {
        '/payment-request': (context) => const PaymentRequestWidget(),
      },
      home: const Login(),
    );
  }
}
